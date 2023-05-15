import 'package:flutter/material.dart';
import 'package:my_app/view/order/components/order_card.dart';

import '../../../model/order.dart';

class OrderGrid extends StatelessWidget {
  final List<Order> orders;
  const OrderGrid({Key? key, required this.orders}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) => OrderCard(order: orders[index]),
      ),
    );
  }
}
