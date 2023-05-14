import 'dart:convert';

import 'package:hive/hive.dart';

import 'tag.dart';

part 'cart.g.dart';

List<Cart> popularCartListFromJson(String val) => List<Cart>.from(
    json.decode(val)['data'].map((val) => Cart.popularCartFromJson(val)));

List<Cart> cartListFromJson(String val) => List<Cart>.from(
    json.decode(val)['data'].map((val) => Cart.cartFromJson(val)));

@HiveType(typeId: 3)
class Cart {
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

  Cart(
      {required this.id,
      required this.name,
      required this.description,
      required this.images,
      required this.tags});

  factory Cart.popularCartFromJson(Map<String, dynamic> data) => Cart(
      id: data['id'],
      name: data['attributes']['cart']['data']['attributes']['name'],
      description: data['attributes']['cart']['data']['attributes']
          ['description'],
      images: List<String>.from(data['attributes']['cart']['data']['attributes']
              ['images']['data']
          .map((image) => image['attributes']['url'])),
      tags: []);

  factory Cart.cartFromJson(Map<String, dynamic> data) => Cart(
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
