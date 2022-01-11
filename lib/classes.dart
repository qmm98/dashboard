// ignore_for_file: avoid_print, unused_import, prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loginapp/dashboard.dart';
import 'package:loginapp/notifications.dart';
import 'dashboard.dart';
import 'notifications.dart';
import 'connect.dart';

class Classes2 extends StatefulWidget {
  const Classes2({Key? key}) : super(key: key);

  @override
  _NotafloState createState() => _NotafloState();
}

class _NotafloState extends State<Classes2> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  String dropdownValue = "select class";
  static int? day;
  static List? display;

  Future<List> gettt() {
    return Future.delayed(Duration(seconds: 5), () {
      return DBConnection.gettt(day, 'monday');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Classes2()),
                );
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
                    'Classes',
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
                      hint: dropdownValue == "select class"
                          ? const Text('Select Class')
                          : Text(
                              dropdownValue,
                              style: const TextStyle(color: Colors.black),
                            ),
                      items: [
                        //add items in the dropdown
                        DropdownMenuItem(
                          onTap: () {
                            HapticFeedback.lightImpact();
                            day = 1;
                          },
                          child: Text("Monday"),
                          value: "Monday",
                        ),
                        DropdownMenuItem(
                            onTap: () {
                              HapticFeedback.lightImpact();
                              day = 2;
                            },
                            child: Text("Tuesday"),
                            value: "Tuesday"),
                        DropdownMenuItem(
                          onTap: () {
                            HapticFeedback.lightImpact();
                            day = 3;
                          },
                          child: Text("Wednesday"),
                          value: "Wednesday",
                        ),
                        DropdownMenuItem(
                          onTap: () {
                            HapticFeedback.lightImpact();
                            day = 4;
                          },
                          child: Text("Thursday"),
                          value: "Thursday",
                        ),
                        DropdownMenuItem(
                          onTap: () {
                            HapticFeedback.lightImpact();
                            day = 5;
                          },
                          child: Text("Friday"),
                          value: "Friday",
                        ),
                      ],
                      onChanged: (value) async {
                        //HapticFeedback.lightImpact();
                        //get value when changed
                        setState(() {
                          dropdownValue = value.toString();
                        });
                        await DBConnection.connect();
                        display = await DBConnection.gettt(day, 'SE_7');
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
                margin: const EdgeInsets.only(top: 210, bottom: 15),
                decoration: BoxDecoration(
                  color: const Color(0x95282828),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: FutureBuilder<List>(
                  future: gettt(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Center(
                          child: ListView.builder(
                              padding: const EdgeInsets.all(8),
                              itemCount: display?.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  padding: EdgeInsets.all(50),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.amber,
                                  ),
                                  height: 150,
                                  child:
                                      Center(child: Text(display.toString())),
                                );
                              }));
                    } else if (snapshot.connectionState ==
                        ConnectionState.active) {
                      return Center(child: Text('Select Class'));
                    } else if (snapshot.connectionState ==
                        ConnectionState.none) {
                      return Center(child: Text('Select Class'));
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return Text('select class');
                    }
                  },
                )),
          )
        ],
      ),
    );
  }
}
