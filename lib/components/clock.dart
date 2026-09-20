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
  DateTime _now = DateTime.now();

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), _updateTime);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _updateTime(Timer timer) {
    setState(() {
      _now = DateTime.now();
    });
  }

  @override
  Widget build(BuildContext context) {
    String hours = _now.hour.toString().padLeft(2, '0');
    String minutes = _now.minute.toString().padLeft(2, '0');
    String seconds = _now.second.toString().padLeft(2, '0');

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF2C3E50),
            Color(0xFF000000),
          ],
        ),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.tealAccent[400]!.withOpacity(0.2),
            blurRadius: 30,
            spreadRadius: 2,
            offset: const Offset(0, 10),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
        border: Border.all(
          color: Colors.tealAccent[400]!.withOpacity(0.3),
          width: 1.5,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0), // Slightly reduced padding
        child: FittedBox(
          // fit: BoxFit.scaleDown,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    "$hours:$minutes",
                    style: const TextStyle(
                        fontSize: 55,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        letterSpacing: 2,
                        shadows: [
                          Shadow(
                            color: Colors.black54,
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          )
                        ]),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    seconds,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      color: Colors.tealAccent[400],
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12), // Slightly reduced spacing
              Container(
                height: 2,
                width: 180,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.tealAccent[400]!.withOpacity(0.8),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12), // Slightly reduced spacing
              Text(
                DateFormat('EEEE, MMMM d, yyyy').format(_now).toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 11,
                  letterSpacing: 2.5,
                  color: Colors.white70,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
