import 'package:flutter/material.dart';
import 'package:my_app/view/history/components/history_card.dart';

import '../../../model/history.dart';

class HistoryGrid extends StatelessWidget {
  final List<History> historys;
  const HistoryGrid({Key? key, required this.historys}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: historys.length,
        itemBuilder: (context, index) => HistoryCard(history: historys[index]),
      ),
    );
  }
}
