import 'package:labs/main.dart';
import 'package:labs/forms.dart';
import 'package:flutter/material.dart';

class MyDataPage extends StatefulWidget {
  const MyDataPage({super.key});

  @override
  State<MyDataPage> createState() => _MyDataPageState();
}

class _MyDataPageState extends State<MyDataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Budget Form'),
      ), // Adds Menu Drawer
      drawer: Drawer(
        child: Column(
          children: [
            // Adds clickable menu
            ListTile(
              title: const Text('counter_7'),
              onTap: () {
                // Route menu ke halaman utama
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()),
                );
              },
            ),
            ListTile(
              title: const Text('Add Budget'),
              onTap: () {
                // Menu routing to Forms
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyFormPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Data Budget'),
              onTap: () {
                // Route menu to data page
                Navigator.pop(
                  context,
                  MaterialPageRoute(builder: (context) => const MyDataPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: ListView.builder(
            itemCount: Budget.budgets.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                elevation: 3,
                margin: const EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Container(
                      padding: const EdgeInsets.only(
                          top: 7.5, left: 13, right: 13, bottom: 7.5),
                      child: Text(
                        Budget.budgets[index].title,
                        style: const TextStyle(
                          fontSize: 32,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              top: 7.5, left: 13, right: 13, bottom: 7.5),
                          child: Text(
                            Budget.budgets[index].toString(),
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const Flexible(fit: FlexFit.tight, child: SizedBox()),
                        Container(
                          padding: const EdgeInsets.only(
                              top: 7.5, left: 13, right: 13, bottom: 7.5),
                          child: Text(
                            Budget.budgets[index].type,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}