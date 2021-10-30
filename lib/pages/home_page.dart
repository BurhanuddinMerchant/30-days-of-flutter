import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double days = 42.3;
    String name = "Car";
    return Scaffold(
        appBar: AppBar(
          title: Text("Test App"),
        ),
        body: Center(
          child: Container(
            child: Text("Welcome to $days days of flutter by $name "),
          ),
        ),
        drawer: Drawer());
  }
}
