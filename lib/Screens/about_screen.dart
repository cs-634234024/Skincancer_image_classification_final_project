import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  AboutScreen({
    Key key,
  }) : super(key: key);

  List<String> iconimages = [
    'assets/images/menu/avatar1.png',
    'assets/images/menu/avatar2.png'
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Container(
          height: size.height * 0.35,
          decoration: const BoxDecoration(
              color: Colors.indigo,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text('About Me',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo.shade100)),
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
                  childAspectRatio: 0.5,
                  children: <Widget>[
                    ListCard(
                      studentId: '634234011',
                      name: 'ปอริวัตน์ การันสันติ',
                      imageicon: iconimages[1],
                      index: 4,
                    ),
                    ListCard(
                      studentId: '634234024',
                      name: 'ฮาริส สาดีน',
                      imageicon: iconimages[0],
                      index: 4,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ListCard extends StatelessWidget {
  final String imageicon;
  final int index;
  final String name;
  final Function changeindex;
  final String studentId;
  const ListCard({
    Key key,
    this.imageicon,
    this.changeindex,
    this.index,
    this.name,
    this.studentId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.indigo.shade50),
      child: Column(
        children: <Widget>[
          Image.asset(
            imageicon,
            scale: 2,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            name,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                fontFamily: 'Taitham3'),
          ),
          Text(
            studentId,
            style: const TextStyle(
              fontFamily: 'Taitham3',
              fontSize: 18,
            ),
          )
        ],
      ),
    );
  }
}
