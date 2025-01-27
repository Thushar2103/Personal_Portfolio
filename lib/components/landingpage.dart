import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'clock.dart';
import 'aboutpage.dart';
import 'awardspage.dart';
import 'gallery.dart';
import 'projects.dart';

Uri github = Uri.parse('https://github.com/Thushar2103');
Uri linkedin = Uri.parse('https://www.linkedin.com/in/thushar-t-3a25a9292/');
Uri contact = Uri.parse('https://contact-form-j5vq.onrender.com/');
Uri playstore =
    Uri.parse('https://play.google.com/store/apps/developer?id=Tascuit');
Uri resume = Uri.parse(
    'https://drive.google.com/file/d/1s09Q9L1oOo_21alz76UR6e2Y8x1vbtI2/view?usp=drive_link');

class Landingpage extends StatelessWidget {
  const Landingpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("image/wallpaper.webp"), fit: BoxFit.cover)),
      child: Column(
        children: [
          SizedBox(
            height: 80,
          ),
          SizedBox(height: 200, child: DigitalClockCard()),
          Text(
            'Clock Widget',
            style: TextStyle(fontWeight: FontWeight.w900),
          ),
          Flexible(
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 0,
                mainAxisSpacing: 20,
              ),
              itemCount: 9,
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
      {
        "icon": FontAwesomeIcons.medal,
        "name": "Awards",
        "screen": Awardspage()
      },
      {"icon": Icons.photo, "name": "Gallery", "screen": Gallery()},
      {"icon": FontAwesomeIcons.file, "name": "Resume", "url": resume},
      {"icon": Icons.contact_mail_rounded, "name": "Contact", "url": contact},
      {"icon": FontAwesomeIcons.github, "name": "Github", "url": github},
      {"icon": FontAwesomeIcons.linkedin, "name": "LinkedIn", "url": linkedin},
      // {"icon": Icons.phone_android, "name": "Device", "screen": Devicepage()},
      {
        "icon": FontAwesomeIcons.googlePlay,
        "name": "Play Store",
        "url": playstore
      },
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Card(
              color: Color(0xFFD1C4E9),
              child: Padding(
                padding: EdgeInsets.all(6),
                child: Icon(
                  app["icon"],
                  size: 50,
                ),
              ),
            ),
          ),
          Text(
            app["name"],
            softWrap: true,
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w900, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
