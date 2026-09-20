import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Aboutpage extends StatelessWidget {
  const Aboutpage({super.key});

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, top: 16, bottom: 8),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          color: Colors.tealAccent[400],
          fontSize: 14,
          fontWeight: FontWeight.w900,
          letterSpacing: 1.5,
        ),
      ),
    );
  }

  Widget _buildCard({required Widget child}) {
    return Card(
      color: Colors.white.withOpacity(0.05),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.white.withOpacity(0.1), width: 1),
      ),
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: child,
      ),
    );
  }

  Widget _buildSkill(String name, double percent) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          LinearPercentIndicator(
            lineHeight: 8,
            percent: percent,
            backgroundColor: Colors.white.withOpacity(0.1),
            progressColor: Colors.tealAccent[400],
            barRadius: const Radius.circular(10),
            padding: EdgeInsets.zero,
            animation: true,
            animationDuration: 1000,
          ),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return _buildCard(
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.tealAccent[400]!, width: 2),
              boxShadow: [
                BoxShadow(
                  color: Colors.tealAccent[400]!.withOpacity(0.2),
                  blurRadius: 15,
                  spreadRadius: 2,
                )
              ],
            ),
            child: const CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage('image/me.webp'),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Thushar",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  "Software Tester & Dev",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Icon(Icons.email, color: Colors.tealAccent[400], size: 14),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: Text(
                        "tthushar2004@gmail.com",
                        style: TextStyle(color: Colors.white70, fontSize: 13),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors
          .transparent, // Inherit gradient if possible, but let's provide our own below
      body: Container(
        decoration: const BoxDecoration(
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
        child: SafeArea(
          child: Column(
            children: [
              // Custom AppBar
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back_ios_new,
                          color: Colors.white),
                    ),
                    const Expanded(
                      child: Text(
                        'About Me',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 48), // Balance the back button
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildProfileHeader(),
                      _buildSectionTitle("Biography"),
                      _buildCard(
                        child: const Text(
                          "I'm a software tester with experience in Flutter development, building reliable, high-quality apps. When I'm not testing or coding, I enjoy travelling and finding new inspiration from different places.",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 15,
                            height: 1.5,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      _buildSectionTitle("Dev Tools / Frameworks"),
                      _buildCard(
                        child: Column(
                          children: [
                            _buildSkill("Flutter", 0.8),
                            _buildSkill("Django", 0.7),
                          ],
                        ),
                      ),
                      _buildSectionTitle("Programming Languages"),
                      _buildCard(
                        child: Column(
                          children: [
                            _buildSkill("Dart", 0.7),
                            _buildSkill("Python", 0.7),
                            _buildSkill("Java", 0.5),
                          ],
                        ),
                      ),
                      _buildSectionTitle("Database"),
                      _buildCard(
                        child: Column(
                          children: [
                            _buildSkill("MySql", 0.9),
                          ],
                        ),
                      ),
                      _buildSectionTitle("Others"),
                      _buildCard(
                        child: Column(
                          children: [
                            _buildSkill("Selenium", 0.8),
                            _buildSkill("Appium", 0.8),
                            _buildSkill("Manual Testing", 0.8),
                            _buildSkill("Git", 0.7),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
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
