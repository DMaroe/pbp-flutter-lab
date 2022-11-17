import 'package:labs/main.dart';
import 'package:labs/dat.dart';
import 'package:flutter/material.dart';

class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key});

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class Budget {
  String title;
  int amount;
  String type;
  static List<Budget> budgets = [];

  Budget(String this.title, int this.amount, String this.type);
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _title = "";
  int _amount = 0;
  String? _typeincome;
  List<String> _listincome = ['Income', 'Spending'];

  bool _isNumeric(String? s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Budget'),
      ), // Drawer Menu
      drawer: Drawer(
        child: Column(
          children: [
            // Click-able Menu
            ListTile(
              title: const Text('counter_7'),
              onTap: () {
                // Rerouting to main page
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()),
                );
              },
            ),
            ListTile(
              title: const Text('Add Budget'),
              onTap: () {
                // Menu routing to forms
                Navigator.pop(
                  context,
                  MaterialPageRoute(builder: (context) => const MyFormPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Data Budget'),
              onTap: () {
                // Menu Routing to the data page
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyDataPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                // Untuk input title
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Example: Bought Waffles",
                      labelText: "title",
                      // Adding circular border
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // 
                    // Behaviour Addition when typd
                    onChanged: (String? value) {
                      setState(() {
                        _title = value!;
                      });
                    },
                    // Adds behaviour when saved
                    onSaved: (String? value) {
                      setState(() {
                        _title = value!;
                      });
                    },
                    // Validator
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'title tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                // Amount input
                Padding(
                  // Padding
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Example: 6800",
                      labelText: "amount",
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // onChanged and onSaved
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        if (_isNumeric(value)) {
                          _amount = int.parse(value!);
                        }
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        if (_isNumeric(value)) {
                          _amount = int.parse(value!);
                        }
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'title can not be empty!';
                      } else if (!_isNumeric(value)) {
                        return 'the amount must be an integer!';
                      }
                      return null;
                    },
                  ),
                ),
                // Dropdown type budget
                Container(
                  width: width / 4,
                  child: ButtonTheme(
                    alignedDropdown: true,
                    child: DropdownButtonFormField(
                      hint: const Text("Choose Type"),
                      value: _typeincome,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: _listincome.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _typeincome = newValue!;
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please choose a type!';
                        }
                        return null;
                      },
                    ),
                  ),
                ),

                SizedBox(
                  height: height / 1.9,
                ),
                // Submit Button
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Budget currentBudget =
                          Budget(_title, _amount, _typeincome!);
                      Budget.budgets.add(currentBudget);
                      _formKey.currentState?.reset();
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.5),
                            ),
                            insetPadding: const EdgeInsets.all(8.5),
                            elevation: 15,
                            child: ListView(
                              padding:
                                  const EdgeInsets.only(top: 18, bottom: 18),
                              shrinkWrap: true,
                              children: const <Widget>[
                                Center(
                                    child: Text('Budget successfully added')),
                              ],
                            ),
                          );
                        },
                      );
                    }
                  },
                  child: const Text(
                    "Save",
                    style: TextStyle(color: Color.fromARGB(255, 243, 243, 243)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}