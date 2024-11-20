import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Uri nilam = Uri.parse('https://tascuit-nilam.onrender.com');
Uri manage = Uri.parse('https://tascuit-manage.onrender.com');
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
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 18),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.start, // Align back button to the left
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.arrow_back_ios_new),
                ),
                SizedBox(
                  width: 50,
                ),
                Text(
                  'Projects',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1.1,
                    crossAxisCount: 1,
                    crossAxisSpacing: 0),
                itemCount: projects.length,
                itemBuilder: (context, index) {
                  final project = projects[index];

                  return Card(
                    color: Color(0xFFD1C4E9),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 4),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            project['title']!,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            textAlign: TextAlign.justify,
                            project['content']!,
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                          Spacer(),
                          SizedBox(
                            width: double.maxFinite,
                            child: ElevatedButton(
                                onPressed: () {
                                  launchUrl(project['url']);
                                },
                                child: Text('Visit Site')),
                          ),
                          Spacer(),
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
    );
  }
}
