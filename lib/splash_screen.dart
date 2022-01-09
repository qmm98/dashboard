// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'main.dart';

class Splash2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 2,
      navigateAfterSeconds: LoginPage(),
      /*  title: new Text('Interaction Hub',textScaleFactor: 2,), */
      image: Image.asset('assets/Capture.PNG'),
      loadingText: const Text("Loading",
          style: TextStyle(
            color: Colors.white,
          )),
      photoSize: 100.0,
      loaderColor: Colors.blue,
      backgroundColor: Colors.black,
    );
  }
}
