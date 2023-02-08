import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import '../home.dart';

class MySplash extends StatefulWidget {
  const MySplash({Key key}) : super(key: key);

  @override
  State<MySplash> createState() => _MySplashState();
}

class _MySplashState extends State<MySplash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 2,
      navigateAfterSeconds: const Home(),
      title: const Text('Scan Skin',
          style: TextStyle(
              fontFamily: 'Taitham3',
              fontSize: 60,
              fontWeight: FontWeight.bold)),
      image: Image.asset('assets/images/menu/maledoctor.png'),
      backgroundColor: Colors.indigo.shade50,
      photoSize: 150,
      loaderColor: Colors.indigo,
      loadingText: const Text(
        'กำลังโหลด',
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo),
      ),
    );
  }
}
