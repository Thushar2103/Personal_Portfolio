import 'dart:async';

import 'package:flutter/material.dart';
import 'package:portfolio_personal/screens/aboutpage.dart';
import 'package:portfolio_personal/screens/landingpage.dart';
import 'package:intl/intl.dart';

class PhoneMockup extends StatefulWidget {
  const PhoneMockup({super.key});

  @override
  State<PhoneMockup> createState() => _PhoneMockupState();
}

class _PhoneMockupState extends State<PhoneMockup> {
  String time = DateFormat('hh:mm').format(DateTime.now());
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(Duration(seconds: 1), _updateTime);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _updateTime(Timer timer) {
    setState(() {
      time = DateFormat('hh:mm').format(DateTime.now());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      height: 570.0,
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(width: 10),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Navigator(
                onGenerateRoute: (settings) {
                  // Navigate to different screens based on the tapped icon
                  if (settings.name == '/about') {
                    return MaterialPageRoute(builder: (_) => Aboutpage());
                  } else if (settings.name == '/contact') {
                    // return MaterialPageRoute(builder: (_) => ContactPage());
                  } else if (settings.name == '/photos') {
                    // return MaterialPageRoute(builder: (_) => PhotosPage());
                  } else {
                    return MaterialPageRoute(builder: (_) => Landingpage());
                  }
                  return null;
                },
              ),
            ),
          ),
          Positioned(
            top: 8,
            left: 0,
            right: 0,
            child: Container(
              height: 15,
              decoration:
                  BoxDecoration(color: Colors.black, shape: BoxShape.circle),
            ),
          ),
          Positioned(
            top: 6,
            left: 20,
            child: Text(
              time,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            top: 6,
            right: 20,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.battery_6_bar_outlined, size: 17,
                  // color: Colors.white,
                ),
                SizedBox(width: 1),
                Text(
                  '90%', // Show battery percentage
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 5,
            left: 70,
            right: 70,
            child: Container(
              height: 5,
              width: 10,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.black38,
                  shape: BoxShape.rectangle),
            ),
          ),
        ],
      ),
    );
  }
}
