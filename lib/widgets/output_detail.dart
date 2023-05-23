import 'package:flutter/material.dart';

import '../constrance.dart';

// widgets  เเสดงลายละเอียดของเเต่ละหน้า
class OutputDetail extends StatelessWidget {
  final String title;
  final Size size;
  const OutputDetail({Key key, this.title, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: size.width,
        decoration: BoxDecoration(
            color: kbuttonWidgetColor, borderRadius: BorderRadius.circular(30)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontFamily: 'Taitham3',
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text('ผู้เขียน',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Taitham3')),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'พญ.พจนา  จิตตวัฒนรัตน์ ',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Taitham3'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
