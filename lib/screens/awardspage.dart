import 'package:flutter/material.dart';

class Awardspage extends StatelessWidget {
  const Awardspage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
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
                  'Awards',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Expanded(
              child: SizedBox(
                child: Column(
                  children: [
                    SizedBox(
                        width: double.maxFinite, height: 150, child: Card())
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
