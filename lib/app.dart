import 'package:flutter/material.dart';

import 'models/budget_models.dart';
import 'page/counter_app.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<BudgetModel> budgets = <BudgetModel>[];
    return MaterialApp(
      title: 'Counter 7 App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProgramCounter(
        title: 'Counter 7 Bro',
        data: budgets,
      ),
    );
  }
}