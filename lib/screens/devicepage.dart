import 'package:flutter/material.dart';

class Devicepage extends StatelessWidget {
  const Devicepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back_ios_new),
            ),
            Card(
              child: SizedBox(
                width: double.maxFinite,
                height: 150,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
