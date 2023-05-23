// ignore_for_file: unnecessary_const, prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:skincacer_project_final/constrance.dart';

import '../../widgets/new_button.dart';
import '../../widgets/output_detail.dart';
import '../../widgets/output_header.dart';
import '../../widgets/text_output.dart';

class PredictionGreen extends StatefulWidget {
  const PredictionGreen({Key key}) : super(key: key);

  @override
  State<PredictionGreen> createState() => _PredictionGreenState();
}

class _PredictionGreenState extends State<PredictionGreen> {
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

    return Scaffold(
      appBar: AppBar(
        title: Text('Skin Cancer Classification',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
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
          OutputHeader(
            title: 'มะเร็งผิวหนัง ? \t อาการ/ปัจจัยเสี่ยง',
            icon: FaIcon(
              FontAwesomeIcons.virus,
              color: kheaderColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                indexbutton == 1
                    ? NewButton(
                        title: 'มะเร็งผิวหนัง',
                        changeIndexButton: changeButton,
                        index: 1,
                        changecolorbutton: kheaderColor,
                      )
                    : NewButton(
                        title: 'มะเร็งผิวหนัง',
                        changeIndexButton: changeButton,
                        index: 1,
                        changecolorbutton: kbuttonWidgetColor,
                      ),
                SizedBox(
                  width: 5,
                ),
                indexbutton == 2
                    ? NewButton(
                        title: 'ปัจจัยเสี่ยง',
                        changeIndexButton: changeButton,
                        index: 2,
                        changecolorbutton: kheaderColor,
                      )
                    : NewButton(
                        title: 'ปัจจัยเสี่ยง',
                        changeIndexButton: changeButton,
                        index: 2,
                        changecolorbutton: kbuttonWidgetColor,
                      ),
                SizedBox(
                  width: 5,
                ),
                indexbutton == 3
                    ? NewButton(
                        title: 'อาการ',
                        changeIndexButton: changeButton,
                        index: 3,
                        changecolorbutton: kheaderColor,
                      )
                    : NewButton(
                        title: 'อาการ',
                        changeIndexButton: changeButton,
                        index: 3,
                        changecolorbutton: kbuttonWidgetColor,
                      ),
              ],
            ),
          ),
          SizedBox(
            height: indexbutton == 1
                ? size.height - 10
                : indexbutton == 2
                    ? size.height - 40
                    : size.height - 200,
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
                            ? TextOutput(
                                title: 'มะเร็งผิว',
                                icon: FaIcon(
                                  FontAwesomeIcons.viruses,
                                  color: Colors.white,
                                ))
                            : indexbutton == 2
                                ? TextOutput(
                                    title: 'ความเสี่ยง',
                                    icon: FaIcon(
                                      FontAwesomeIcons.headSideCough,
                                      color: Colors.white,
                                    ),
                                  )
                                : TextOutput(
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
      )),
      backgroundColor: kbackgroundColor,
    );
  }
}
