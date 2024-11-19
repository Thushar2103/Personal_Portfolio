import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DigitalClockCard extends StatefulWidget {
  const DigitalClockCard({super.key});

  @override
  _DigitalClockCardState createState() => _DigitalClockCardState();
}

class _DigitalClockCardState extends State<DigitalClockCard> {
  late Timer _timer;
  String _time = _getCurrentTime();

  @override
  void initState() {
    super.initState();
    // Update time every second
    _timer = Timer.periodic(Duration(seconds: 1), _updateTime);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  // Function to get current time
  static String _getCurrentTime() {
    final now = DateTime.now();
    return "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}";
  }

  // Function to update time every second
  void _updateTime(Timer timer) {
    setState(() {
      _time = _getCurrentTime();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFD1C4E9),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 5,
      margin: EdgeInsets.all(15),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              Text(
                _time,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Divider(
                height: 5,
                indent: 30,
                endIndent: 30,
                color: Colors.black,
              ),
              Text(
                DateFormat('EEEE - dd/M/yy').format(DateTime.now()),
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}