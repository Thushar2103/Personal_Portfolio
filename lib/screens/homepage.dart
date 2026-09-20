import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:url_launcher/url_launcher.dart';

import '../components/landingpage.dart';
import '../components/phone.dart';
import '../components/rightcontent.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  Widget phone() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: PhoneMockup(),
      ),
    );
  }

  Widget pc() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(
          // child: DevicePreview(
          //   isToolbarVisible: false,
          //   backgroundColor: Colors.black,
          //   enabled: true, // Enable the Device Preview
          //   tools: const [...DevicePreview.defaultTools],
          //   builder: (context) => Navigator(
          //     onGenerateRoute: (settings) {
          //       // Navigate to different screens based on the tapped icon
          //       if (settings.name == '/about') {
          //         return MaterialPageRoute(builder: (_) => Aboutpage());
          //       } else {
          //         return MaterialPageRoute(builder: (_) => Landingpage());
          //       }
          //     },
          //   ),
          // ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: PhoneMockup(),
          ),
        ),
        const SizedBox(width: 10),
        const Expanded(
          flex: 1,
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
                Color(0xFF0F2027),
                Color(0xFF203A43),
                Color(0xFF2C5364),
              ],
            ),
          ),
          // color: Colors.black),
          child: isMobile ? phone() : pc()),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: !isMobile
          ? Container(
              margin: const EdgeInsets.only(bottom: 20, right: 20),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.white.withOpacity(0.1)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  )
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    iconSize: 28,
                    onPressed: () => _launchUrl(github),
                    icon: const Icon(FontAwesomeIcons.github, color: Colors.white),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    iconSize: 28,
                    onPressed: () => _launchUrl(linkedin),
                    icon: Icon(FontAwesomeIcons.linkedin, color: Colors.tealAccent[400]),
                  )
                ],
              ),
            )
          : null,
    );
  }
}
