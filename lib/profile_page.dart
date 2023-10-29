import 'package:flutter/material.dart';
import 'package:testing/theme.dart';
import 'package:testing/photo_album.dart';
import 'package:url_launcher/url_launcher.dart';

List<String> imgArray = [
  "assets/album-1.jpg",
  "assets/album-2.jpg",
  "assets/album-3.jpg",
  "assets/album-4.jpg",
  "assets/album-5.jpg",
  "assets/album-6.jpg"
];

class ProfilePage extends StatelessWidget {
  // Fungsi untuk membuka URL
  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/bg-profile.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/profile_image.jpg"),
                      radius: 65.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: Text(
                      "Muhamad Rizqy Desem Raharji",
                      style: TextStyle(
                        color: Color.fromARGB(255, 2, 4, 96),
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      "Email: rizqydesem@gmail.com",
                      style: TextStyle(
                        color: Color.fromARGB(255, 2, 4, 96),
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 24.0, left: 42, right: 32),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              "2K",
                              style: TextStyle(
                                color: Color.fromARGB(255, 2, 4, 96),
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Friends",
                              style: TextStyle(
                                color: Color.fromARGB(255, 2, 4, 96),
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "26",
                              style: TextStyle(
                                color: Color.fromARGB(255, 2, 4, 96),
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Comments",
                              style: TextStyle(
                                color: Color.fromARGB(255, 2, 4, 96),
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "48",
                              style: TextStyle(
                                color: Color.fromARGB(255, 2, 4, 96),
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Bookmarks",
                              style: TextStyle(
                                color: Color.fromARGB(255, 2, 4, 96),
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Aksi saat tombol "Follow" ditekan
                          },
                          style: ElevatedButton.styleFrom(
                            primary: NowUIColors.primary,
                          ),
                          child: Text("Follow"),
                        ),
                        GestureDetector(
                          onTap: () {
                            _launchURL('https://wa.me/qr/BAPPPS33HXFVD1');
                          },
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/whatsapp.png',
                                width: 48,
                                height: 48,
                              ),
                              Text('WhatsApp'),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _launchURL('https://www.instagram.com/dahlahkeselsaya/?igshid=YmMyMTA2M2Y%3D');
                          },
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/instagram.png',
                                width: 48,
                                height: 48,
                              ),
                              Text('Instagram'),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _launchURL('mailto:rizqydesem@gmail.com');
                          },
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/email.png',
                                width: 48,
                                height: 48,
                              ),
                              Text('Email'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 32.0,
                right: 32.0,
                top: 42.0,
              ),
              child: Column(
                children: [
                  Text(
                    "About me",
                    style: TextStyle(
                      color: NowUIColors.text,
                      fontWeight: FontWeight.w600,
                      fontSize: 17.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 24.0,
                      right: 24,
                      top: 30,
                      bottom: 24,
                    ),
                    child: Text(
                      "My name is Muhamad Rizqy Desem Raharji but usually called Jajak, I am an Informatics student at PGRI University Semarang. My life motto is never run away, if you suffer, suffer until you recover. My favorite thing is enjoying the sunset. The sunset is beatiful, is not it?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: NowUIColors.time,
                      ),
                    ),
                  ),
                  PhotoAlbum(imgArray: imgArray),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
