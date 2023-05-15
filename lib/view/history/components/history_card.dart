import 'package:flutter/material.dart';

import '../../../model/history.dart';
// import '../../history_details/history_details_screen.dart';

class HistoryCard extends StatelessWidget {
  final History history;
  const HistoryCard({Key? key, required this.history}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('OrderId: ${history.orderId}'),
            Text('Total: ${history.total}'),
            Text('Status: ${history.status}'),
          ],
        ),
      ),
    );
  }
}
