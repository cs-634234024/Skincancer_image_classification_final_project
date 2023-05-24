// ignore_for_file: unnecessary_const, prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable, non_constant_identifier_names, empty_constructor_bodies

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:skincacer_project_final/Screens/menu/prediction_red.dart';

import '../../constrance.dart';
import '../../widgets/output_header.dart';

class ManualScreen extends StatefulWidget {
  const ManualScreen({Key key}) : super(key: key);

  @override
  State<ManualScreen> createState() => _ManualScreenState();
}

class _ManualScreenState extends State<ManualScreen> {
  TextStyle headerstyle =
      TextStyle(fontSize: 16, color: Colors.black, fontFamily: "Taitham3");

  int indexbutton = 0;

  void changeButton(int index) {
    setState(() {
      indexbutton = index;
      print(indexbutton);
    });
  }

  List<String> details = [
    'เลือก ปุ่ม Take a Photo เพื่อถ่ายรูป ใฝ ของคุณ หรือ เลือก ปุ่ม Camera Roll เพื่อเลือกรูปจาก เเกลลอรี่ของคุณ ในการทำนายผล  ',
    'หลังจากการทำนายผล สามารถคลิ๊กเพื่อดูรายละเอียด ของการเป็นโรคได้ หรือหาก ไม่พบความเสี่ยงในการเป็นโรคก็สามารถ คลิ๊กเพื่อดูรายละเอียดเเละข้อมูลเพื่มเติมของโรคมะเร็งได้ ',
    'หลังจาก คลิ๊กเพื่อดูรายละเอียด เพิ่มเติมท่าน สามารถอ่านรายละเอียด ของขั้นตอนการรักษาได้ หรือ คลิ๊กไปที่ปุ่ม หมายเหตุ เพื่อดูรายละเอียดของการใช้โมเดลนี้ในการคำนวณผลการเป็นโรคมะเร็ง',
    'ท่านสามารถเลือกเมนูด่านล่าง เพื่อเข้าไปดูรายละเอียดต่างๆของ ตัวเเอปพลิเคชัน ไม่ว่าจะเป็น เมนูการรักษา เมนูมะเร็งคืออะไร หรือเมนูคู่มือในการใช้เเอปพลิเคชัน เพื่อดูรายละเอียดต่างๆ '
  ];

  List<String> images = [
    'assets/images/manual/m1.png',
    'assets/images/manual/m2.png',
    'assets/images/manual/m3.png',
    'assets/images/manual/m4.png',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ListView(children: [
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: 15,
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 45.0),
            child: Text(
              'Manual / คู่มือ',
              style: TextStyle(
                fontSize: 25,
                color: kheaderColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          OutputHeader(
            title: 'คู่มือ\t เเละการใช้เเอปพลิเคชันเบื้องต้น ',
            icon: FaIcon(
              FontAwesomeIcons.book,
              color: kheaderColor,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Container(
              width: size.width,
              height: size.height + 1900,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 7,
                        blurRadius: 5,
                        offset: Offset(0, 3))
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: kheaderColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'คู่มือในการใช้เเอปพลิเคชัน',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Taitham3"),
                            ),
                            FaIcon(
                              FontAwesomeIcons.book,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                    ManualCard(
                      title: 'ขั้นตอนที่ 1 ',
                      images: images[0],
                      detail: details[0],
                    ),
                    ManualCard(
                      title: 'ขั้นตอนที่ 2 ',
                      images: images[1],
                      detail: details[1],
                    ),
                    ManualCard(
                      title: 'ขั้นตอนที่ 3 ',
                      images: images[2],
                      detail: details[2],
                    ),
                    ManualCard(
                      title: 'ขั้นตอนที่ 4 ',
                      images: images[3],
                      detail: details[3],
                    )
                  ],
                ),
              ),
            ),
          )
        ])
      ])
    ]);
  }
}

class ManualCard extends StatelessWidget {
  final String title;
  final String images;
  final String detail;
  const ManualCard({
    Key key,
    this.title,
    this.images,
    this.detail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Container(
          width: size.width,
          height: 400,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: kbackgroundColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Image.asset(
                    images,
                    scale: 6,
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white70),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        detail,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
