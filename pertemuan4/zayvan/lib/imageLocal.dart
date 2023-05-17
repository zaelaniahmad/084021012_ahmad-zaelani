import 'package:flutter/material.dart';

class imageLocal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("belajarFlutter.com"),
      ),
      body: Image.asset('assets/images/trexb.jpg'),
    ));
  }
}
