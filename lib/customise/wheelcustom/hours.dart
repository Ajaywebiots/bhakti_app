import 'package:flutter/material.dart';

import '../../config.dart';

class MyHours extends StatelessWidget {
  int hours;

  MyHours({required this.hours});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
            child: Text(hours.toString(),
                style: appCss.dmDenseBold38
                    .textColor(appColor(context).appTheme.primary))));
  }
}
