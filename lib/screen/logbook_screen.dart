import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<String> list = ["one", "two", "three", "four"];

class LogBookScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LogBookScreenState();
}

class _LogBookScreenState extends State<LogBookScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DropdownButton Sample')),
      body: const Center(
        child: DropdownButtonExample(),
      ),
    );
  }
}

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {

  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {

    return   Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButtonFormField(
            value: dropdownValue,
            items: list.map((e) => DropdownMenuItem(child: Text(e), value: e,))
                .toList(),
            onChanged: (selected) {
              setState(() {
                dropdownValue = selected as String;
              });
            },
            icon: Icon(
              Icons.arrow_drop_down_circle,
              color: Colors.deepPurple,
            ),
            dropdownColor: Colors.deepPurple.shade50,
            decoration: InputDecoration(
                labelText: "Product sizes",
                prefixIcon: Icon(
                  Icons.accessibility_new_rounded,
                  color: Colors.purple,
                ),
                border: OutlineInputBorder()
            ),
          )
        ],
      ),
    );
  }



//   DropdownButton<String>(
//   value: dropdownValue,
//   icon: const Icon(Icons.arrow_downward),
//   elevation: 16,
//   style: const TextStyle(color: Colors.deepPurple),
//   underline: Container(
//     height: 2,
//     color: Colors.deepPurpleAccent,
//   ),
//   onChanged: (String? value) {
//     // This is called when the user selects an item.
//     setState(() {
//       dropdownValue = value!;
//     });
//   },
//   items: list.map<DropdownMenuItem<String>>((String value) {
//     return DropdownMenuItem<String>(
//       value: value,
//       child: Text(value),
//     );
//   }).toList(),
// );
}
