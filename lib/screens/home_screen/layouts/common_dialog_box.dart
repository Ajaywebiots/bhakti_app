import 'package:bhakti_app/common/extension/spacing.dart';
import 'package:bhakti_app/common/extension/text_style_extensions.dart';
import 'package:bhakti_app/common/extension/widget_extension.dart';
import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/screens/home_screen/layouts/common_ruler_picker.dart';

class CommonDialog extends StatelessWidget {
  final ValueSetter<int> onHourChange;
  final ValueSetter<int> onMinChange;
  final String? text, text1, text2;

  const CommonDialog(
      {super.key,
      required this.onHourChange,
      required this.onMinChange,
      this.text,
      this.text1,
      this.text2});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Colors.transparent,
        alignment: Alignment.center,
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: Colors.white),
            width: 335,
            height: 400,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Center(
                  child: Text(text!,
                      style: appCss.philosopherBold18
                          .textColor(appColor(context).appTheme.primary))),
              const VSpace(Insets.i20),
              Text(
                  textAlign: TextAlign.start,
                  text1!,
                  style: appCss.dmDenseMedium14
                      .textColor(appColor(context).appTheme.primary)),
              const VSpace(Insets.i32),
              CommonRulerPicker(
                  startValue: 1, maxValue: 12, onChange: onHourChange),
              Text(
                  textAlign: TextAlign.start,
                  text2!,
                  style: appCss.dmDenseMedium14
                      .textColor(appColor(context).appTheme.primary)),
              const VSpace(Insets.i10),
              CommonRulerPicker(
                  startValue: 1, maxValue: 60, onChange: onMinChange),
              const VSpace(Insets.i30),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1,
                            color: appColor(context).appTheme.primary),
                        borderRadius: BorderRadius.circular(8)),
                    height: 44,
                    width: 120,
                    child: Text("Cancel",
                        style: appCss.dmDenseMedium14
                            .textColor(appColor(context).appTheme.primary))),
                Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: appColor(context).appTheme.primary),
                    height: 44,
                    width: 120,
                    child: Text("Save",
                        style: appCss.dmDenseMedium14
                            .textColor(appColor(context).appTheme.whiteColor)))
              ])
            ]).paddingAll(15)));
  }
}
