// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skincacer_project_final/Screens/menu/method_treatment_screen.dart';
import 'package:skincacer_project_final/Screens/menu/skin_cancer_screen.dart';
import 'package:skincacer_project_final/constrance.dart';
import 'Screens/about_screen.dart';
import 'Screens/menu/manual_screen.dart';
import 'Screens/predictions_screen.dart';
import 'widgets/bottombar.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectindex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kheaderColor,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Skin Cancer Classification',
                style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.headline4,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                    color: Colors.white),
              ),
              IconButton(
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  icon: const Icon(Icons.exit_to_app_outlined))
            ],
          )),
      body: changeScreen(_selectindex),
      backgroundColor: kbackgroundColor,
      bottomNavigationBar: BottomBarScreen(
          onItemTapped: _onItemTapped, selectItem: _selectindex),
    );
  }
}

changeScreen(int index) {
  if (index == 0) {
    return const PredictionsScreen();
  } else if (index == 1) {
    return const ManualScreen();
  } else if (index == 2) {
    return const MethodTreatmentScreen();
  } else if (index == 3) {
    return const SkinCancerScreen();
  } else {
    return AboutScreen();
  }
}
