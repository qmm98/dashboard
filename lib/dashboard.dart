// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:loginapp/classes.dart';
import 'package:loginapp/notifications.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _NotafloState createState() => _NotafloState();
}

class _NotafloState extends State<Dashboard> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
              title: const Image(image: AssetImage('assets/logo.png')),
              onTap: () {
                Navigator.pop(context);
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
              child: Stack(
                children: [
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
                      'Dashboard1',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0, 0.68),
            child: Container(
              width: double.infinity,
              height: 800,
              margin: EdgeInsets.only(top: 235, bottom: 15),
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
