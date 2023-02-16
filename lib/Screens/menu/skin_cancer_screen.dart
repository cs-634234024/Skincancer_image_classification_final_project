// ignore_for_file: unnecessary_const, prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:skincacer_project_final/constrance.dart';

class SkinCancerScreen extends StatefulWidget {
  const SkinCancerScreen({Key key}) : super(key: key);

  @override
  State<SkinCancerScreen> createState() => _SkinCancerScreenState();
}

class _SkinCancerScreenState extends State<SkinCancerScreen> {
  TextStyle headerstyle = TextStyle(
      fontSize: 17,
      color: kheaderColor,
      fontFamily: 'Taitham3',
      fontWeight: FontWeight.bold);

  int indexbutton = 1;

  void changeButton(int index) {
    setState(() {
      indexbutton = index;
      print(indexbutton);
    });
  }

  List<String> detail = [
    '\t\t\t\t\t\tมะเร็งผิวหนัง คือ เนื้อร้ายที่เกิดบนผิวหนังและเยื่อบุ เนื่องจากความผิดปกติของการเจริญเติบโต และการแบ่งเซลล์ของผิวหนังและเยื่อบุ มะเร็งผิวหนังมีหลายชนิด ที่พบบ่อย ได้แก่\n 1. มะเร็งผิวหนังชนิดบาซอล เซลล์ (Basal Cell Carcinoma) มะเร็งผิวหนังที่มีความร้ายแรงน้อย เพราะเกิดบริเวณชั้นตื้น ๆ \n 2. มะเร็งผิวหนังชนิดสเควมัสเซลล์ (Squamous Cell Carcinoma) ลักษณะคล้ายกับมะเร็งบาซอล เซลล์ คาร์ซิโนมา การลุกลามมักเร็วกว่ามะเร็งชนิด บาซอลเซลล์ คาร์ซิโนมามักจะลุกลามลงลึกสู่ด้านล่างของเซลล์ผิวหนัง ถ้าคลำดูผิวหนังด้านล่างมักจะพบว่าเป็นก้อนแข็ง ๆ \n 3. มะเร็งผิวหนังชนิดเมลาโนมา (Malignant Melanoma) เป็นมะเร็งจากเซลล์เม็ดสีเมลานิน พบไม่บ่อย แต่มีความร้ายแรง เพราะสามารถกระจายเข้าสู่กระแสเลือดได้รวดเร็ว',
    '\t\t\t\t\t\tปัจจัยเสี่ยง \n 1. แสงอัลตราไวโอเลต (UVA, UVB) ดังนั้นผู้ที่ต้องทำงานกลางแดด เล่นกีฬากลางแจ้ง ชอบอาบแดด จะมีความเสี่ยงสูงต่อการเกิดมะเร็งผิวหนัง \n 2. เชื้อชาติ คนผิวขาว ผมสีบลอนด์ มีโอกาสเสี่ยงสูง เพราะมีเม็ดสีที่ผิวหนังน้อย ความสามารถในการป้องกันเซลล์ผิวหนังจากแสงอัลตราไวโอเลตจึงน้อยกว่าคนผิวคล้ำ\n\n 3. มีประวัติคนในครอบครัวเป็นมะเร็งผิวหนัง \n\n 4. ภาวะภูมิคุ้มกันบกพร่อง เช่น HIV หรือได้รับยากดภูมิต้านทาน \n\n 5. ผิวหนังในบริเวณที่เคยได้รังสีรักษา',
    '\t\t\t\t\t\tอาการ \n 1.ดูบริเวณไฝที่เป็นว่ามีผื่นหรือก้อนที่โตเร็วกว่าปกติ หรือมีสีที่เปลี่ยนไป ขอบไม่เรียบ แตกเป็นแผล และมีเลือดออก \n 2. มีแผลเรื้อรังที่ไม่หาย \n 3. ผื่นเรื้อรัง'
  ];

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
            'What is skin cancer?',
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
                  'มะเร็งผิวหนัง ? \t อาการ/ปัจจัยเสี่ยง',
                  style: TextStyle(
                    fontSize: 15,
                    color: kheaderColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                FaIcon(
                  FontAwesomeIcons.virus,
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
                      title: 'มะเร็งผิวหนัง',
                      changeIndexButton: changeButton,
                      index: 1,
                      changecolorbutton: kheaderColor,
                    )
                  : buttonNew(
                      title: 'มะเร็งผิวหนัง',
                      changeIndexButton: changeButton,
                      index: 1,
                      changecolorbutton: kbuttonWidgetColor,
                    ),
              SizedBox(
                width: 5,
              ),
              indexbutton == 2
                  ? buttonNew(
                      title: 'ปัจจัยเสี่ยง',
                      changeIndexButton: changeButton,
                      index: 2,
                      changecolorbutton: kheaderColor,
                    )
                  : buttonNew(
                      title: 'ปัจจัยเสี่ยง',
                      changeIndexButton: changeButton,
                      index: 2,
                      changecolorbutton: kbuttonWidgetColor,
                    ),
              SizedBox(
                width: 5,
              ),
              indexbutton == 3
                  ? buttonNew(
                      title: 'อาการ',
                      changeIndexButton: changeButton,
                      index: 3,
                      changecolorbutton: kheaderColor,
                    )
                  : buttonNew(
                      title: 'อาการ',
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
                              title: 'มะเร็งผิว',
                              icon: FaIcon(
                                FontAwesomeIcons.viruses,
                                color: Colors.white,
                              ))
                          : indexbutton == 2
                              ? TextOuput(
                                  title: 'ความเสี่ยง',
                                  icon: FaIcon(
                                    FontAwesomeIcons.headSideCough,
                                    color: Colors.white,
                                  ),
                                )
                              : TextOuput(
                                  title: 'อาการ',
                                  icon: FaIcon(
                                    FontAwesomeIcons.headSideVirus,
                                    color: Colors.white,
                                  ),
                                ),
                      indexbutton == 1
                          ? Image.asset(
                              'assets/images/menu/virus.png',
                              scale: 1.75,
                            )
                          : indexbutton == 2
                              ? Image.asset(
                                  'assets/images/menu/defencecancer.png',
                                  scale: 1.75,
                                )
                              : Image.asset(
                                  'assets/images/menu/manarm.png',
                                  scale: 1.75,
                                )
                    ],
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
    ));
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
            color: kbuttonWidgetColor, borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontFamily: 'Taitham3',
                    fontWeight: FontWeight.bold),
              ),
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
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Taitham3'),
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
