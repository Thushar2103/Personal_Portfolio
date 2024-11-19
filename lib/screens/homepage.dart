import 'package:flutter/material.dart';
import 'package:portfolio_personal/components/rightcontent.dart';
import '../components/phone.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  Widget phone() {
    return Center(
      child: Flexible(
        child: PhoneMockup(),
      ),
    );
  }

  Widget pc() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 15,
        ),
        Flexible(
          child: PhoneMockup(),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Rightcontent(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 700;
    return Scaffold(
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
          child: isMobile ? phone() : pc()),
    );
  }
}
