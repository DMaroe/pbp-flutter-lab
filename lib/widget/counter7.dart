import 'package:labs/page/watchlists.dart';
import 'package:flutter/material.dart';
import 'package:labs/models/budget_models.dart';

// Models double check
import '../models/budget_models.dart';
import '../page/budget_list.dart';
import '../page/budget_forms.dart';
import '../page/counter_app.dart';

class TheDrawer extends StatelessWidget {
  final List<BudgetModel> data;
  
  const TheDrawer({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 40, 12, 0),
        child: Column(
          children: [
            ListTile(
              title: const Text('Counter'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProgramCounter(
                      title: 'Program Counter',
                      data: data,
                    ),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Add Budget'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BudgetForm(
                      data: data,
                    ),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Data Budget'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BudgetList(
                      data: data,
                    ),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Watch List'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WatchList(
                      data: data,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
