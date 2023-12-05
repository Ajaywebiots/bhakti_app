import 'package:bhakti_app/common/extension/spacing.dart';
import 'package:bhakti_app/common/extension/text_style_extensions.dart';
import 'package:bhakti_app/common/extension/widget_extension.dart';
import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/providers/bottom_nav_provider.dart';
import 'package:bhakti_app/providers/home_screen_provider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../../../common/assets/index.dart';

class MyDocumentScreen extends StatefulWidget {
  const MyDocumentScreen({super.key});

  @override
  State<MyDocumentScreen> createState() => _MyDocumentScreenState();
}

class _MyDocumentScreenState extends State<MyDocumentScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(
        builder: (context, homeScreenPvr, child) {
      return Scaffold(
          body: Stack(alignment: Alignment.topCenter, children: [
        Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(eImageAssets.splashBg)))),
        SingleChildScrollView(
            child: Column(children: [
          AppBar(
              leading: Container(),
              backgroundColor: Colors.transparent,
              titleSpacing: 0,
              leadingWidth: Sizes.s0,
              title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                SvgPicture.asset("assets/svg/arrowLeft.svg").inkWell(onTap: () {
                  Navigator.pop(context);

                }),
                const HSpace(Insets.i80),
                Text(appFonts.myDocument,
                    style: appCss.philosopherBold28
                        .textColor(appColor(context).appTheme.oneText))
              ])),
          const VSpace(Insets.i25),
          DottedBorder(
              dashPattern: const [5, 5, 5, 5, 5, 5],
              strokeWidth: 1,
              radius: const Radius.circular(8),
              borderType: BorderType.RRect,
              color: appColor(context).appTheme.primary,
              child: Container(
                  height: Sizes.s132,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: appColor(context).appTheme.whiteColor),
                  width: double.infinity,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/svg/documentUpload.svg"),
                        const VSpace(Insets.i10),
                        Text(appFonts.onlyPdf,
                            style: appCss.dmDenseRegular14.textColor(
                                appColor(context).appTheme.myDocumentColor)),
                        const VSpace(Insets.i8),
                        TextButton(
                            onPressed: () => homeScreenPvr.filePick(),
                            child: Text(appFonts.clickHere,
                                style: appCss.dmDenseMedium12
                                    .textDecoration(TextDecoration.underline,
                                        color:
                                            appColor(context).appTheme.primary)
                                    .textColor(
                                        appColor(context).appTheme.primary)))
                      ]))),
          const VSpace(Insets.i15),
          Container(
              height: Sizes.s70,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: appColor(context).appTheme.shadowClr,
                      blurRadius: 16,
                      offset: Offset(0, 2),
                      spreadRadius: 0,
                    )
                  ],
                  borderRadius: BorderRadius.circular(8),
                  color: appColor(context).appTheme.whiteColor),
              width: double.infinity,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(appFonts.uploadingFile,
                              style: appCss.dmDenseMedium16.textColor(
                                  appColor(context).appTheme.primary)),
                          Text(appFonts.mB,
                              style: appCss.dmDenseMedium14.textColor(
                                  appColor(context).appTheme.lightText))
                        ]),
                    CircularPercentIndicator(
                        radius: 27.0,
                        lineWidth: Sizes.s6,
                        animation: true,
                        percent: 73 / 100,
                        center: Text(appFonts.percent,
                            style: appCss.dmDenseMedium14.textColor(
                                appColor(context).appTheme.lightText)),
                        backgroundColor:
                            appColor(context).appTheme.processColor,
                        circularStrokeCap: CircularStrokeCap.round,
                        progressColor: appColor(context).appTheme.primary)
                  ]).paddingSymmetric(horizontal: 12)),
          const VSpace(Insets.i15),
          Container(
              padding: EdgeInsets.all(12),
              height: Sizes.s70,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: appColor(context).appTheme.shadowClr,
                        blurRadius: 16,
                        offset: const Offset(0, 2),
                        spreadRadius: 0)
                  ],
                  borderRadius: BorderRadius.circular(8),
                  color: appColor(context).appTheme.whiteColor),
              width: double.infinity,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset("assets/svg/jpeg.svg"),
                        const HSpace(Insets.i12),
                        Text(appFonts.chantingCertificate,
                            style: appCss.dmDenseMedium16
                                .textColor(appColor(context).appTheme.primary)),
                      ],
                    ),
                    Container(
                        padding: EdgeInsets.all(5),
                        height: Sizes.s30,
                        width: Sizes.s30,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: appColor(context)
                                .appTheme
                                .primary
                                .withOpacity(0.06)),
                        child: SvgPicture.asset("assets/svg/closeButton.svg"))
                  ]))
        ]).paddingSymmetric(horizontal: Insets.i20))
      ]));
    });
  }
}
