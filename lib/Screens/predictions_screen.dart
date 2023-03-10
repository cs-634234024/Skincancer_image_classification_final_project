// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skincacer_project_final/Screens/menu/prediction_green.dart';
import 'package:skincacer_project_final/Screens/menu/prediction_red.dart';
import 'package:skincacer_project_final/constrance.dart';
import 'package:tflite/tflite.dart';

class PredictionsScreen extends StatefulWidget {
  const PredictionsScreen({
    Key key,
  }) : super(key: key);

  @override
  State<PredictionsScreen> createState() => _PredictionsScreenState();
}

class _PredictionsScreenState extends State<PredictionsScreen> {
  bool _loading = true;
  File _image;
  List _output;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    loadModel().then((value) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    //dis function disposes and clears our memory
    super.dispose();
    Tflite.close();
  }

  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 2,
      threshold: 0.2,
      imageMean: 0,
      imageStd: 255,
    );
    setState(() {
      _output = output;
      _loading = false;
    });
  }

  loadModel() async {
    //this function loads our model
    await Tflite.loadModel(
      model: 'assets/model_final.tflite',
      labels: 'assets/labels_final.txt',
    );
  }

  pickImage() async {
    //this function to grab the image from camera
    var image = await picker.pickImage(source: ImageSource.camera);
    if (image == null) return null;

    setState(() {
      _image = File(image.path);
    });
    classifyImage(_image);
  }

  pickGalleryImage() async {
    //this function to grab the image from gallery
    var image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return null;

    setState(() {
      _image = File(image.path);
    });
    classifyImage(_image);
  }

  List<String> iconSvg = [
    'assets/logo/svg/camera.svg',
    'assets/logo/svg/image.svg'
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(children: [
      Stack(
        children: <Widget>[
          Container(
            height: size.height * 0.35,
            decoration: BoxDecoration(
                color: kheaderColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
          ),
          Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text('Scan Skin',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),
            Text(
              'Skin Cancer Imageclassifications',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
            Center(
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      width: size.width,
                      height: 580,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 15,
                          ),
                          Center(
                            child: _loading == true
                                ? boxLogoImages()
                                : boxResultImages(image: _image),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          _output != null && _output[0]['label'] == 'malignent'
                              ? Predict_result(
                                  color: Colors.red,
                                  index: 1,
                                  reslut: '??????????????????????????????????????????????????????????????????????????????????????????????????????',
                                )
                              : _output != null &&
                                      _output[0]['label'] == 'benign'
                                  ? Predict_result(
                                      color: Colors.green,
                                      index: 2,
                                      reslut:
                                          '???????????????????????????????????????????????????????????????????????????????????????????????????????????????',
                                    )
                                  : Column(
                                      children: [
                                        Text(
                                          '??????????????????????????????????????????',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Taitham3'),
                                        ),
                                        Text(
                                            '???????????????????????? ???????????????????????????????????????????????????????????????????????????????????? 75 ???????????????????????????'),
                                        Text(
                                            '??????????????????????????????????????????????????????????????????????????????????????????????????????')
                                      ],
                                    ),
                          SizedBox(
                            height: 20,
                          ),
                          customButton("Take a Photo", iconSvg[0], pickImage),
                          SizedBox(
                            height: 10,
                          ),
                          customButton(
                              "Camera Roll", iconSvg[1], pickGalleryImage),
                        ],
                      ),
                    )))
          ])
        ],
      ),
    ]);
  }

  Widget customButton(
    String title,
    String icon,
    VoidCallback onclick,
  ) {
    return Column(
      children: [
        GestureDetector(
          onTap: onclick,
          child: Container(
            width: MediaQuery.of(context).size.width - 200,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 17),
            decoration: BoxDecoration(
              color: kbuttonWidgetColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                SvgPicture.asset(icon),
                SizedBox(
                  width: 13,
                ),
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Predict_result extends StatelessWidget {
  final String reslut;
  final Color color;
  final int index;

  const Predict_result({
    Key key,
    this.reslut,
    this.color,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '??????????????????????????????',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Taitham3',
          ),
        ),
        SizedBox(
          height: 5,
        ),
        GestureDetector(
          onTap: () {
            if (index == 1) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PredictionRed(),
                  ));
            } else {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PredictionGreen(),
                  ));
            }
          },
          child: Container(
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  index == 1
                      ? Column(
                          children: [
                            Text(reslut,
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                    fontFamily: 'Taitham3')),
                          ],
                        )
                      : Text(reslut,
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontFamily: 'Taitham3')),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 5),
                      child: Text('??????????????????????????????????????????????????????????????????',
                          style: TextStyle(color: Colors.black)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class boxResultImages extends StatelessWidget {
  const boxResultImages({
    Key key,
    @required File image,
  })  : _image = image,
        super(key: key);

  final File _image;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
              height: MediaQuery.of(context).size.width * 0.6,
              width: MediaQuery.of(context).size.width * 0.6,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.file(
                  _image,
                  fit: BoxFit.fill,
                ),
              )),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

class boxLogoImages extends StatelessWidget {
  const boxLogoImages({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.width * 0.6,
        width: MediaQuery.of(context).size.width * 0.6,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset('assets/images/menu/maledoctor.png')));
  }
}
