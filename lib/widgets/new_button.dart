import 'package:flutter/material.dart';

// widgets ปุ่มเลือก เมนูของเเต่ละหน้า
class NewButton extends StatelessWidget {
  final String title;
  final Function changeIndexButton;
  final int index;
  final Color changecolorbutton;
  const NewButton({
    Key key,
    this.title,
    this.changeIndexButton,
    this.index,
    this.changecolorbutton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => changeIndexButton(index),
      child: Container(
        width: MediaQuery.of(context).size.width - 270,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: changecolorbutton,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
