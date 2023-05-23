import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skincacer_project_final/constrance.dart';

import '../widgets/listcard.dart';

// ignore: must_be_immutable
class AboutScreen extends StatelessWidget {
  AboutScreen({
    Key key,
  }) : super(key: key);

  List<String> iconimages = [
    'assets/images/about/lip.png',
    'assets/images/about/ris.png',
    'assets/images/about/sasin.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kheaderColor,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Skin Cancer Classification',
                style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.headline4,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                    color: Colors.white),
              ),
            ],
          )),
      backgroundColor: kbackgroundColor,
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * 0.35,
            decoration: const BoxDecoration(
                color: kheaderColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
          ),
          Column(children: [
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text('About Me',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),
            const Text(
              'Songkhla Rajabhat University',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
            const Text(
              'Faculty Science And Technology',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 0.65,
                  children: <Widget>[
                    // widgets listcard.dart
                    ListCard(
                      name: 'ปอริวัตน์ การันสันติ',
                      imageicon: iconimages[0],
                      index: 4,
                      github: 'cs-634234011',
                    ),
                    ListCard(
                      name: 'ฮาริส สาดีน',
                      imageicon: iconimages[1],
                      index: 4,
                      github: 'cs-634234024',
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: size.width,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(iconimages[2]),
                                fit: BoxFit.contain),
                            borderRadius: BorderRadius.circular(80),
                            border: Border.all(color: kheaderColor, width: 1.0),
                            color: Colors.white),
                        // child:
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'ดร.ศศิน จันทร์พวงทอง',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            fontFamily: 'Taitham3'),
                      ),
                      const Text(
                        'อาจารย์ที่ปรึกษา',
                        style: TextStyle(
                          fontFamily: 'Taitham3',
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
