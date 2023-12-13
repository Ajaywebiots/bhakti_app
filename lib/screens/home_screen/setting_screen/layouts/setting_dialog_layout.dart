import 'package:bhakti_app/screens/home_screen/setting_screen/layouts/access_key_container.dart';
import '../../../../config.dart';

class SettingDialogLayout extends StatelessWidget {
  const SettingDialogLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingProvider>(builder: (context, settingPvr, child) {
      return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(appFonts.bhaktiStepsAccessKey,
                    textAlign: TextAlign.center,
                    style: appCss.philosopherBold18
                        .textColor(appColor(context).appTheme.primary)),
                const VSpace(Insets.i10),
                Text(appFonts.bhaktiStepsApplication,
                    textAlign: TextAlign.center,
                    style: appCss.dmDenseRegular14
                        .textColor(appColor(context).appTheme.rulesClr)),
                const VSpace(Insets.i25),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  // Container(
                  //     height: 40,
                  //     width: 205,
                  //     decoration: BoxDecoration(
                  //         color: const Color(0x0FC35DD2),
                  //         border: Border.all(
                  //             color: appColor(context)
                  //                 .appTheme
                  //                 .primary
                  //                 .withOpacity(0.20)),
                  //         borderRadius: BorderRadius.circular(8)),
                  //     child: const TextField(
                  //         readOnly: true,
                  //         decoration: InputDecoration(
                  //             hintText: '',
                  //             disabledBorder: OutlineInputBorder(
                  //                 borderRadius: BorderRadius.all(
                  //                     Radius.circular(AppRadius.r8)),
                  //                 borderSide: BorderSide.none),
                  //             focusedBorder: OutlineInputBorder(
                  //                 borderRadius: BorderRadius.all(
                  //                     Radius.circular(AppRadius.r8)),
                  //                 borderSide: BorderSide.none),
                  //             enabledBorder: OutlineInputBorder(
                  //                 borderRadius: BorderRadius.all(
                  //                     Radius.circular(AppRadius.r8)),
                  //                 borderSide: BorderSide.none),
                  //             border: OutlineInputBorder(
                  //                 borderRadius: BorderRadius.all(Radius.circular(AppRadius.r8)),
                  //                 borderSide: BorderSide.none)))),
                  Expanded(
                      child: CommonTextField(
                          height: 50,
                          readOnly: true,
                          controller: settingPvr.accessKey,
                          hintText: "")),
                  const HSpace(Insets.i10),
                  AccessKeyContainer(svgImage: eSvgAssets.documentCopy),
                  const HSpace(Insets.i10),
                  AccessKeyContainer(svgImage: eSvgAssets.shareMySadhana)
                ])
              ]).paddingSymmetric(vertical: 20, horizontal: 15));
    });
  }
}
