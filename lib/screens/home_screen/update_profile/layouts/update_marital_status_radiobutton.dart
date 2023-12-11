import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/widgets/custom_title_widget.dart';

class UpdateMaritalStatusBox extends StatelessWidget {
  const UpdateMaritalStatusBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UpdateProfileProvider>(
        builder: (context, updateProfilePvr, child) {
      return CustomTitleWidget(
          height: 52,
          width: double.infinity,
          title: 'Marital Status',
          color: updateProfilePvr.nameValid == null
              ? const Color(0xff541F5C).withOpacity(.20)
              : appColor(context).appTheme.red,
          radius: 8,
          child: Row(children: [
            const HSpace(Insets.i18),
            SvgPicture.asset(eSvgAssets.wedding),
            const HSpace(Insets.i10),
            SvgPicture.asset(eSvgAssets.line),
            Radio(
                fillColor: MaterialStateColor.resolveWith(
                    (states) => const Color(0xFF541F5C)),
                value: 1,
                groupValue: updateProfilePvr.selectedMarital,
                onChanged: (value) => updateProfilePvr.marriedChanged(value)),
            Text("Married",
                style: appCss.dmDenseMedium14
                    .textColor(appColor(context).appTheme.lightText)),
            Radio(
                fillColor: MaterialStateColor.resolveWith(
                    (states) => const Color(0xFF541F5C)),
                value: 2,
                groupValue: updateProfilePvr.selectedMarital,
                onChanged: (value) => updateProfilePvr.unMarriedChanged(value)),
            Text("Unmarried",
                style: appCss.dmDenseMedium14
                    .textColor(appColor(context).appTheme.lightText))
          ])).paddingSymmetric(vertical: 10);
    });
  }
}
