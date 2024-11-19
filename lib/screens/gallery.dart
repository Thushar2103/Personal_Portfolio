import 'package:flutter/material.dart';

class Gallery extends StatelessWidget {
  Gallery({super.key});

  final List<String> imageUrls = [
    'assets/1.jpg',
    'assets/2.jpg',
    'assets/3.jpg',
    'assets/4.jpg',
    'assets/5.jpg',
    // 'https://lh3.googleusercontent.com/d/AKGpihbg8E41-L7H5vGmD6rGVoqdBTUbckzwPOfTNRD3yWyrSd2_MqiLuAOz6E-pMvpx1CLlBVAK0pMMXKAuu0RqT_yST5ydFD4nqfA=w1000',
    // 'https://drive.google.com/drive-viewer/AKGpihYFze198AGjs29XGBDzBHjpdez6zkWOvuCE8KyLP9dhczV56zUsHL8kpmIeEYRFboqmi6JcIOzsq38rO1LrMcfYSy6VnW_EwJU=s1600-rw-v1',
    // 'https://drive.google.com/uc?id=AKGpihbg8E41-L7H5vGmD6rGVoqdBTUbckzwPOfTNRD3yWyrSd2_MqiLuAOz6E-pMvpx1CLlBVAK0pMMXKAuu0RqT_yST5ydFD4nqfA',
    // 'https://drive.google.com/uc?id=AKGpihaZTOzLgSdHesKPNOHZi6ZqOIOH4VgCmZ-uqQ6MUMRo_YN-7YSkUpSBC3Ip5ZLECtwIKKU-JH4Ry9LbJXmu5nRpa8MoMdEC-Q',
    // 'https://drive.google.com/uc?id=AKGpihYFze198AGjs29XGBDzBHjpdez6zkWOvuCE8KyLP9dhczV56zUsHL8kpmIeEYRFboqmi6JcIOzsq38rO1LrMcfYSy6VnW_EwJU',
    // 'https://drive.google.com/uc?id=AKGpihbjCe7Cz4OKNTT_Xy9PaHS6dGK76nwWsEvuQk6k7VpzIFIwCIBjwMGBA-FHcq6NXPlXZPX7zCrzotAEJ00C_XY1kJILxgdh8WI',
  ];

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
                            child: Image.asset(
                              imageUrls[index],
                              fit: BoxFit.cover,
                            ),
                            // child: NetworkImage(imageUrls[index]),
                          ),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          imageUrls[index],
                          fit: BoxFit.cover,
                        ),
                        // child: NetworkImage(imageUrls[index]),
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
