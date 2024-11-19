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
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text("Thushar"),
        Text(
          "Email:",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text("tthushar2004@gmail.com")
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 18),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(Icons.arrow_back_ios_new),
                          ),
                          SizedBox(width: 58),
                          Text(
                            'About',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Card(
                        color: Colors.amber,
                        // shape: ContinuousRectangleBorder(
                        //     borderRadius: BorderRadius.only(
                        //         topRight: Radius.circular(120))),
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
                                  height: 30,
                                ),
                                Expanded(
                                  child: info(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                      top: 70,
                      right: 10,
                      child: Container(
                        height: 100,
                        width: 90,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            "assets/me.JPG",
                            fit: BoxFit.cover,
                          ),
                        ),
                      )),
                ],
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "About Me",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "I'm a software tester with experience in Flutter development, building reliable, high-quality apps. When I'm not testing or coding, I enjoy travelling and finding new inspiration from different places.",
                      ),
                    ],
                  ),
                ),
              ),
              Card(
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
                        lineHeight: 35,
                        percent: 0.9,
                        backgroundColor: Colors.grey[300]!,
                        center: Text("80%"),
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
    );
  }
}
