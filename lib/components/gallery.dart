import 'package:flutter/material.dart';

class Gallery extends StatelessWidget {
  Gallery({super.key});

  final List<String> imageUrls = [
    'image/1.JPG',
    'image/2.JPG',
    'image/3.JPG',
    'image/4.jpg',
    'image/5.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
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
                    'Gallery',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: GridView.builder(
                physics: ClampingScrollPhysics(),
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
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    leading: IconButton(
                                        iconSize: 20,
                                        onPressed: () => Navigator.pop(context),
                                        icon: Icon(Icons.close)),
                                  ),
                                  content: Image.asset(
                                    filterQuality: FilterQuality.none,
                                    imageUrls[index],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                imageUrls[index],
                                fit: BoxFit.cover,
                                frameBuilder: (BuildContext context,
                                    Widget child,
                                    int? frame,
                                    bool wasSynchronouslyLoaded) {
                                  if (frame == null) {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  } else {
                                    return child;
                                  }
                                },
                              ))));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
