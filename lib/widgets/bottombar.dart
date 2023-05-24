import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:skincacer_project_final/constrance.dart';

class BottomBarScreen extends StatelessWidget {
  final Function onItemTapped;
  final int selectItem;
  const BottomBarScreen({Key key, this.onItemTapped, this.selectItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(24),
        topLeft: Radius.circular(24),
      ),
      child: BottomNavigationBar(
        backgroundColor: kbottomColor,
        selectedIconTheme: const IconThemeData(color: Colors.white),
        unselectedIconTheme: const IconThemeData(color: kheaderColor),
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.camera,
            ),
            label: 'Prediction',
            backgroundColor: kbottomColor,
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.book),
            label: 'Manual',
            backgroundColor: kbottomColor,
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.heartbeat),
            label: 'Treatment',
            backgroundColor: kbottomColor,
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.virus),
            label: 'Skin Cancer',
            backgroundColor: kbottomColor,
          ),
        ],
        currentIndex: selectItem,
        selectedItemColor: Colors.white,
        onTap: onItemTapped,
      ),
    );
  }
}
