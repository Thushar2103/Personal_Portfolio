import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Aboutpage extends StatelessWidget {
  const Aboutpage({super.key});

  Widget info() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Name:",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        Text(
          "Thushar",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          "Email:",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        Text(
          "tthushar2004@gmail.com",
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
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
                    'About',
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 18),
                    Container(
                      width: double.maxFinite,
                      height: 150,
                      color: Colors.transparent,
                      child: Stack(children: [
                        Card(
                          margin: EdgeInsets.only(
                              right: 70, top: 10, left: 5, bottom: 10),
                          shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(width: 4)),
                          color: Colors.amber,
                          child: SizedBox(
                            width: double.maxFinite,
                            height: 150,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Expanded(
                                    child: info(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.black,
                                width: 4,
                              ),
                            ),
                            child: CircleAvatar(
                              radius: 46,
                              backgroundImage: AssetImage('image/me.jpg'),
                            ),
                          ),
                        )
                      ]),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "About Me",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Card(
                      color: Color(0xFFD1F8E3),
                      shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(width: 4)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          textAlign: TextAlign.justify,
                          "I'm a software tester with experience in Flutter development, building reliable, high-quality apps. When I'm not testing or coding, I enjoy travelling and finding new inspiration from different places.",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Development Tools/\nFrameworks",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Card(
                      color: Color(0xFFD1F8E3),
                      shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(width: 4)),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Flutter",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            LinearPercentIndicator(
                              lineHeight: 25,
                              percent: 0.8,
                              backgroundColor: Colors.grey[300]!,
                              progressColor: Colors.green,
                              barRadius: Radius.circular(5),
                              padding: EdgeInsets.symmetric(vertical: 7.0),
                            ),
                            Text(
                              "Django",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            LinearPercentIndicator(
                              lineHeight: 25,
                              percent: 0.7, // 60% proficiency in Django
                              backgroundColor: Colors.grey[300]!,
                              progressColor: Colors.green,
                              barRadius: Radius.circular(5),
                              padding: EdgeInsets.symmetric(vertical: 7.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Programming Languages",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Card(
                      color: Color(0xFFD1F8E3),
                      shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(width: 4)),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Dart",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            LinearPercentIndicator(
                              lineHeight: 25,
                              percent: 0.8,
                              backgroundColor: Colors.grey[300]!,
                              progressColor: Colors.green,
                              barRadius: Radius.circular(5),
                              padding: EdgeInsets.symmetric(vertical: 7.0),
                            ),
                            Text(
                              "Python",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            LinearPercentIndicator(
                              lineHeight: 25,
                              percent: 0.7,
                              backgroundColor: Colors.grey[300]!,
                              progressColor: Colors.green,
                              barRadius: Radius.circular(5),
                              padding: EdgeInsets.symmetric(vertical: 7.0),
                            ),
                            Text(
                              "Java",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            LinearPercentIndicator(
                              lineHeight: 25,
                              percent: 0.7, // 60% proficiency in Django
                              backgroundColor: Colors.grey[300]!,
                              progressColor: Colors.green,
                              barRadius: Radius.circular(5),
                              padding: EdgeInsets.symmetric(vertical: 7.0),
                            ),
                            Text(
                              "Sql",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            LinearPercentIndicator(
                              lineHeight: 25,
                              percent: 0.9, // 60% proficiency in Django
                              backgroundColor: Colors.grey[300]!,
                              progressColor: Colors.green,
                              barRadius: Radius.circular(5),
                              padding: EdgeInsets.symmetric(vertical: 7.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Others",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Card(
                      shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(width: 4)),
                      color: Color(0xFFD1F8E3),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Selenium",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            LinearPercentIndicator(
                              lineHeight: 25,
                              percent: 0.8,
                              backgroundColor: Colors.grey[300]!,
                              progressColor: Colors.green,
                              barRadius: Radius.circular(5),
                              padding: EdgeInsets.symmetric(vertical: 7.0),
                            ),
                            Text(
                              "Appium",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            LinearPercentIndicator(
                              lineHeight: 25,
                              percent: 0.8,
                              backgroundColor: Colors.grey[300]!,
                              progressColor: Colors.green,
                              barRadius: Radius.circular(5),
                              padding: EdgeInsets.symmetric(vertical: 7.0),
                            ),
                            Text(
                              "Manual Testing",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            LinearPercentIndicator(
                              lineHeight: 25,
                              percent: 0.8,
                              backgroundColor: Colors.grey[300]!,
                              progressColor: Colors.green,
                              barRadius: Radius.circular(5),
                              padding: EdgeInsets.symmetric(vertical: 7.0),
                            ),
                            Text(
                              "Git",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            LinearPercentIndicator(
                              lineHeight: 25,
                              percent: 0.7,
                              backgroundColor: Colors.grey[300]!,
                              progressColor: Colors.green,
                              barRadius: Radius.circular(5),
                              padding: EdgeInsets.symmetric(vertical: 7.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
