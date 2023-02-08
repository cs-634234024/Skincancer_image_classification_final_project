import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class BottomBarScreen extends StatelessWidget {
  final Function onItemTapped;
  const BottomBarScreen({Key key, this.onItemTapped}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: Colors.white,
      color: Colors.indigo,
      animationDuration: const Duration(milliseconds: 300),
      onTap: onItemTapped,
      items: const [
        Icon(
          Icons.menu,
          color: Colors.white,
        ),
        Icon(Icons.favorite, color: Colors.white),
        Icon(Icons.supervised_user_circle, color: Colors.white)
      ],
    );
  }
}
