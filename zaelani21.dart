import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.dashboard),
          title: Text("zaelanivan"),
          actions: <Widget>[
            Icon(Icons.search),
          ],
          actionsIconTheme: IconThemeData(color: Colors.blue),
          backgroundColor: Color.fromARGB(255, 107, 25, 52),
          bottom: PreferredSize(
            child: Container(
              color: Colors.orange,
              height: 4.0,
            ),
            preferredSize: Size.fromHeight(4.0),
          ),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.pink,
          child: Text("+"),
          onPressed: () {},
        ),
        body: Column(children: <Widget>[
          Container(
            width: 50,
            height: 50,
            decoration:
                BoxDecoration(color: Colors.redAccent, shape: BoxShape.circle),
          )
        ]),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
