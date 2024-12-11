import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_personal/components/landingpage.dart';
import 'package:url_launcher/url_launcher.dart';
import '../components/rightcontent.dart';
import '../components/phone.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  Widget phone() {
    return Center(
      child: PhoneMockup(),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: !isMobile
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    iconSize: 35,
                    onPressed: () => _launchUrl(github),
                    icon: Icon(
                      FontAwesomeIcons.github,
                      color: Colors.black,
                    )),
                IconButton(
                    iconSize: 35,
                    onPressed: () => _launchUrl(linkedin),
                    icon: Icon(FontAwesomeIcons.linkedin, color: Colors.blue))
              ],
            )
          : null,
    );
  }
}
