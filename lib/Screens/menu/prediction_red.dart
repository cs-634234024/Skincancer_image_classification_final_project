// ignore_for_file: unnecessary_const, prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable, non_constant_identifier_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:skincacer_project_final/constrance.dart';
import 'package:skincacer_project_final/widgets/output_detail.dart';

import '../../widgets/build_card_image.dart';
import '../../widgets/new_button.dart';
import '../../widgets/output_header.dart';
import '../../widgets/text_output.dart';

class PredictionRed extends StatefulWidget {
  const PredictionRed({Key key}) : super(key: key);

  @override
  State<PredictionRed> createState() => _PredictionRedState();
}

class _PredictionRedState extends State<PredictionRed> {
  int indexbutton = 2;

  List<String> imageslist = [
    'assets/images/manual/choice1.png',
    'assets/images/manual/choice2.png',
    'assets/images/manual/choice3.png'
  ];

  List<String> detail = [
    '\t\t\tเป็นการผ่าตัดแบบมาตรฐานโดยจะทำการผ่าตัดก้อนเนื้อมะเร็งที่อยู่บริเวณผิวหนังและเนื้อเยื่อโดยรอบออก หากบริเวณที่ผ่าตัดออกมีขนาดใหญ่ อาจนำผิวหนังจากส่วนอื่นมาปิดบริเวณแผลเพื่อทำให้แผลหายเร็วขึ้น และจะทำให้รอยแผลเป็นน้อยลงได้',
    '\t\t\tเป็นการใช้รังสีเพื่อกำจัดเซลล์มะเร็ง โดยวิธีนี้จะใช้รักษามะเร็งผิวหนังในกรณีที่ขนาดของมะเร็งมีขนาดใหญ่ ไม่สามารถผ่าตัดออกหมด หรืออยู่ในบริเวณที่ไม่สามารถผ่าตัดได้ บางครั้งก็ใช้กับผู้ป่วยเพื่อป้องกันไม่ให้กลับมาเป็นซ้ำ',
    '\t\t\tแพทย์อาจใช้เคมีบำบัดรักษาผู้ป่วยมะเร็งผิวหนังที่ไม่ใช่เมลาโนมาก็ต่อเมื่อพบเนื้อร้ายที่บริเวณผิวหนังชั้นบน โดยมีวิธีการ คือ ใช้ยาทาที่มีส่วนผสมของยาเคมีบำบัดทาบริเวณที่เป็นมะเร็ง หรืออาจให้ยาเคมีบำบัดทางหลอดเลือด เพื่อรักษามะเร็งผิวหนังที่มีการแพร่กระจายไปยังอวัยวะอื่น ๆ'
  ];

  void changeButton(int index) {
    setState(() {
      indexbutton = index;
      print(indexbutton);
    });
  }

  List<String> images = [
    'assets/images/malignant/1.jpg',
    'assets/images/malignant/2.jpg',
    'assets/images/malignant/3.jpg',
    'assets/images/malignant/4.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Skin Cancer Classification',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        backgroundColor: kheaderColor,
      ),
      body: ListView(children: [
        Column(
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
                      ? NewButton(
                          changeIndexButton: changeButton,
                          index: 1,
                          title: 'การรักษา',
                          changecolorbutton: kheaderColor,
                        )
                      : NewButton(
                          changeIndexButton: changeButton,
                          index: 1,
                          title: 'การรักษา',
                          changecolorbutton: kbuttonWidgetColor,
                        ),
                  indexbutton == 2
                      ? NewButton(
                          changeIndexButton: changeButton,
                          index: 2,
                          title: 'หมายเหตุ',
                          changecolorbutton: kheaderColor,
                        )
                      : NewButton(
                          changeIndexButton: changeButton,
                          index: 2,
                          title: 'หมายเหตุ',
                          changecolorbutton: kbuttonWidgetColor,
                        ),
                ],
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                indexbutton == 1
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 16.0, top: 15),
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: kbuttonWidgetColor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 10),
                                      child: Text(
                                        'ลักษณะของ ใฝที่เป็นโรคมะเร็ง',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )),
                              ),
                              SizedBox(
                                  height: 250,
                                  child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        BuildCardImage(
                                          imageList: images[0],
                                        ),
                                        BuildCardImage(
                                          imageList: images[1],
                                        ),
                                        BuildCardImage(imageList: images[2]),
                                        BuildCardImage(imageList: images[3])
                                      ])),
                            ],
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
            SizedBox(
              height: indexbutton == 1 ? size.height + 460 : size.height - 220,
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.05),
                    height: size.height + 450,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 7,
                              blurRadius: 5,
                              offset: Offset(0, 3))
                        ],
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
                              ? TextOutput(
                                  title: 'การรักษา ',
                                  icon: FaIcon(
                                    FontAwesomeIcons.heartbeat,
                                    color: Colors.white,
                                  ))
                              : indexbutton == 2
                                  ? TextOutput(
                                      title: 'หมายเหตุ',
                                      icon: FaIcon(
                                        FontAwesomeIcons.book,
                                        color: Colors.white,
                                      ),
                                    )
                                  : TextOutput(
                                      title: 'หมายเหตุ',
                                      icon: FaIcon(
                                        FontAwesomeIcons.book,
                                        color: Colors.white,
                                      ),
                                    ),
                          indexbutton == 1
                              ? Image.asset(
                                  'assets/images/menu/doctor.png',
                                  scale: 1.75,
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(
                                      right: 8.0, top: 10),
                                  child: Image.asset(
                                    'assets/images/menu/doctor2.png',
                                    scale: 1.95,
                                  ),
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
                              detail: detail[0],
                            )
                          : Container(),
                      indexbutton == 1
                          ? WidgetTreatment(
                              size: size,
                              title: 'ทางเลือกที่ 2 : การฉายรังสี',
                              images: imageslist[0],
                              detail: detail[1])
                          : Container(),
                      indexbutton == 1
                          ? WidgetTreatment(
                              size: size,
                              title: 'ทางเลือกที่ 3 : เคมีบำบัด',
                              images: imageslist[2],
                              detail: detail[2])
                          : Container(),
                      indexbutton == 2
                          ? Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: kbottomColor),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop"),
                                ),
                              ),
                            )
                          : Container()
                    ],
                  ),
                ],
              ),
            )
          ],
        )
      ]),
      backgroundColor: kbackgroundColor,
    );
  }
}

class WidgetTreatment extends StatelessWidget {
  final String title;
  final String images;
  final String detail;
  const WidgetTreatment({
    Key key,
    @required this.size,
    this.title,
    this.images,
    this.detail,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: size.width,
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
                  height: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      images,
                      scale: 2.5,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Container(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              detail,
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 14),
                            ),
                          ),
                        ),
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
