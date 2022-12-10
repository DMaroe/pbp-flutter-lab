import 'package:flutter/material.dart';

import '../models/budget_models.dart';
import '../widget/budget_card.dart';
import '../widget/counter7.dart';

class BudgetList extends StatelessWidget {
  final List<BudgetModel> data;
  const BudgetList({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Data Budget'),
          elevation: 0,
        ),
        drawer: TheDrawer(
          data: data,
        ),
        body: Center(
          child: data.isEmpty
              ? Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "You don't have any transactions yet.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.deepPurple.shade200,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) =>
                      BudgetCard(data: data[index]),
                  padding: const EdgeInsets.only(bottom: 12),
                ),
        ),
      );
}
