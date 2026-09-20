import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class Rightcontent extends StatelessWidget {
  const Rightcontent({super.key});

  @override
  Widget build(BuildContext context) {
    const colorizeColors = [
      Colors.tealAccent,
      Colors.blue,
      Colors.purple,
      Colors.tealAccent,
    ];

    const colorizeTextStyle = TextStyle(
      fontSize: 55,
      fontWeight: FontWeight.w900,
      shadows: [
        Shadow(
          color: Colors.black45,
          blurRadius: 10,
          offset: Offset(0, 5),
        ),
      ],
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "HELLO, I'M",
          style: TextStyle(
            color: Colors.white60,
            fontSize: 22,
            fontWeight: FontWeight.w800,
            letterSpacing: 4.0,
          ),
        ),
        const SizedBox(height: 5),
        ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Colors.white, Color(0xFFB2DFDB)], // White to soft teal
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(bounds),
          child: const Text(
            "Thushar",
            style: TextStyle(
              fontSize: 80,
              fontWeight: FontWeight.w900,
              letterSpacing: 2.5,
              height: 1.1,
            ),
          ),
        ),
        const SizedBox(height: 15),
        Container(
          width: 100,
          height: 6,
          decoration: BoxDecoration(
            color: Colors.tealAccent[400],
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.tealAccent[400]!.withOpacity(0.6),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        SizedBox(
          height: 80,
          child: AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              ColorizeAnimatedText(
                'Software Tester',
                textStyle: colorizeTextStyle,
                colors: colorizeColors,
              ),
              ColorizeAnimatedText(
                'Flutter Developer',
                textStyle: colorizeTextStyle,
                colors: colorizeColors,
              ),
              ColorizeAnimatedText(
                'Traveller',
                textStyle: colorizeTextStyle,
                colors: colorizeColors,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
