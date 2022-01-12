// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loginapp/classes.dart';
import 'package:loginapp/dashboard.dart';
import 'package:loginapp/feedback.dart';
import 'dashboard.dart';

class Notaflo extends StatefulWidget {
  const Notaflo({Key? key}) : super(key: key);

  @override
  _NotafloState createState() => _NotafloState();
}

class _NotafloState extends State<Notaflo> {
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
                  MaterialPageRoute(builder: (context) => const Feedbacks()),
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
                        HapticFeedback.lightImpact();
                        scaffoldKey.currentState!.openDrawer();
                      },
                    ),
                  ),
                  const Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Text(
                      'Notifications',
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
              height: double.infinity,
              margin: const EdgeInsets.only(top: 150, bottom: 15),
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
