import 'package:flutter/material.dart';

class Gallery extends StatelessWidget {
  Gallery({super.key});

  final List<String> imageUrls = [
    'image/1.jpg',
    'image/2.jpg',
    'image/3.jpg',
    'image/4.jpg',
    'image/5.jpg',
    // Add other image URLs if needed
  ];

  // This function simulates loading an image from an asset
  Future<void> loadImage(String imagePath) async {
    await Future.delayed(Duration(seconds: 2)); // Simulating image load delay
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.arrow_back_ios_new),
                ),
                SizedBox(
                  width: 55,
                ),
                Text(
                  'Gallery',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 1.8,
                ),
                itemCount: imageUrls.length,
                itemBuilder: (context, index) {
                  return MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () => showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          title: ListTile(
                            title: Text(
                              'View Image',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            leading: IconButton(
                                iconSize: 20,
                                onPressed: () => Navigator.pop(context),
                                icon: Icon(Icons.close)),
                          ),
                          content: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: FutureBuilder<void>(
                              future:
                                  loadImage(imageUrls[index]), // Loading image
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  // While image is loading
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (snapshot.hasError) {
                                  return Center(
                                      child: Text('Error loading image'));
                                } else {
                                  return Image.asset(
                                    imageUrls[index],
                                    fit: BoxFit.cover,
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: FutureBuilder<void>(
                          future: loadImage(imageUrls[index]), // Loading image
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              // While image is loading
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (snapshot.hasError) {
                              return Center(child: Text('Error loading image'));
                            } else {
                              return Image.asset(
                                imageUrls[index],
                                fit: BoxFit.cover,
                              );
                            }
                          },
                        ),
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
