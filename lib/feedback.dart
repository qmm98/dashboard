// ignore_for_file: avoid_print, unused_import, prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loginapp/dashboard.dart';
import 'package:loginapp/notifications.dart';
import 'dashboard.dart';
import 'notifications.dart';
import 'connect.dart';
import 'classes.dart';

class Feedbacks extends StatefulWidget {
  const Feedbacks({Key? key}) : super(key: key);

  @override
  _Feedback createState() => _Feedback();
}

class _Feedback extends State<Feedbacks> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  String dropdownValue = "select Instructor";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: scaffoldKey,
      backgroundColor: const Color(0xFF010000),
      drawer: Drawer(
        elevation: 16,
        child: ListView(
          padding: const EdgeInsets.only(top: 30),
          children: [
            ListTile(
              title: const Image(
                image: AssetImage('assets/logo.png'),
              ),
              onTap: () {
                HapticFeedback.lightImpact();
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Dashboard()),
                );
              },
            ),
            ListTile(
              title: const Text('Notifications'),
              onTap: () {
                HapticFeedback.lightImpact();
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Notaflo()),
                );
              },
            ),
            ListTile(
              title: const Text('Classes'),
              onTap: () {
                HapticFeedback.lightImpact();
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Classes2()),
                );
              },
            ),
            ListTile(
              title: const Text('Chat-Rooms'),
              onTap: () {
                HapticFeedback.lightImpact();
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Classes2()),
                );
              },
            ),
            ListTile(
              title: const Text('Course Management'),
              onTap: () {
                HapticFeedback.lightImpact();
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Classes2()),
                );
              },
            ),
            ListTile(
              title: const Text('Feedback'),
              onTap: () {
                HapticFeedback.lightImpact();
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Preferences'),
              onTap: () {
                HapticFeedback.lightImpact();
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Classes2()),
                );
              },
            ),
          ],
        ),
      ),
      endDrawer: const Drawer(
        elevation: 16,
      ),
      body: Stack(
        children: [
          Align(
            alignment: const AlignmentDirectional(0, -0.9),
            child: Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: const Color(0x95282828),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Stack(children: [
                Align(
                  alignment: const AlignmentDirectional(-0.95, 0),
                  child: IconButton(
                    splashRadius: 30,
                    iconSize: 60,
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () async {
                      HapticFeedback.lightImpact();
                      scaffoldKey.currentState!.openDrawer();
                    },
                  ),
                ),
                const Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Text(
                    'Feedback',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ]),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0, -.65),
            child: DecoratedBox(
                decoration: BoxDecoration(
                    color: Colors.white, //background color of dropdown button
                    border: Border.all(
                        color: Colors.black38,
                        width: 3), //border of dropdown button
                    borderRadius: BorderRadius.circular(
                        50), //border raiuds of dropdown button
                    boxShadow: const <BoxShadow>[
                      //apply shadow on Dropdown button
                      //blur radius of shadow
                    ]),
                child: Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: DropdownButton(
                      onTap: () => HapticFeedback.lightImpact(),
                      hint: dropdownValue == "select Instructor"
                          ? const Text('Select Instructor')
                          : Text(
                              dropdownValue,
                              style: const TextStyle(color: Colors.black),
                            ),
                      items: [
                        //add items in the dropdown
                        DropdownMenuItem(
                          onTap: () {
                            HapticFeedback.lightImpact();
                          },
                          child: Text("Dr. Muhammad Habib"),
                          value: "Dr. Muhammad Habib",
                        ),
                        DropdownMenuItem(
                            onTap: () {
                              HapticFeedback.lightImpact();
                            },
                            child: Text("Dr. Maryum Kausar"),
                            value: "Dr. Maryum Kausar"),
                        DropdownMenuItem(
                          onTap: () {
                            HapticFeedback.lightImpact();
                          },
                          child: Text("Dr. Sajid Ali Khan"),
                          value: "Dr. Sajid Ali Khan",
                        ),
                        DropdownMenuItem(
                          onTap: () {
                            HapticFeedback.lightImpact();
                          },
                          child: Text("Mr. Umar Mahmud"),
                          value: "Mr. Umar Mahmud",
                        ),
                        DropdownMenuItem(
                          onTap: () {
                            HapticFeedback.lightImpact();
                          },
                          child: Text("Mr. Sabahat Nadeem"),
                          value: "Mr. Sabahat Nadeem",
                        ),
                      ],
                      onChanged: (value) {
                        //HapticFeedback.lightImpact();
                        //get value when changed
                        setState(() {
                          dropdownValue = value.toString();
                        });
                      },
                      icon: const Padding(
                          //Icon at tail, arrow bottom is default icon
                          padding: EdgeInsets.only(left: 20),
                          child: Icon(Icons.arrow_circle_down_sharp)),
                      iconEnabledColor: Colors.black, //Icon color
                      style: const TextStyle(
                          //te
                          color: Colors.black, //Font color
                          fontSize: 20 //font size on dropdown button
                          ),

                      dropdownColor: Colors.white,
                      underline: Container(),
                      isExpanded: true,
                    ))),
          ),
          Align(
            alignment: const AlignmentDirectional(0, 0.55),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              margin: const EdgeInsets.only(top: 235, bottom: 15),
              decoration: BoxDecoration(
                color: const Color(0x95282828),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional(-1.11, -0.89),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
                      child: TextFormField(
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: 'Type your feedback text here',
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(
                                color: Color(0x95282828),
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(
                                color: Color(0x95282828),
                              )),
                        ),
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.start,
                        maxLines: null,
                        keyboardType: TextInputType.text,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Field is required';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.11, 0.46),
                    child: ElevatedButton(
                      child: Text('Submit'),
                      style: ButtonStyle(
                        /* fixedSize: */
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.grey.shade800),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide.none,
                        )),
                      ),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
