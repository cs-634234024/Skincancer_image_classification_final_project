import 'package:flutter/material.dart';

import '../constrance.dart';

// widgets เเสดงข้อมูล รายละเอียดในของเเต่ละคน (หน้า aboutscreen)
class ListCard extends StatelessWidget {
  final String imageicon;
  final int index;
  final String name;
  final String github;
  final Function changeindex;
  const ListCard({
    Key key,
    this.imageicon,
    this.changeindex,
    this.index,
    this.name,
    this.github,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(imageicon), fit: BoxFit.contain),
                borderRadius: BorderRadius.circular(80),
                color: Colors.white,
                border: Border.all(color: kheaderColor, width: 1)),

            // child:
          ),
          const SizedBox(height: 10),
          const SizedBox(
            height: 10,
          ),
          Text(
            name,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                fontFamily: 'Taitham3'),
          ),
          const Text(
            'พัฒนาเเอปพลิเคชัน',
            style: TextStyle(fontFamily: 'Taitham3', fontSize: 15),
          ),
          const Text(
            'Github ',
            style: TextStyle(
                fontFamily: 'Taitham3',
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
          Text(
            github,
            style: const TextStyle(fontFamily: 'Taitham3', fontSize: 15),
          ),
        ],
      ),
    );
  }
}
