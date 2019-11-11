import 'package:egg/widgets/action-buttons.widget.dart';
import 'package:egg/widgets/eggs.widget.dart';
import 'package:egg/widgets/progress.widget.dart';
import 'package:egg/widgets/type-buttons.widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Text(
            "Perfect Eggs",
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Eggs(),
          Padding(padding: const EdgeInsets.all(20), child: TypeButtons()),
          SizedBox(
            height: 50,
          ),
          Progress(),
          SizedBox(
            height: 20,
          ),
          ActionButtons(),
        ],
      ),
    );
  }
}
