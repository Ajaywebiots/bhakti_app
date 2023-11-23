import 'package:bhakti_app/config.dart';
import 'package:flutter/material.dart';

class CommonPopInkwell extends StatelessWidget {
  final GestureTapCallback? onTap;

  final int? index, selectedIndex;
  final String? text;

  const CommonPopInkwell(
      {super.key, this.onTap, this.index, this.text, this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
            width: MediaQuery.of(context).size.width * 0.28,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(index == 0
                        ? 8
                        : index == 1
                            ? 0
                            : index == 2
                                ? 0
                                : index == 3
                                    ? 0
                                    : index == 4
                                        ? 0
                                        : 0),
                    topRight: Radius.circular(index == 0
                        ? 0
                        : index == 1
                            ? 0
                            : index == 2
                                ? 0
                                : index == 3
                                    ? 0
                                    : index == 4
                                        ? 8
                                        : 0),
                    bottomLeft: Radius.circular(index == 0
                        ? 8
                        : index == 1
                            ? 0
                            : index == 2
                                ? 0
                                : index == 3
                                    ? 0
                                    : index == 4
                                        ? 0
                                        : 0),
                    bottomRight: Radius.circular(index == 0
                        ? 0
                        : index == 1
                            ? 0
                            : index == 2
                                ? 0
                                : index == 3
                                    ? 0
                                    : index == 4
                                        ? 8
                                        : 0)),
                color: appColor(context).appTheme.whiteColor),
            child: Container(
                alignment: Alignment.center,
                height: 42,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: index == selectedIndex
                        ? appColor(context).appTheme.primary
                        : appColor(context).appTheme.whiteColor),
                child: Text(text!,
                    style: TextStyle(
                        color: index == selectedIndex
                            ? appColor(context).appTheme.whiteColor
                            : appColor(context).appTheme.lightText)))));
  }
}
