// ignore_for_file: unnecessary_const, prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';

class MethodTreatmentScreen extends StatefulWidget {
  const MethodTreatmentScreen({Key key}) : super(key: key);

  @override
  State<MethodTreatmentScreen> createState() => _MethodTreatmentScreenState();
}

class _MethodTreatmentScreenState extends State<MethodTreatmentScreen> {
  TextStyle headerstyle =
      TextStyle(fontSize: 15, color: Colors.white, fontFamily: 'Taitham3');

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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
      ),
      backgroundColor: Colors.indigo,
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Text(
              'Method of treatment',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(text: 'วิธีการรักษา', style: headerstyle),
                      TextSpan(
                          text: '\t\t\tการตรวจวินิจฉัย/การรักษาเเละป้องกัน\n',
                          style: headerstyle)
                    ])),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: size.height,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.05),
                  height: size.height,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24))),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 35, top: 120.0),
                          child: Text(
                            indexbutton == 1
                                ? 'วินิจฉัย'
                                : indexbutton == 2
                                    ? 'การรักษา'
                                    : 'การป้องกัน',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Taitham3'),
                          ),
                        ),
                        Image.asset(
                          'assets/images/menu/maledoctor.png',
                          scale: 1.5,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          buttonNew(
                            title: 'วินิจฉัย',
                            changeIndexButton: changeButton,
                            index: 1,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          buttonNew(
                            title: 'การรักษา',
                            changeIndexButton: changeButton,
                            index: 2,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          buttonNew(
                            title: 'การป้องกัน',
                            changeIndexButton: changeButton,
                            index: 3,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SelectWidget(size)
                  ],
                ),
              ],
            ),
          )
        ],
      )),
    );
  }

  Widget SelectWidget(Size size) {
    if (indexbutton == 1) {
      return skinCancer(size, detail[0]);
    } else if (indexbutton == 2) {
      return skinCancer(size, detail[1]);
    } else {
      return skinCancer(size, detail[2]);
    }
  }

  Padding skinCancer(Size size, String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: size.width,
        decoration: BoxDecoration(
            color: Colors.indigo, borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 18, color: Colors.white, fontFamily: 'Taitham3'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text('ผู้เขียน',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Taitham3')),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
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

class buttonNew extends StatelessWidget {
  final String title;
  final Function changeIndexButton;
  final int index;
  const buttonNew({
    Key key,
    this.title,
    this.changeIndexButton,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => changeIndexButton(index),
      child: Container(
        width: MediaQuery.of(context).size.width - 270,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.indigo.shade50,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
