// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PredicScreenTwo extends StatefulWidget {
  const PredicScreenTwo({
    Key key,
  }) : super(key: key);

  @override
  State<PredicScreenTwo> createState() => _PredicScreenTwoState();
}

class _PredicScreenTwoState extends State<PredicScreenTwo> {
  bool _loading = true;
  File _image;
  List _output;
  final picker = ImagePicker(); //allows us to pick image from gallery or camera

  @override
  void initState() {
    //initS is the first function that is executed by default when this class is called
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
    //this function runs the model on the image
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults:
          5, //the amout of categories our neural network can predict (here no. of animals)
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * 0.35,
            decoration: BoxDecoration(
                color: Colors.indigo,
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
                      color: Colors.indigo.shade100)),
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
                      height: 550,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.indigo.shade50,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: _loading == true
                                ? boxLogoImages()
                                : boxResultImages(image: _image),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          _output != null && _output[0]['label'] == 'malignent'
                              ? Predict_result(
                                  reslut:
                                      'พบความเสี่ยงในการเป็นโรคมะเร็งผิวหนัง',
                                  color: Colors.red,
                                )
                              : _output != null &&
                                      _output[0]['label'] == 'benign'
                                  ? Predict_result(
                                      reslut:
                                          'ไม่พบความเสี่ยงในการเป็นโรคมะเร็งผิวหนัง',
                                      color: Colors.green,
                                    )
                                  : Text(
                                      'เลือกรูปของคุณ',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Taitham3'),
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
    );
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
              color: Colors.indigo.shade300,
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
  const Predict_result({
    Key key,
    this.reslut,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'ผลการทำนาย',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Taitham3',
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(reslut,
                style: TextStyle(
                    fontSize: 17, color: Colors.white, fontFamily: 'Taitham3')),
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
            height: 20,
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
