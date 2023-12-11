import 'package:bhakti_app/screens/home_screen/setting_screen/layouts/access_key_container.dart';
import '../../../../config.dart';

class SettingDialogLayout extends StatelessWidget {
  const SettingDialogLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: SizedBox(
            height: 190,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(appFonts.bhaktiStepsAccessKey,
                      style: appCss.philosopherBold18
                          .textColor(appColor(context).appTheme.primary)),
                  const VSpace(Insets.i10),
                  Text(appFonts.thisAccessKey,
                      style: appCss.dmDenseRegular14
                          .textColor(appColor(context).appTheme.rulesClr)),
                  Text(appFonts.bhaktiStepsApplication,
                      style: appCss.dmDenseRegular14
                          .textColor(appColor(context).appTheme.rulesClr)),
                  Text(appFonts.shareTheKey,
                      style: appCss.dmDenseRegular14
                          .textColor(appColor(context).appTheme.rulesClr)),
                  const VSpace(Insets.i25),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Container(
                        height: 40,
                        width: 205,
                        decoration: BoxDecoration(
                            color: const Color(0x0FC35DD2),
                            border: Border.all(
                                color: appColor(context)
                                    .appTheme
                                    .primary
                                    .withOpacity(0.20)),
                            borderRadius: BorderRadius.circular(8)),
                        child: const TextField(
                            readOnly: true,
                            decoration: InputDecoration(
                                hintText: '',
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(AppRadius.r8)),
                                    borderSide: BorderSide.none),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(AppRadius.r8)),
                                    borderSide: BorderSide.none),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(AppRadius.r8)),
                                    borderSide: BorderSide.none),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(AppRadius.r8)),
                                    borderSide: BorderSide.none)))),
                    const HSpace(Insets.i10),
                    AccessKeyContainer(svgImage: eSvgAssets.documentCopy),
                    const HSpace(Insets.i10),
                    AccessKeyContainer(svgImage: eSvgAssets.shareMySadhana)
                  ])
                ])));
  }
}
