// ignore_for_file: unnecessary_const, prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';

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

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
        ),
        backgroundColor: Colors.indigo,
        body: ListView(children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Text(
                'Manual',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
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
                        TextSpan(
                          text: 'คู่มือในการใช้เเอปพลิเคชัน',
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ])),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              width: size.width,
              height: 1820,
              decoration: BoxDecoration(
                  color: Colors.indigo.shade50,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.indigo,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'Manual / คู่มือการใช้เเอปพลิเคชัน',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Taitham3"),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: size.width,
                      height: 1700,
                      decoration: BoxDecoration(
                          color: Colors.indigo.shade100,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0, top: 25),
                            child: Text(
                              'วิธีตรวจสอบผิวหนังของคุณ',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: "Taitham3",
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20.0, top: 25),
                                child: Image.asset(
                                  "assets/images/manual/menu_predict.PNG",
                                  scale: 1.5,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10.0, top: 25),
                                child: Text(
                                  'เลือก Menu "ตรวจสอบผิวหนัง" \nเพื่อไปยังหน้า ตรวจสอบผิวหนัง ',
                                  style: headerstyle,
                                ),
                              )
                            ],
                          ),
                          Divider(
                            height: 50,
                            thickness: 10,
                            color: Colors.indigo.shade50,
                          ),
                          Center(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, top: 25),
                                  child: Text(
                                    'หรือเลือกเเถบเมนูด้านล่าง รูปหัวใจ \nเพื่อไปยังหน้า ตรวจสอบผิวหนัง',
                                    style: headerstyle,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, top: 10),
                                  child: Image.asset(
                                    "assets/images/manual/menu_predict2.PNG",
                                    scale: 1.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 50,
                            thickness: 10,
                            color: Colors.indigo.shade50,
                          ),
                          Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, top: 25),
                                  child: Image.asset(
                                    "assets/images/manual/predict_screen.PNG",
                                    scale: 2,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, top: 25),
                                  child: Text(
                                    '                        เลือก Menu\n Take a Photo เพื่อถ่ายรูปไฝของคุณ \nCamera Roll เพื่อเลือกรูปจากเเกลลอรี่ ',
                                    style: headerstyle,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Divider(
                            height: 50,
                            thickness: 10,
                            color: Colors.indigo.shade50,
                          ),
                          Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, top: 25),
                                  child: Image.asset(
                                    "assets/images/manual/safe_predict.PNG",
                                    scale: 2,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, top: 25),
                                  child: Image.asset(
                                    "assets/images/manual/danger_predict.PNG",
                                    scale: 2,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, top: 25),
                                  child: Text(
                                    'ผลลัพของการทำนายผล',
                                    style: headerstyle,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ])
        ]));
  }
}
