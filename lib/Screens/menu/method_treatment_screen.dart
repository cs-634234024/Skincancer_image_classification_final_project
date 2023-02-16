// ignore_for_file: unnecessary_const, prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:skincacer_project_final/constrance.dart';

class MethodTreatmentScreen extends StatefulWidget {
  const MethodTreatmentScreen({Key key}) : super(key: key);

  @override
  State<MethodTreatmentScreen> createState() => _MethodTreatmentScreenState();
}

class _MethodTreatmentScreenState extends State<MethodTreatmentScreen> {
  TextEditingController myController = TextEditingController();

  String newcontroller = ' ';

  TextStyle headerstyle = TextStyle(
      fontSize: 17,
      color: kheaderColor,
      fontFamily: 'Taitham3',
      fontWeight: FontWeight.bold);

  int indexbutton = 1;
  List<String> detectword = [];

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

  List<String> detectwordmanual = [
    'คู่มือ',
    'คุ่มือ',
    'การใช้',
    'แอปพลิเคชัน',
    'แอพ',
    'เเอปพลิเคชัน',
    'เเอพ',
    'ก',
    'm',
    'appication',
    'a'
  ];

  String i = '';

  void searchText() {
    newcontroller = myController.text;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 45.0),
          child: Text(
            'Method of Treatment',
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'วิธีการรักษา\t วินิจฉัย/การรักษาเเละป้องกัน',
                  style: TextStyle(
                    fontSize: 15,
                    color: kheaderColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Icons.health_and_safety_rounded,
                  color: kheaderColor,
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              indexbutton == 1
                  ? buttonNew(
                      title: 'วินิจฉัย',
                      changeIndexButton: changeButton,
                      index: 1,
                      changecolorbutton: kheaderColor,
                    )
                  : buttonNew(
                      title: 'วินิจฉัย',
                      changeIndexButton: changeButton,
                      index: 1,
                      changecolorbutton: kbuttonWidgetColor,
                    ),
              SizedBox(
                width: 5,
              ),
              indexbutton == 2
                  ? buttonNew(
                      title: 'การรักษา',
                      changeIndexButton: changeButton,
                      index: 2,
                      changecolorbutton: kheaderColor,
                    )
                  : buttonNew(
                      title: 'การรักษา',
                      changeIndexButton: changeButton,
                      index: 2,
                      changecolorbutton: kbuttonWidgetColor,
                    ),
              SizedBox(
                width: 5,
              ),
              indexbutton == 3
                  ? buttonNew(
                      title: 'การป้องกัน',
                      changeIndexButton: changeButton,
                      index: 3,
                      changecolorbutton: kheaderColor,
                    )
                  : buttonNew(
                      title: 'การป้องกัน',
                      changeIndexButton: changeButton,
                      index: 3,
                      changecolorbutton: kbuttonWidgetColor,
                    ),
            ],
          ),
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
                        topRight: Radius.circular(24),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      indexbutton == 1
                          ? TextOuput(
                              title: 'วินิจฉัย',
                              icon: FaIcon(
                                FontAwesomeIcons.stethoscope,
                                color: Colors.white,
                              ))
                          : indexbutton == 2
                              ? TextOuput(
                                  title: 'รักษา',
                                  icon: FaIcon(
                                    FontAwesomeIcons.heartbeat,
                                    color: Colors.white,
                                  ),
                                )
                              : TextOuput(
                                  title: 'ป้องกัน',
                                  icon: FaIcon(
                                    FontAwesomeIcons.shield,
                                    color: Colors.white,
                                  ),
                                ),
                      //
                      indexbutton == 1
                          ? Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Image.asset(
                                'assets/images/menu/maleSvgrepo.png',
                                scale: 1.5,
                              ),
                            )
                          : indexbutton == 2
                              ? Image.asset(
                                  'assets/images/menu/maledoctor.png',
                                  scale: 1.5,
                                )
                              : Image.asset(
                                  'assets/images/menu/defencecancer.png',
                                  scale: 1.5,
                                )
                    ],
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  SelectWidget(size)
                ],
              ),
            ],
          ),
        )
      ],
    ));
  }

  Widget SelectWidget(Size size) {
    newcontroller = myController.text;

    for (i in detectwordmanual) {
      if (i == newcontroller) {
        indexbutton = 2;
      }
    }

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
            color: kbuttonWidgetColor, borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontFamily: 'Taitham3',
                    fontWeight: FontWeight.bold),
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

class TextOuput extends StatelessWidget {
  final String title;
  final FaIcon icon;
  const TextOuput({
    Key key,
    this.title,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
        decoration: BoxDecoration(
            color: kheaderColor, borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            icon
          ],
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class buttonNew extends StatelessWidget {
  final String title;
  final Function changeIndexButton;
  final int index;
  final Color changecolorbutton;
  const buttonNew({
    Key key,
    this.title,
    this.changeIndexButton,
    this.index,
    this.changecolorbutton,
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
          color: changecolorbutton,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
