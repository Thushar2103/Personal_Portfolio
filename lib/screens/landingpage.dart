import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_personal/components/clock.dart';
import 'package:portfolio_personal/screens/aboutpage.dart';
import 'package:portfolio_personal/screens/devicepage.dart';
import 'package:portfolio_personal/screens/projects.dart';
import 'package:url_launcher/url_launcher.dart';

Uri github = Uri.parse('https://github.com/Thushar2103');
Uri linkedin = Uri.parse('https://www.linkedin.com/in/thushar-t-3a25a9292/');
Uri expense = Uri.parse(
    'https://play.google.com/store/apps/details?id=com.tascuit.expense');
Uri contact = Uri.parse('https://contact-form-j5vq.onrender.com/');

class Landingpage extends StatelessWidget {
  const Landingpage({super.key});

  void _showClockDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Current Time'),
          content: DigitalClockCard(), // The clock widget you are using
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          image: DecorationImage(
              image: AssetImage("assets/wallpaper.jpg"), fit: BoxFit.cover)),
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          GestureDetector(
              onTap: () {
                _showClockDialog(context);
              },
              child: DigitalClockCard()),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 0,
                mainAxisSpacing: 10,
              ),
              itemCount: 7,
              itemBuilder: (context, index) {
                return AppIconItem(index: index);
              },
            ),
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}

class AppIconItem extends StatelessWidget {
  final int index;

  const AppIconItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    // List of app icons and names
    List<Map<String, dynamic>> appData = [
      {"icon": Icons.person, "name": "About", "screen": Aboutpage()},
      {"icon": Icons.edit, "name": "Projects", "screen": ProjectsPage()},
      {"icon": Icons.contact_mail_rounded, "name": "Contact", "url": contact},
      {"icon": FontAwesomeIcons.github, "name": "Github", "url": github},
      {"icon": FontAwesomeIcons.linkedin, "name": "LinkedIn", "url": linkedin},
      // {"icon": Icons.phone_android, "name": "Device", "screen": Devicepage()},
      {"icon": FontAwesomeIcons.medal, "name": "Awards", "screen": Aboutpage()},
      {"image": "assets/expense.png", "name": "Expense", "url": expense},
      // {"icon": FontAwesomeIcons.medal, "name": "Awards", "screen": Aboutpage()},
    ];

    // Get the icon and name based on the index
    var app = appData[index];

    // Function to launch a URL
    Future<void> _launchUrl(Uri _url) async {
      if (!await launchUrl(_url)) {
        throw Exception('Could not launch $_url');
      }
    }

    return GestureDetector(
      onTap: () {
        if (app["url"] != null) {
          _launchUrl(app["url"]);
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => app["screen"]),
          );
        }
      },
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Card(
                color: Color(0xFFD1C4E9),
                child: Padding(
                  padding: EdgeInsets.all(!app.containsKey("image") ? 6 : 0),
                  child: app.containsKey("image")
                      ? Image.asset(
                          app["image"],
                          height: 42,
                          width: 42,
                          fit: BoxFit.cover,
                        )
                      : Icon(
                          app["icon"],
                          size: 30,
                        ),
                ),
              ),
            ),
            Text(
              app["name"],
              softWrap: true,
              style: TextStyle(
                  // fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
