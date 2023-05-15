import 'package:flutter/material.dart';

import '../../../model/order.dart';
// import '../../order_details/order_details_screen.dart';

class OrderCard extends StatelessWidget {
  final Order order;
  const OrderCard({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Items: ${order.name}'),
            Text('Qty: 1'),
            Text('Price: ${order.tags.first.price}'),
          ],
        ),
      ),
    );
  }
}
