import 'package:egg/pages/home.page.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  Future delay(context) async {
    await new Future.delayed(new Duration(milliseconds: 3000), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    delay(context);
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 60,
            ),
            Container(
              width: double.infinity,
              height: 300,
              child: FlareActor(
                "assets/animations/egg-cooking.flr",
                alignment: Alignment.center,
                fit: BoxFit.contain,
                isPaused: false,
                animation: 'start',
              ),
            ),
            Text(
              "Perfect Eggs",
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
