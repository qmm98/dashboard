// ignore_for_file: prefer_const_constructors, import_of_legacy_library_into_null_safe, unused_local_variable, dead_code, unused_field

/* import 'dart:ffi'; */
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:loginapp/connect.dart';
/* import 'package:mongo_dart/mongo_dart.dart'; */
import 'connect.dart';
import './splash_screen.dart';
import './dashboard.dart';
//import 'package:mongo_dart/mongo_dart.dart';
import './dialogs.dart';

//import 'package:mongo_dart/mongo_dart.dart';

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Splash2(),
    );
  }
}

// ignore: use_key_in_widget_constructors
class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final myController = TextEditingController();
  final myController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(fit: StackFit.expand, children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 35),
            decoration: BoxDecoration(
              image: DecorationImage(
                alignment: Alignment.topCenter,
                image: AssetImage('assets/Capture.PNG'),
                fit: BoxFit.none,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 2),
              child: Container(
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
              ),
            ),
          ),
          Column(mainAxisAlignment: MainAxisAlignment.center, children: <
              Widget>[
            Form(
                child: Theme(
                    data: ThemeData(
                      brightness: Brightness.dark,
                      /* primarySwatch: Colors.grey, */
                    ),
                    child: Container(
                        padding: EdgeInsets.all(70),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              TextField(
                                controller: myController,
                                decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.all(10),
                                    hintText: 'Enter Email',
                                    hintStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                    fillColor: Colors.grey.shade800,
                                    filled: true,
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(40))),
                                keyboardType: TextInputType.emailAddress,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextField(
                                controller: myController2,
                                decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.all(10),
                                    hintText: 'Enter Password',
                                    hintStyle:
                                        TextStyle(fontWeight: FontWeight.bold),
                                    fillColor: Colors.grey.shade800,
                                    filled: true,
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(40))),
                                keyboardType: TextInputType.text,
                                obscureText: true,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 20),
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  await DBConnection.connect();
                                  final ans = await DBConnection.auth(
                                      myController.text, myController2.text);

                                  if (ans == 1) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => WillPopScope(
                                              onWillPop: () async => false,
                                              child: Dashboard())),
                                    );
                                  } else if (ans == 2) {
                                    dialogs d1 = dialogs();
                                    d1.showAlertDialog(context);
                                  } else if (ans == 3) {
                                    /* Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => WillPopScope(
                                              onWillPop: () async => false,
                                              child: Dashboard())),
                                    ); 
                                    
                                    PAGEROUTE TO FACULTY LOGIN
                                    */
                                  } else {
                                    dialogs d1 = dialogs();
                                    d1.showAlertDialog2(context);
                                  }
                                },
                                child: Text('Login'),
                                style: ButtonStyle(
                                  /* fixedSize: */
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.grey.shade800),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide.none,
                                  )),
                                ),
                              )
                            ])))),
          ])
        ]));
  }
}

void main() => runApp(MyApp());
