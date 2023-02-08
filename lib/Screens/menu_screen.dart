import 'package:flutter/material.dart';

import 'menu/manual_screen.dart';
import 'menu/method_treatment_screen.dart';
import 'menu/predic_screen_two.dart';
import 'menu/skin_cancer_screen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  List<String> detail = [
    'คู่มือการใช้เเอปพลิเคชัน',
    'วิธีการรักษามะเร็งผิวหนัง',
    'ทำนายความเสี่ยงของคุณ',
    'ลักษณะโรคมะเร็งผิวหนัง'
  ];

  List<String> imageicon = [
    'assets/images/menu/information.png',
    'assets/images/menu/recruitment.png',
    'assets/images/menu/championship.png',
    'assets/images/menu/invite.png'
  ];

  int index = 0;
  TextEditingController myController = TextEditingController();

  String newController = ' ';
  int indexcut = 0;

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
    'appication'
  ];

  List<String> detectwordheal = [
    'รักษา',
    'การรักษา',
    'วิธีรักษา',
    'วิธีรักษามะเร็ง',
    'วิธีรักษามะเร็งผิวหนัง',
    'รักษามะเร็งผิวหนัง',
    'น'
  ];

  List<String> detectwordskin = [
    'มะเร็ง',
    'มะเร็งผิวหนัง',
    'มะเร็งผิวหนังคือ',
    'โรคมะเร็ง',
    'โรคมะเร็งคือ',
    'โรคมะเร็งผิวหนังคือ',
    'ป'
  ];

  List<String> detectwordprediction = [
    'ตรวจสอบ',
    'ตรวจสอบผิวหนัง',
    'ผิวหนัง',
    'ทำนาย',
    'ทำนายความเสี่ยง',
    'เสี่ยง',
    'ความเสี่ยง',
    'ตรวจ',
    'ข'
  ];

  test(int newindex) {
    index = newindex;
    print(index);
    if (index == 1) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ManualScreen(),
          ));
    } else if (index == 2) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MethodTreatmentScreen(),
          ));
    } else if (index == 4) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SkinCancerScreen()));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => PredicScreenTwo()));
    }
  }

  void detectWordForSearch() {
    newController = myController.text;
    for (String i in detectwordmanual) {
      if (newController == i) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => SkinCancerScreen()));
      }
    }
    for (String i in detectwordheal) {
      if (newController == i) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => MethodTreatmentScreen()));
      }
    }
    for (String i in detectwordskin) {
      if (newController == i) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => SkinCancerScreen()));
      }
    }
    for (String i in detectwordprediction) {
      if (newController == i) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => PredicScreenTwo()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Container(
          height: size.height * 0.35,
          decoration: BoxDecoration(
              color: Colors.indigo,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text('Scan Skin',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo.shade100)),
            ),
            Text(
              'Skin Cancer Imageclassifications',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: TextFormField(
                  autofocus: false,
                  controller: myController,
                  decoration: InputDecoration(
                      hintText: 'Seaarch',
                      suffixIcon: IconButton(
                          onPressed: () {
                            detectWordForSearch();
                          },
                          icon: Icon(
                            Icons.search,
                            size: 30,
                          ))),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 0.8,
                  children: <Widget>[
                    MenuCard(
                      imageicon: imageicon[1],
                      changeindex: test,
                      index: 1,
                      title: 'คู่มือ',
                      detail: detail[0],
                    ),
                    MenuCard(
                      imageicon: imageicon[3],
                      changeindex: test,
                      index: 2,
                      title: 'วิธีการรักษา',
                      detail: detail[1],
                    ),
                    MenuCard(
                      imageicon: imageicon[2],
                      changeindex: test,
                      index: 3,
                      title: 'ตรวจสอบผิวหนัง',
                      detail: detail[2],
                    ),
                    MenuCard(
                      imageicon: imageicon[0],
                      changeindex: test,
                      index: 4,
                      title: 'มะเร็งผิวหนังคือ ?',
                      detail: detail[3],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}

class MenuCard extends StatelessWidget {
  final String imageicon;
  final int index;
  final String title;
  final Function changeindex;
  final String detail;
  const MenuCard({
    Key key,
    this.imageicon,
    this.changeindex,
    this.index,
    this.title,
    this.detail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => changeindex(index),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.indigo.shade50,
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: <Widget>[
            Image.asset(
              imageicon,
              scale: 2,
            ),
            Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  fontFamily: 'Taitham3'),
            ),
            Text(
              detail,
              style: TextStyle(fontFamily: 'Taitham3'),
            )
          ],
        ),
      ),
    );
  }
}
