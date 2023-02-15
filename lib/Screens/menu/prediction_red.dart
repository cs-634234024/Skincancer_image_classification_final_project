// ignore_for_file: unnecessary_const, prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:skincacer_project_final/constrance.dart';

class PredictionRed extends StatefulWidget {
  const PredictionRed({Key key}) : super(key: key);

  @override
  State<PredictionRed> createState() => _PredictionRedState();
}

class _PredictionRedState extends State<PredictionRed> {
  TextStyle headerstyle = TextStyle(
      fontSize: 17,
      color: kheaderColor,
      fontFamily: 'Taitham3',
      fontWeight: FontWeight.bold);

  int indexbutton = 0;

  List<String> imageslist = [
    'assets/images/manual/choice1.png',
    'assets/images/manual/choice2.png',
    'assets/images/manual/choice3.png'
  ];
  void changeButton(int index) {
    setState(() {
      indexbutton = index;
      print(indexbutton);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kheaderColor,
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 45.0),
            child: Text(
              'คำเเนะนำหากคุณเป็นมะเร็งผิวหนัง ?',
              style: TextStyle(
                fontSize: 20,
                color: kheaderColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          indexbutton == 1
              ? OutputHeader(
                  title: 'ขั้นตอนการรักษาหากคุณเป็นมะเร็งผิวหนัง',
                  icon: FaIcon(
                    FontAwesomeIcons.virus,
                    color: kheaderColor,
                  ),
                )
              : OutputHeader(
                  title: 'หมายเหตุสำหรับการทำนายผลของมะเร็ง',
                  icon: FaIcon(
                    FontAwesomeIcons.virus,
                    color: kheaderColor,
                  ),
                ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                indexbutton == 1
                    ? buttonNew(
                        changeIndexButton: changeButton,
                        index: 1,
                        title: 'การรักษา',
                        changecolorbutton: kheaderColor,
                      )
                    : buttonNew(
                        changeIndexButton: changeButton,
                        index: 1,
                        title: 'การรักษา',
                        changecolorbutton: kbuttonWidgetColor,
                      ),
                indexbutton == 2
                    ? buttonNew(
                        changeIndexButton: changeButton,
                        index: 2,
                        title: 'หมายเหตุ',
                        changecolorbutton: kheaderColor,
                      )
                    : buttonNew(
                        changeIndexButton: changeButton,
                        index: 2,
                        title: 'หมายเหตุ',
                        changecolorbutton: kbuttonWidgetColor,
                      )
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
                                title: 'การรักษา ',
                                icon: FaIcon(
                                  FontAwesomeIcons.heartbeat,
                                  color: Colors.white,
                                ))
                            : indexbutton == 2
                                ? TextOuput(
                                    title: 'หมายเหตุ',
                                    icon: FaIcon(
                                      FontAwesomeIcons.book,
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
                        Image.asset(
                          'assets/images/menu/doctor.png',
                          scale: 1.75,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    indexbutton == 1
                        ? WidgetTreatment(
                            size: size,
                            title: 'ทางเลือกที่ 1 : การผ่าตัด',
                            images: imageslist[1],
                          )
                        : skinCancer(size, 'test'),
                    indexbutton == 1
                        ? WidgetTreatment(
                            size: size,
                            title: 'ทางเลือกที่ 2 : การฉายรังสี',
                            images: imageslist[0])
                        : Container(),
                    indexbutton == 1
                        ? WidgetTreatment(
                            size: size,
                            title: 'ทางเลือกที่ 3 : เคมีบำบัด',
                            images: imageslist[2])
                        : Container(),
                  ],
                ),
              ],
            ),
          )
        ],
      )),
      backgroundColor: kbackgroundColor,
    );
  }

  Padding skinCancer(Size size, String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: size.width,
        decoration: BoxDecoration(
            color: kbottomColor, borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                '\tเเอปพลิเคชันนี้ได้จัดทำจากการนำรูปของชาวต่างชาติมาใช้ในการเทรน Ai ให้สามารถ จำเเนกรูปภาพไฝที่มีความเสี่ยงต่อการเป็นโรคมะเร็งผิวหนังเเละเนื่องด้วย สีผิวหรือลักษณะของผิวอาจจะมีความเเตกต่างกับคนไทย จึ่งทำให้ประสิทธิภาพในการจำเเนกภาพลดลงเเละด้วยเหตุนี้ หากเเอปพลิเคชันทำการจำเเนกภาพของคุณอยู่ในกลุ่มเสี่ยง ',
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontFamily: 'Taitham3',
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WidgetTreatment extends StatelessWidget {
  final String title;
  final String images;
  const WidgetTreatment({
    Key key,
    @required this.size,
    this.title,
    this.images,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: size.width,
          height: 150,
          decoration: BoxDecoration(
              color: kbottomColor, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.only(left: 18.0, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 7,
                ),
                Row(
                  children: [
                    Image.asset(
                      images,
                      scale: 2,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Text(
                        'เป็นการผ่าตัดแบบมาตรฐาน\nโดยจะทำการผ่าตัดก้อนเนื้อ\nมะเร็งที่อยู่บริเวณผิวหนัง\nและเนื้อเยื่อโดยรอบออก',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OutputHeader extends StatelessWidget {
  final String title;
  final FaIcon icon;
  const OutputHeader({
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
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 15,
                color: kheaderColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            icon
          ],
        ),
      ),
    );
  }
}

class buttonNew extends StatelessWidget {
  final String title;
  final Function changeIndexButton;
  final Color changecolorbutton;
  final int index;
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
            color: kbuttonWidgetColor, borderRadius: BorderRadius.circular(20)),
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
