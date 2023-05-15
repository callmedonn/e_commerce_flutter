import 'dart:convert';

import 'package:hive/hive.dart';

import 'tag.dart';

part 'order.g.dart';

List<Order> popularOrderListFromJson(String val) => List<Order>.from(
    json.decode(val)['data'].map((val) => Order.popularOrderFromJson(val)));

List<Order> orderListFromJson(String val) => List<Order>.from(
    json.decode(val)['data'].map((val) => Order.orderFromJson(val)));

@HiveType(typeId: 3)
class Order {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final List<String> images;
  @HiveField(4)
  final List<Tag> tags;

  Order(
      {required this.id,
      required this.name,
      required this.description,
      required this.images,
      required this.tags});

  factory Order.popularOrderFromJson(Map<String, dynamic> data) => Order(
      id: data['id'],
      name: data['attributes']['order']['data']['attributes']['name'],
      description: data['attributes']['order']['data']['attributes']
          ['description'],
      images: List<String>.from(data['attributes']['order']['data']
              ['attributes']['images']['data']
          .map((image) => image['attributes']['url'])),
      tags: []);

  factory Order.orderFromJson(Map<String, dynamic> data) => Order(
      id: data['attributes']['product']['data']['id'],
      name: data['attributes']['product']['data']['attributes']['name'],
      description: data['attributes']['product']['data']['attributes']
          ['description'],
      images: List<String>.from(data['attributes']['product']['data']
              ['attributes']['images']['data']
          .map((image) => image['attributes']['url'])),
      tags: List<Tag>.from(data['attributes']['product']['data']['attributes']
              ['tags']['data']
          .map((val) => Tag.fromJson(val))));
}
