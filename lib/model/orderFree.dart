import 'dart:convert';

import 'package:hive/hive.dart';

part 'orderFree.g.dart';

OrderFree orderFreeFromJson(String str) => OrderFree.fromJson(json.decode(str));

@HiveType(typeId: 4)
class OrderFree {
  @HiveField(0)
  String id;
  @HiveField(0)
  String total;
  @HiveField(0)
  String status;

  OrderFree({
    required this.id,
    required this.total,
    required this.status,
  });

  factory OrderFree.fromJson(Map<String, dynamic> data) => OrderFree(
        id: data['id'].toString(),
        total: data['total'].toString(),
        status: data['status_order']['name'].toString(),
      );
}
