import 'package:flutter/material.dart';

// widgets เเสดงลักษณะของรูปภาพที่เป็นใฝ
class BuildCardImage extends StatelessWidget {
  final String imageList;
  const BuildCardImage({
    Key key,
    this.imageList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: (Container(
        width: 350,
        height: 250,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.indigo),
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                image: AssetImage(imageList), fit: BoxFit.cover),
            color: Colors.white54),
      )),
    );
  }
}
