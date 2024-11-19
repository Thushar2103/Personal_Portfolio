import 'package:flutter/material.dart';
import 'package:portfolio_personal/components/rightcontent.dart';
import '../components/phone.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor:
      //     const Color.fromARGB(255, 27, 26, 26),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF1C2B36),
              Color(0xFF3E4A61),
              Color(0xFF5F6383),
            ],
          ),
        ),
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceEvenly, // Center the children horizontally
          children: [
            SizedBox(
              width: 15,
            ),
            // Use Flexible to maintain the PhoneMockup size
            Flexible(
              child: PhoneMockup(), // Keeps its fixed width and height
            ),
            // Use Expanded to take the remaining space
            SizedBox(width: 10),
            Expanded(
              child: Rightcontent(),
            ),
          ],
        ),
      ),
    );
  }
}
