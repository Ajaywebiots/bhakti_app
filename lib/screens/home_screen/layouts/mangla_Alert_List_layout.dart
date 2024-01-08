import 'package:bhakti_app/config.dart';
import 'package:flutter_switch/flutter_switch.dart';

class ManglaAlertList extends StatelessWidget {
  final String? text;
  final bool? status;
  final ValueChanged<bool> onToggle;

  const ManglaAlertList(
      {super.key, this.status, this.text, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text!,
              style: appCss.dmDenseMedium16
                  .textColor(appColor(context).appTheme.rulesClr)),
          FlutterSwitch(
              width: Sizes.s41,
              height: Sizes.s23,
              padding: 3,
              toggleSize: Sizes.s17,
              value: status!,
              activeColor: appColor(context).appTheme.primary,
              inactiveColor: appColor(context).appTheme.lightText,
              borderRadius: 40.0,
              onToggle: onToggle)
        ]);
  }
}
