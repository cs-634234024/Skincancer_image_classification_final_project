import 'dart:io';

import 'package:flutter/material.dart';

// โชว์ รูปภาพที่เลือกจาก เเกลลอรี่ หรือ จากภาพที่ถ่าย เเล้วนำไปเข้าโมเดล
class ShowImage extends StatelessWidget {
  const ShowImage({
    Key key,
    @required File image,
  })  : _image = image,
        super(key: key);

  final File _image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: MediaQuery.of(context).size.width * 0.6,
            width: MediaQuery.of(context).size.width * 0.6,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.file(
                _image,
                fit: BoxFit.fill,
              ),
            )),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
