import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class Rightcontent extends StatelessWidget {
  const Rightcontent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "I'm Thushar",
            style: TextStyle(
                color: Colors.white, fontSize: 50, fontWeight: FontWeight.w900),
          ),
          Divider(
            endIndent: 240,
          ),
          DefaultTextStyle(
            style: TextStyle(
                color: Colors.white, fontSize: 50, fontWeight: FontWeight.w900),
            child: AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [
                TypewriterAnimatedText('Software Tester'),
                TypewriterAnimatedText('Flutter Developer'),
                TypewriterAnimatedText('Traveller'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
