import 'package:flutter/material.dart';

class Awardspage extends StatelessWidget {
  Awardspage({super.key});

  final List<Map<String, dynamic>> listAward = [
    {
      'icon': Icons.directions_bike_rounded,
      'title': 'Start of Expedition',
      'content':
          'Started the expedition on May 18, 2023, at 5:28 am from Ayanambakkam (Chennai)',
    },
    {
      'icon': Icons.flag_rounded,
      'title': 'End of Expedition',
      'content':
          'Completed the expedition on June 18, 2023, at 7:49 pm at Ayanambakkam (Chennai)',
    },
    {
      'icon': Icons.map,
      'title': 'States and Union Territories Covered',
      'content': 'Covered 21 Indian states and 4 union territories',
    },
    {
      'icon': Icons.map_rounded,
      'title': 'Distance Traveled',
      'content':
          'Traveled a total distance of 12,521.8 kilometers on my Royal Enfield Thunderbird 350',
    },
    {
      'icon': Icons.calendar_month,
      'title': 'Age at Completion',
      'content':
          'Completed the expedition at the age of 19 years, 3 months, and 13 days',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(height: 30),
            Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_ios_new),
                  ),
                ),
                Align(
                  heightFactor: 1.5,
                  alignment: Alignment.center,
                  child: Text(
                    'Awards',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: Column(
                  children: [
                    Text(
                      'India Book Of Records',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(
                        width: double.maxFinite,
                        height: 230,
                        child: Card(
                          elevation: 0,
                          color: Colors.transparent,
                          child: Stack(
                            children: [
                              SizedBox(
                                  width: double.maxFinite,
                                  height: 150,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 4),
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.blue,
                                          Colors.purple
                                        ], // Define the gradient colors
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                          10), // Matches card's border radius
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Text(
                                        textAlign: TextAlign.justify,
                                        'Maximum Indian states and union territories covered by a teen in a solo roundtrip motorcycle expedition',
                                        style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ),
                                  )),
                              Align(
                                alignment: AlignmentDirectional.bottomCenter,
                                child: Container(
                                  width: 160,
                                  height: 160,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 4,
                                    ),
                                  ),
                                  child: CircleAvatar(
                                    radius: 60, // Avatar size
                                    backgroundImage: AssetImage(
                                        'image/record.webp'), // Avatar image
                                  ),
                                ),
                              )
                            ],
                          ),
                        )),
                    ...listAward.map((award) {
                      return Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Color(0xFFD1F8E3),
                                border: Border.all(width: 4),
                                borderRadius: BorderRadius.circular(10)),
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 5,
                                ),
                                Icon(award['icon']),
                                ListTile(
                                  title: Text(
                                    textAlign: TextAlign.center,
                                    award['title'],
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    textAlign: TextAlign.justify,
                                    award['content'],
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10)
                        ],
                      );
                    }),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
