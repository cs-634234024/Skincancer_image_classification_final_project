// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables, void_checks

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skincacer_project_final/Screens/menu/prediction_green.dart';
import 'package:skincacer_project_final/Screens/menu/prediction_red.dart';
import 'package:skincacer_project_final/Screens/menu/skin_cancer_screen.dart';
import 'package:skincacer_project_final/constrance.dart';
import 'package:skincacer_project_final/widgets/show_image.dart';
import 'package:tflite/tflite.dart';

import '../widgets/custom_button.dart';
import '../widgets/predict_result.dart';
import '../widgets/show_logo.dart';

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
      threshold: 0.5,
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
                                ? BoxLogoImages()
                                : ShowImage(image: _image),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          _output != null && _output[0]['label'] == 'malignent'
                              ? PredictResult(
                                  color: Colors.red,
                                  index: 1,
                                  result: 'พบความเสี่ยงในการเป็นมะเร็งผิวหนัง',
                                  value: _output[0]['confidence'] * 100,
                                )
                              : _output != null &&
                                      _output[0]['label'] == 'benign'
                                  ? PredictResult(
                                      color: Colors.green,
                                      index: 2,
                                      result:
                                          'ไม่พบความเสี่ยงในการเป็นมะเร็งผิวหนัง',
                                      value: _output[0]['confidence'] * 100,
                                    )
                                  : Column(
                                      children: [
                                        Text(
                                          'เลือกรูปของคุณ',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Taitham3'),
                                        ),
                                        Text(
                                            'หมายเหตุ เเอปพลิเคชันมีค่าความเเม่นยำ 75 เปอร์เซ็น'),
                                        Text(
                                            'อาจจะมีความคลาดเคลื่อนในการทำนายผล')
                                      ],
                                    ),
                          SizedBox(
                            height: 20,
                          ),
                          // widgets custom_button.dart
                          CustomButton(
                              title: "Take a Photo",
                              icon: iconSvg[0],
                              onclick: pickImage),
                          SizedBox(
                            height: 10,
                          ),
                          CustomButton(
                              title: "Camera Roll",
                              icon: iconSvg[1],
                              onclick: pickGalleryImage),
                        ],
                      ),
                    )))
          ])
        ],
      ),
    ]);
  }
}
