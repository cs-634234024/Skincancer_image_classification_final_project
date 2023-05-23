import 'package:flutter/material.dart';

// โชว์ อค่อนก่อนเลือกรูปที่จะ prediction
class BoxLogoImages extends StatelessWidget {
  const BoxLogoImages({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.width * 0.6,
        width: MediaQuery.of(context).size.width * 0.6,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset('assets/images/menu/maledoctor.png')));
  }
}
