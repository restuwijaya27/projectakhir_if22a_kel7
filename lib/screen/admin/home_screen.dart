import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/config/asset.dart';
import 'package:flutter_application_2/screen/admin/ayam_kampung.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: asset.colorPrimary,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Image(
                image: AssetImage('../asset/image/Banner.png'),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 25, bottom: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton('ayam Kampung', Icons.image_search, 0),
                      IconButton('Ayam Potong', Icons.image_search, 0),
                      IconButton('Lokasi', Icons.location_on, 0),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                "Testimoni",
                style: TextStyle(
                  color: asset.colorPrimaryDark,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              alignment: Alignment.topLeft,
            ),
            SizedBox(
              height: 170,
              child: ListView(
                children: [
                  CarouselSlider(
                    items: [
                      Testimoni(
                        'https://asset-2.img.lovepik.com/bg/20240204/Two-Roosters-Enjoying-the-Backdrop-Together-A-Captivating-Scene_3172445_wh860.jpg!/fw/860',
                        'Bersih, sehat, dan harga terjangkau. Sangat direkomendasikan!',
                        'Jumat, 2 Februari 2024',
                      ),
                      Testimoni(
                        'https://jambiindependent.disway.id/upload/074cc3740f14d7a5c23e59bc939318e3.JPG',
                        'Ayam-ayamnya berkualitas tinggi dan tidak berbau amis.',
                        'Minggu, 28 April 2024',
                      ),
                      Testimoni(
                        'https://asset-2.img.lovepik.com/bg/20240204/Two-Roosters-Enjoying-the-Backdrop-Together-A-Captivating-Scene_3172445_wh860.jpg!/fw/860',
                        'Ayamnya selalu segar dan siap untuk dimasak.',
                        'Jumat, 2 Mei 2024',
                      ),
                      Testimoni(
                        'https://asset-2.img.lovepik.com/bg/20240204/Two-Roosters-Enjoying-the-Backdrop-Together-A-Captivating-Scene_3172445_wh860.jpg!/fw/860',
                        'Ayamnya autentik dan membuat masakan jadi istimewa.',
                        'Sabtu, 4 Mei 2024',
                      ),
                      Testimoni(
                        'https://asset-2.img.lovepik.com/bg/20240204/Two-Roosters-Enjoying-the-Backdrop-Together-A-Captivating-Scene_3172445_wh860.jpg!/fw/860',
                        'Kualitas ayam yang baik dengan harga yang bersahabat.',
                        'Senin, 13 Mei 2024',
                      ),
                    ],
                    options: CarouselOptions(
                        height: 170,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        aspectRatio: 20 / 11,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        viewportFraction: 0.8),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}

class IconButton extends StatelessWidget {
  final String nameLabel;
  final IconData iconLabel;
  final int index;

  IconButton(this.nameLabel, this.iconLabel, this.index);

  List<Map> _fragment = [
    {'title': 'Ayam Kampung', 'view': AyamKampung()}
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            // margin: EdgeInsets.only(bottom: 5),
            child: Material(
              borderRadius: BorderRadius.all(
                Radius.circular(40),
              ),
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.all(
                  Radius.circular(40),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => _fragment[index]['view'],
                    ),
                  );
                },
                child: Container(
                  // margin: EdgeInsets.all(5),
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: asset.colorPrimaryDark,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  child: Center(
                    child: Stack(
                      children: [
                        Icon(
                          iconLabel,
                          color: Colors.white,
                          size: 40,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: Text(
              nameLabel,
              style: TextStyle(fontSize: 14),
            ),
          )
        ],
      ),
    );
  }
}

class Testimoni extends StatelessWidget {
  final String img;
  final String judul;
  final String tanggal;

  Testimoni(this.img, this.judul, this.tanggal);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                  image: NetworkImage(img),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                gradient: LinearGradient(
                  colors: [
                    asset.colorPrimary,
                    Colors.transparent,
                  ],
                  end: Alignment.topCenter,
                  begin: Alignment.bottomCenter,
                  stops: [0.1, 0.9],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    judul,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    tanggal,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      // alignment: Alignment(1, 1),
    );
  }
}
