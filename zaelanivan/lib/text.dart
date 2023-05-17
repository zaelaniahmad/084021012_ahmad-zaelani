import 'package:flutter/material.dart';

class teks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Text Style"),
            ),
            body: const Text(
              'Ini Text',
              style: TextStyle(
                  color: Colors.yellow,
                  backgroundColor: Colors.red,
                  fontSize: 20.0,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold),
            )));
  }
}
