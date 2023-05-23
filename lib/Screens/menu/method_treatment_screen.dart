// ignore_for_file: unnecessary_const, prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:skincacer_project_final/constrance.dart';

import '../../widgets/new_button.dart';
import '../../widgets/output_detail.dart';
import '../../widgets/output_header.dart';
import '../../widgets/text_output.dart';

class MethodTreatmentScreen extends StatefulWidget {
  const MethodTreatmentScreen({Key key}) : super(key: key);

  @override
  State<MethodTreatmentScreen> createState() => _MethodTreatmentScreenState();
}

class _MethodTreatmentScreenState extends State<MethodTreatmentScreen> {
  int indexbutton = 1;

  void changeButton(int index) {
    setState(() {
      indexbutton = index;
    });
  }

  List<String> detail = [
    '\t\t\t\t\t\tการตรวจวินิจฉัย\n\n การรักษามะเร็งผิวหนังที่ดีที่สุดคือ การค้นพบตั้งแต่แรกเริ่ม โดยต้องสำรวจร่างกายตัวเองให้ทั่ว ซึ่งต้องใช้กระจกและมือช่วย ถ้ามีข้อสงสัยให้ปรึกษาแพทย์ผิวหนังเพื่อการวินิจฉัย ซึ่งทำได้โดยการตัดชิ้นเนื้อบริเวณที่สงสัยส่งตรวจทางพยาธิวิทยา',
    '\t\t\t\t\t\tการบำบัดรักษา \n\n มะเร็งผิวหนังระยะเริ่มต้นใช้วิธีการผ่าตัดก็สามารถหายขาดได้ แต่หากเป็นมะเร็งระยะกระจายหรือมะเร็งผิวหนังเมลาโนมา หลังผ่าตัดอาจต้องมีการใช้การฉายแสงหรือเคมีบำบัดร่วมได้',
    '\t\t\t\t\t\tการป้องกัน\n\n 1.หลีกเลี่ยงแสงแดด ใช้ครีมกันแดด SPF > 15\n\n 2. หลีกเลี่ยงภาวะระคายเคืองผิวหนัง'
  ];

  Widget SelectWidget(Size size) {
    if (indexbutton == 1) {
      return OutputDetail(size: size, title: detail[0]);
    } else if (indexbutton == 2) {
      return OutputDetail(size: size, title: detail[1]);
    } else {
      return OutputDetail(size: size, title: detail[2]);
    }
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
        OutputHeader(
          title: 'วิธีการรักษา\t วินิจฉัย/รักษาเเละป้องกัน',
          icon: FaIcon(
            FontAwesomeIcons.heartCircleCheck,
            color: kheaderColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              indexbutton == 1
                  ? NewButton(
                      title: 'วินิจฉัย',
                      changeIndexButton: changeButton,
                      index: 1,
                      changecolorbutton: kheaderColor,
                    )
                  : NewButton(
                      title: 'วินิจฉัย',
                      changeIndexButton: changeButton,
                      index: 1,
                      changecolorbutton: kbuttonWidgetColor,
                    ),
              SizedBox(
                width: 5,
              ),
              indexbutton == 2
                  ? NewButton(
                      title: 'การรักษา',
                      changeIndexButton: changeButton,
                      index: 2,
                      changecolorbutton: kheaderColor,
                    )
                  : NewButton(
                      title: 'การรักษา',
                      changeIndexButton: changeButton,
                      index: 2,
                      changecolorbutton: kbuttonWidgetColor,
                    ),
              SizedBox(
                width: 5,
              ),
              indexbutton == 3
                  ? NewButton(
                      title: 'การป้องกัน',
                      changeIndexButton: changeButton,
                      index: 3,
                      changecolorbutton: kheaderColor,
                    )
                  : NewButton(
                      title: 'การป้องกัน',
                      changeIndexButton: changeButton,
                      index: 3,
                      changecolorbutton: kbuttonWidgetColor,
                    ),
            ],
          ),
        ),
        SizedBox(
          height: indexbutton == 1
              ? size.height - 250
              : indexbutton == 2
                  ? size.height - 260
                  : size.height - 260,
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: size.height * 0.05),
                height: size.height,
                decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
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
                          // widgets text_output.dart
                          ? TextOutput(
                              title: 'วินิจฉัย',
                              icon: FaIcon(
                                FontAwesomeIcons.stethoscope,
                                color: Colors.white,
                              ))
                          : indexbutton == 2
                              ? TextOutput(
                                  title: 'รักษา',
                                  icon: FaIcon(
                                    FontAwesomeIcons.heartbeat,
                                    color: Colors.white,
                                  ),
                                )
                              : TextOutput(
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
}
