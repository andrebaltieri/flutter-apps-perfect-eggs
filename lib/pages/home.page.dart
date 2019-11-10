import 'dart:async';

import 'package:egg/widgets/button.widget.dart';
import 'package:egg/widgets/eggs.widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Timer timer;
  String state = "stopped";
  String selected = "soft";
  double time = 5 * 60.0;
  double seconds = 0;
  double percent = 0;

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  updateTime() {
    setState(() {
      seconds++;
      percent = (seconds * 100) / time;
      if (seconds == time) done();
    });
  }

  select(String type) {
    setState(() {
      switch (type) {
        case "soft":
          {
            selected = "soft";
            time = 5.0 * 60.0;
            return;
          }

        case "medium":
          {
            selected = "medium";
            time = 7.0 * 60.0;
            return;
          }

        case "hard":
          {
            selected = "hard";
            time = 10.0 * 60.0;
            return;
          }

        default:
          {
            time = 5.0 * 60.0;
            return;
          }
      }
    });
  }

  start() {
    setState(() {
      state = "cooking";
    });
    timer = Timer.periodic(
      Duration(seconds: 1),
      (Timer t) => updateTime(),
    );
  }

  stop() {
    timer.cancel();
    setState(() {
      state = "stopped";
      seconds = 0;
      percent = 0;
    });
  }

  done() {
    timer.cancel();
    setState(() {
      state = "done";
      seconds = 0;
      percent = 0;
    });
  }

  reset() {
    timer.cancel();
    setState(() {
      state = "stopped";
      seconds = 0;
      percent = 0;
    });
  }

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
          Eggs(
            state: state,
          ),
          state == "stopped"
              ? Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Button(
                        label: "Soft",
                        selected: selected == "soft",
                        callback: () {
                          select("soft");
                        },
                      ),
                      Button(
                        label: "Medium",
                        selected: (selected == "medium"),
                        callback: () {
                          select("medium");
                        },
                      ),
                      Button(
                        label: "Hard",
                        selected: selected == "hard",
                        callback: () {
                          select("hard");
                        },
                      ),
                    ],
                  ),
                )
              : SizedBox(),
          SizedBox(
            height: 50,
          ),
          Text(
            (time - seconds).toString(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 45,
            ),
            textAlign: TextAlign.center,
          ),
          state == "cooking"
              ? Padding(
                  padding: const EdgeInsets.all(20),
                  child: LinearProgressIndicator(
                    value: percent / 100,
                    backgroundColor: Colors.transparent,
                    valueColor: new AlwaysStoppedAnimation<Color>(
                      Color(0xFFFDBF00),
                    ),
                  ),
                )
              : SizedBox(),
          SizedBox(
            height: 20,
          ),
          state == "stopped"
              ? Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Button(
                    label: "START",
                    selected: true,
                    callback: start,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Button(
                    label: "STOP",
                    selected: true,
                    callback: stop,
                  ),
                ),
        ],
      ),
    );
  }
}
