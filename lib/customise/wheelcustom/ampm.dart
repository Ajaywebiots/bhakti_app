import 'package:flutter/material.dart';

class AmPm extends StatelessWidget {
  final bool isItAm;

  AmPm({required this.isItAm});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
            child: Text(isItAm == true ? 'am' : 'pm',
                style: TextStyle(fontSize: 40, color: Colors.white))));
  }
}
