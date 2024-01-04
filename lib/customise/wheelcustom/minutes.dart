import 'package:bhakti_app/config.dart';
import 'package:flutter/material.dart';

class MyMinutes extends StatelessWidget {
  int mins;

  MyMinutes({required this.mins});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
            child: Text(mins < 10 ? '0$mins' : mins.toString(),
                style: appCss.dmDenseBold38
                    .textColor(appColor(context).appTheme.primary))));
  }
}
