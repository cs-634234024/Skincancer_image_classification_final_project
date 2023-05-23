import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constrance.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onclick;

  const CustomButton({
    Key key,
    this.title,
    this.icon,
    this.onclick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onclick,
          child: Container(
            width: MediaQuery.of(context).size.width - 200,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 17),
            decoration: BoxDecoration(
              color: kbuttonWidgetColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                SvgPicture.asset(icon),
                const SizedBox(
                  width: 13,
                ),
                Text(
                  title,
                  style: const TextStyle(
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
