import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'profile_page.dart';
import 'about_page.dart';

class DashboardPage extends StatelessWidget {
  void _launchURL(String url) async {
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
        title: Text('Dashboard'),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Muhamad Rizqy Desem Raharji"),
              accountEmail: Text("rizqydesem@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/profile_image.jpg'),
              ),
            ),
            ListTile(
              title: Text('Profile'),
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
            ListTile(
              title: Text('About'),
              onTap: () {
                Navigator.pushNamed(context, '/about');
              },
            ),
            ListTile(
              title: Text('Location'),
              onTap: () async {
                final url = 'https://maps.app.goo.gl/z2oBVzUrZjFznU1S7';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/profile_image.jpg'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/profile');
                },
                child: Text('Profile'),
              ),
              SizedBox(height: 20),
              Text(
                'Social Media',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Container(
                height: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialMediaIcon(
                      imageURL: 'assets/whatsapp.png',
                      text: 'WhatsApp',
                      onTap: () {
                        _launchURL('https://wa.me/qr/BAPPPS33HXFVD1');
                      },
                    ),
                    SocialMediaIcon(
                      imageURL: 'assets/instagram.png',
                      text: 'Instagram',
                      onTap: () {
                        _launchURL('https://www.instagram.com/dahlahkeselsaya/?igshid=YmMyMTA2M2Y%3D');
                      },
                    ),
                    SocialMediaIcon(
                      imageURL: 'assets/email.png',
                      text: 'Email',
                      onTap: () {
                        _launchURL('mailto:rizqydesem@gmail.com');
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Banking',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Container(
                height: 200,
                child: build3DCard(),
              ),
              SizedBox(height: 20),
              Text(
                'News',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              buildNewsCards(),
            ],
          ),
        ),
      ),
    );
  }

  Widget build3DCard() {
    return Container(
      width: 300,
      height: 200,
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(left: 32, right: 32, top: 2, bottom: 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 1,
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            gradientCardSample(),
            Text(
              'Cards',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget gradientCardSample() {
    return Container(
      height: 120,
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF846AFF),
            Color(0xFF755EE8),
            Colors.purpleAccent,
            Colors.amber,
          ],
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cards',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '4111 7679 6969 9769',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '\$79.000',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildNewsCards() {
    final newsData = [
      {
        'title': 'Masinton PDIP: Pak Jokowi Masih Sayang Bu Mega Nggak?',
        'description':
            'Politikus PDIP Masinton Pasaribu bicara isu kondisi hubungan Presiden Joko Widodo (Jokowi) dengan Ketum PDIP Megawati Soekarnoputri. Masinton mengatakan bahwa Megawati Soekarnoputri menyayangi Presiden Jokowi.',
        'imageURL':
            'https://akcdn.detik.net.id/community/media/visual/2023/10/29/masinton-pasaribu-bicara-hubungan-jokowi-megawati_169.jpeg?w=700&q=90',
        'newsURL':
            'https://news.detik.com/pemilu/d-7008340/masinton-pdip-pak-jokowi-masih-sayang-bu-mega-nggak',
      },
      {
        'title': 'Mahasiswa Unnes Tewas di Mall Paragon, Diduga Bunuh Diri dan Tinggalkan Surat',
        'description':
            'Baru-baru ini publik dihebohkan dengan kabar kurang mengenakkan yang terjadi di Mall Paragon, Semarang, Jawa Tengah. Pasalnya, pada Selasa (10/10/2023) ditemukan jasad wanita di area pintu keluar parkir mal tersebut.',
        'imageURL':
            'https://static.promediateknologi.id/crop/0x0:0x0/0x0/webp/photo/p2/01/2023/10/12/unnes-2094324043.jpg',
        'newsURL':
            'https://www.liputan6.com/regional/read/5421592/mahasiswa-unnes-tewas-di-mall-paragon-diduga-bunuh-diri-dan-tinggalkan-surat',
      },
      {
        'title': 'Bekuk Barcelona, Meme Jude Bellingham Jadi Raja Baru El Clasico',
        'description':
            'Jude Bellingham jadi bintang di pertandingan El Clasico semalam. Ia membukukan dua gol dan berhasil mengalahkan Barcelona dengan skor akhir 2-1.',
        'imageURL':
            'https://akcdn.detik.net.id/community/media/visual/2023/10/29/el-classico.png?w=750&q=90',
        'newsURL':
            'https://inet.detik.com/fotoinet/d-7007566/bekuk-barcelona-meme-jude-bellingham-jadi-raja-baru-el-clasico',
      },
    ];

    final newsCards = newsData.map((news) {
      return NewsCard(
        title: news['title']!,
        description: news['description']!,
        imageURL: news['imageURL']!,
        newsURL: news['newsURL']!,
        launchURL: _launchURL,
      );
    }).toList();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: newsCards,
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageURL;
  final String newsURL;
  final Function(String) launchURL;

  NewsCard({
    required this.title,
    required this.description,
    required this.imageURL,
    required this.newsURL,
    required this.launchURL,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launchURL(newsURL);
      },
      child: Container(
        width: 200,
        margin: EdgeInsets.all(8),
        child: Card(
          child: Column(
            children: [
              Image.network(
                imageURL,
                height: 100,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(description),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SocialMediaIcon extends StatelessWidget {
  final String imageURL;
  final String text;
  final Function onTap;

  SocialMediaIcon({
    required this.imageURL,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Column(
        children: [
          Image.asset(
            imageURL,
            width: 48,
            height: 48,
          ),
          Text(text),
        ],
      ),
    );
  }
}
