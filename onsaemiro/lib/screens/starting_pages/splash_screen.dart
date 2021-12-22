import 'package:flutter/material.dart';

import 'package:show_up_animation/show_up_animation.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: ShowUpAnimation(
          child: SizedBox(width: 80, child: Text('1')),
          delayStart: Duration(seconds: 0),
          animationDuration: Duration(milliseconds: 1500),
          direction: Direction.vertical,
          offset: 0.5,
        )));
  }
}
