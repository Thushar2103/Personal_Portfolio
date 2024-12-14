import 'dart:async';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'aboutpage.dart';
import 'landingpage.dart';
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
    return DeviceFrame(
      device: Devices.ios.iPhone12Mini,
      screen: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Navigator(
                onGenerateRoute: (settings) {
                  // Navigate to different screens based on the tapped icon
                  if (settings.name == '/about') {
                    return MaterialPageRoute(builder: (_) => Aboutpage());
                  } else {
                    return MaterialPageRoute(builder: (_) => Landingpage());
                  }
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
            top: 10,
            left: 26,
            child: Text(
              time,
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
            ),
          ),
          Positioned(
            top: 10,
            right: 30,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Transform.rotate(
                  angle: 90 * (3.14159265359 / 180),
                  child: Icon(
                    Icons.battery_6_bar_outlined,
                    size: 25,
                  ),
                ),
                // SizedBox(width: 1),
                // Text(
                //   '90%', // Show battery percentage
                //   style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
                // ),
              ],
            ),
          ),
          Positioned(
            bottom: 5,
            left: 90,
            right: 90,
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
