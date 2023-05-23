import 'package:flutter/material.dart';

import '../Screens/menu/prediction_green.dart';
import '../Screens/menu/prediction_red.dart';

// widgets หน้าเเสดงผลลัพการทำนาย
class PredictResult extends StatelessWidget {
  final String result;
  final Color color;
  final int index;
  final double value;

  const PredictResult({
    Key key,
    this.result,
    this.color,
    this.index,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'ผลการทำนาย',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Taitham3',
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        GestureDetector(
          onTap: () {
            if (index == 1) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PredictionRed(),
                  ));
            } else {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PredictionGreen(),
                  ));
            }
          },
          child: Container(
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  index == 1
                      ? Column(
                          children: [
                            Text(result,
                                style: const TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                    fontFamily: 'Taitham3')),
                            Text(
                              '${value.toStringAsFixed(2)} % ',
                              style: const TextStyle(
                                  fontSize: 21,
                                  color: Colors.white,
                                  fontFamily: 'taitham3'),
                            )
                          ],
                        )
                      : Column(
                          children: [
                            Text(result,
                                style: const TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                    fontFamily: 'Taitham3')),
                            Text(
                              '${value.toStringAsFixed(2)} % ',
                              style: const TextStyle(
                                  fontSize: 21,
                                  color: Colors.white,
                                  fontFamily: 'taitham3'),
                            )
                          ],
                        ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Padding(
                      padding: EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 5),
                      child: Text('คลิ๊กเพื่อดูรายละเอียด',
                          style: TextStyle(color: Colors.black)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
