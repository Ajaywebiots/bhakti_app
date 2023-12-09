import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/widgets/custom_title_widget.dart';

class GenderRadioBox extends StatelessWidget {
  const GenderRadioBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SetUpProfileProvider>(builder: (context, profilePvr, child) {
     return CustomTitleWidget(
        height: 52,
        radius: 8,
        color: const Color(0xff541F5C).withOpacity(.20),
        width: double.infinity,
        title: 'Gender',
        child: Row(children: [
          const HSpace(Insets.i17),
          SvgPicture.asset(eSvgAssets.gender),
          const HSpace(Insets.i10),
          SvgPicture.asset(eSvgAssets.line, height: 24, width: 24),
          const HSpace(Insets.i5),
          Radio(
            fillColor: MaterialStateColor.resolveWith(
                (states) => const Color(0xFF541F5C)),
            value: 1,
            groupValue: profilePvr.selectedGender,
            onChanged: (value) {
              profilePvr.selectedGender = value!;
              profilePvr.notifyListeners();
            },
          ),
          Text(appFonts.male,
              style:
                  appCss.dmDenseMedium14.textColor(appColor(context).appTheme.primary)),
          Radio(
            fillColor: MaterialStateColor.resolveWith(
                (states) => const Color(0xFF541F5C)),
            value: 2,
            groupValue: profilePvr.selectedGender,
            onChanged: (value) {
              profilePvr.selectedGender = value!;
              profilePvr.notifyListeners();
            },
          ),
          Text(appFonts.female,
              style:
              appCss.dmDenseMedium14.textColor(appColor(context).appTheme.primary)),
        ]),
      ).paddingSymmetric(vertical: 10);
    });
  }
}
