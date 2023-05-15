import 'dart:convert';

import 'package:hive/hive.dart';

// import 'tag.dart';

part 'history.g.dart';

List<History> popularHistoryListFromJson(String val) => List<History>.from(
    json.decode(val)['data'].map((val) => History.popularHistoryFromJson(val)));

List<History> historyListFromJson(String val) => List<History>.from(
    json.decode(val)['data'].map((val) => History.historyFromJson(val)));

@HiveType(typeId: 3)
class History {
  @HiveField(0)
  final String orderId;
  @HiveField(1)
  final String total;
  @HiveField(2)
  final String status;

  History({
    required this.orderId,
    required this.total,
    required this.status,
  });

  factory History.popularHistoryFromJson(Map<String, dynamic> data) => History(
      orderId: data['attributes']['orderId'],
      total: data['attributes']['total'],
      status: data['attributes']['status_order']['data']['attributes']['name']);

  factory History.historyFromJson(Map<String, dynamic> data) => History(
      orderId: data['attributes']['orderId'],
      total: data['attributes']['total'].toString(),
      status: data['attributes']['status_order']['data']['attributes']['name']);
}
