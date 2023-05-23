import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constrance.dart';

//widgets หัวข้อหลักเเสดงในเเต่ละหน้า
class OutputHeader extends StatelessWidget {
  final String title;
  final FaIcon icon;
  const OutputHeader({
    Key key,
    this.title,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 7,
              blurRadius: 5,
              offset: const Offset(0, 3))
        ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                color: kheaderColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            icon
          ],
        ),
      ),
    );
  }
}
