// ignore_for_file: avoid_print, unused_import

import 'package:flutter/material.dart';
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

  String dropdownValue = 'One';

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
                      value: "United Kingdom",
                      items: const [
                        //add items in the dropdown
                        DropdownMenuItem(
                          child: Text("United Kingdom"),
                          value: "United Kingdom",
                        ),
                        DropdownMenuItem(
                            child: Text("Canada"), value: "Canada"),
                        DropdownMenuItem(
                          child: Text("Russia"),
                          value: "Russia",
                        )
                      ],
                      onChanged: (value) {
                        //get value when changed
                        print("You have selected $value");
                      },
                      icon: const Padding(
                          //Icon at tail, arrow bottom is default icon
                          padding: EdgeInsets.only(left: 20),
                          child: Icon(Icons.align_horizontal_left_outlined)),
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
            ),
          )
        ],
      ),
    );
  }
}
