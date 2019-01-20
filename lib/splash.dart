import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_boss/main.dart';

class SplashPage extends StatefulWidget {
  @override
  SplashState createState() => new SplashState();
}

class SplashState extends State<SplashPage> {
  Timer _t;

  @override
  void initState() {
    super.initState();
    _t = new Timer(const Duration(milliseconds: 1500), () {
      try {
        Navigator.of(context).pushAndRemoveUntil(
            PageRouteBuilder<Null>(
              pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation) {
                return AnimatedBuilder(
                  animation: animation,
                  builder: (BuildContext context, Widget child) {
                    return Opacity(
                      opacity: animation.value,
                      child: new MainPage(title: 'Boss直聘'),
                    );
                  },
                );
              },
              transitionDuration: Duration(milliseconds: 300),
            ),
            (Route route) => route == null);
      } catch (e) {}
    });
  }

  @override
  void dispose() {
    _t.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: new Color.fromARGB(255, 0, 215, 198),
      child: Container(
        alignment: Alignment(0, -0.3),
        child: new Text(
          "BOSS直聘",
          style: new TextStyle(
              color: Colors.white, fontSize: 50.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
