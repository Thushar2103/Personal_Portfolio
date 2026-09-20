import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Uri nilam = Uri.parse('https://tascuit-nilam.onrender.com');
Uri manage = Uri.parse('https://tascuit-manage.onrender.com');
Uri webauto = Uri.parse('https://github.com/Thushar2103/web-automation');
Uri expense = Uri.parse(
    'https://play.google.com/store/apps/details?id=com.tascuit.expense');
Uri puzzle = Uri.parse('https://github.com/Thushar2103/Unsplash-Puzzle-Game');

class ProjectsPage extends StatelessWidget {
  ProjectsPage({super.key});

  final List<Map<String, dynamic>> projects = [
    {
      'title': 'Tascuit Nilam',
      'content':
          'Add and format text, images, and links using a simple editor, which automatically generates HTML for publishing.',
      'url': nilam
    },
    {
      'title': 'WebAuto',
      'content':
          'A web automation tool that allows users to design workflows in a Flutter-based interface, save them as JSON, and execute tasks like navigation, loops, and interactions dynamically using Selenium.',
      'url': webauto
    },
    {
      'title': 'Tascuit Expense',
      'content':
          'Create and manage personalized categories to track specific spending habits. View detailed monthly reports of your financial trends and adjust your budget.',
      'url': expense
    },
    {
      'title': 'Manage (Task Reminder)',
      'content':
          'A local task management app that lets you create, track, and organize tasks efficiently. Includes to-do lists and sticky notes for better task management.',
      'url': manage
    },
    {
      'title': 'Random Image Puzzle Game',
      'content':
          'Unsplash API to fetch a random image for each puzzle, providing a unique experience every time.',
      'url': puzzle
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
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
                        'Projects',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 48), // To balance the back button
                  ],
                ),
              ),
              Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(20.0),
                  itemCount: projects.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final project = projects[index];

                    return Card(
                      color: Colors.white.withOpacity(0.05),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Colors.white.withOpacity(0.1), width: 1),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              project['title']!,
                              style: TextStyle(
                                color: Colors.tealAccent[400],
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              project['content']!,
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                                height: 1.5,
                              ),
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: double.infinity,
                              height: 45,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.tealAccent[400],
                                  foregroundColor: Colors.black,
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                onPressed: () {
                                  launchUrl(project['url']);
                                },
                                child: const Text(
                                  'Visit Site',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
