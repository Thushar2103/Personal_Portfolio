import 'package:flutter/material.dart';

class ProjectsPage extends StatelessWidget {
  ProjectsPage({super.key});

  final List<Map<String, String>> projects = [
    {
      'title': 'Tascuit Nilam',
      'content':
          'Add and format text, images, and links using a simple editor, which automatically generates HTML for publishing.'
    },
    {
      'title': 'Tascuit Expense',
      'content':
          'Create and manage personalized categories to track specific spending habits. View detailed monthly reports of your financial trends and adjust your budget.',
    },
    {
      'title': 'Manage (Task Reminder)',
      'content':
          'A local task management app that lets you create, track, and organize tasks efficiently. Includes to-do lists and sticky notes for better task management.',
    },
    {
      'title': 'Random Image Puzzle Game',
      'content':
          'Use the Unsplash API to fetch a random image for each puzzle, providing a unique experience every time.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
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
                    childAspectRatio: 1.2,
                    crossAxisCount: 1,
                    crossAxisSpacing: 0),
                itemCount: projects.length,
                itemBuilder: (context, index) {
                  final project = projects[index];

                  return Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 0.5),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            project['title']!, // Title of the project
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            project[
                                'content']!, // Trim whitespace and show each point
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                          Spacer(),
                          SizedBox(
                            width: double.maxFinite,
                            child: ElevatedButton(
                                onPressed: () {}, child: Text('Visit Site')),
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
