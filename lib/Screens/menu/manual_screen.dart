// ignore_for_file: unnecessary_const, prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constrance.dart';

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

  List<String> detail = [
    '\t\t\t\t\t\tการตรวจวินิจฉัย\n\n การรักษามะเร็งผิวหนังที่ดีที่สุดคือ การค้นพบตั้งแต่แรกเริ่ม โดยต้องสำรวจร่างกายตัวเองให้ทั่ว ซึ่งต้องใช้กระจกและมือช่วย ถ้ามีข้อสงสัยให้ปรึกษาแพทย์ผิวหนังเพื่อการวินิจฉัย ซึ่งทำได้โดยการตัดชิ้นเนื้อบริเวณที่สงสัยส่งตรวจทางพยาธิวิทยา',
    '\t\t\t\t\t\tการบำบัดรักษา \n\n มะเร็งผิวหนังระยะเริ่มต้นใช้วิธีการผ่าตัดก็สามารถหายขาดได้ แต่หากเป็นมะเร็งระยะกระจายหรือมะเร็งผิวหนังเมลาโนมา หลังผ่าตัดอาจต้องมีการใช้การฉายแสงหรือเคมีบำบัดร่วมได้',
    '\t\t\t\t\t\tการป้องกัน\n\n 1.หลีกเลี่ยงแสงแดด ใช้ครีมกันแดด SPF > 15\n\n 2. หลีกเลี่ยงภาวะระคายเคืองผิวหนัง'
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
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 10),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'คู่มือในการใช้งาน เเอปพลิเคชัน',
                    style: TextStyle(
                      fontSize: 15,
                      color: kheaderColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.book,
                    color: kheaderColor,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Container(
              width: size.width,
              height: 1820,
              decoration: BoxDecoration(
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

class TextOutput extends StatelessWidget {
  const TextOutput({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, right: 5, left: 5),
      child: Container(
        width: size.width,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: kbottomColor),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 10,
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
    );
  }
}
