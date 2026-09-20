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
          Flexible(
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 0,
                mainAxisSpacing: 20,
                childAspectRatio: 0.75,
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
    // List of app icons and names with individual gradient colors
    List<Map<String, dynamic>> appData = [
      {
        "icon": Icons.person,
        "name": "About",
        "screen": Aboutpage(),
        "colors": [Colors.blue[400]!, Colors.blue[800]!]
      },
      {
        "icon": Icons.edit,
        "name": "Projects",
        "screen": ProjectsPage(),
        "colors": [Colors.orange[400]!, Colors.deepOrange[700]!]
      },
      {
        "icon": FontAwesomeIcons.medal,
        "name": "Awards",
        "screen": Awardspage(),
        "colors": [Colors.amber[400]!, Colors.orange[700]!]
      },
      {
        "icon": Icons.photo_library,
        "name": "Gallery",
        "screen": Gallery(),
        "colors": [Colors.purple[400]!, Colors.deepPurple[800]!]
      },
      {
        "icon": FontAwesomeIcons.solidFilePdf,
        "name": "Resume",
        "url": resume,
        "colors": [Colors.teal[400]!, Colors.teal[800]!]
      },
      {
        "icon": Icons.contact_mail_rounded,
        "name": "Contact",
        "url": contact,
        "colors": [Colors.green[400]!, Colors.green[800]!]
      },
      {
        "icon": FontAwesomeIcons.github,
        "name": "Github",
        "url": github,
        "colors": [Colors.grey[700]!, Colors.black]
      },
      {
        "icon": FontAwesomeIcons.linkedinIn,
        "name": "LinkedIn",
        "url": linkedin,
        "colors": [Colors.lightBlue[400]!, Colors.blue[800]!]
      },
      {
        "icon": FontAwesomeIcons.googlePlay,
        "name": "Play Store",
        "url": playstore,
        "colors": [Colors.red[400]!, Colors.blue[600]!]
      },
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
            child: Container(
              height: 65,
              width: 65,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: app["colors"],
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: app["colors"][1].withOpacity(0.5),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  )
                ],
              ),
              child: Center(
                child: Icon(
                  app["icon"],
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            app["name"],
            textAlign: TextAlign.center,
            softWrap: true,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              shadows: [
                Shadow(
                  color: Colors.black.withOpacity(0.8),
                  blurRadius: 4,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
