import 'package:bhakti_app/config.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:bhakti_app/screens/home_screen/drawer_screen/layouts/dotted_border_layout.dart';

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
          body: CommonBgImage(
              widget: SingleChildScrollView(
                  child: Column(children: [
        CommonAppBar(
            hSpace: Insets.i80,
            text: appFonts.myDocument,
            onTap: () => Navigator.pop(context)),
        const VSpace(Insets.i25),
        const DottedBorderLayout(),
        const VSpace(Insets.i15),
        CommonContainerTile(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(appFonts.uploadingFile,
                        style: appCss.dmDenseMedium16
                            .textColor(appColor(context).appTheme.primary)),
                    Text(appFonts.mB,
                        style: appCss.dmDenseMedium14
                            .textColor(appColor(context).appTheme.lightText))
                  ]),
              CircularPercentIndicator(
                  radius: 27.0,
                  lineWidth: Sizes.s6,
                  animation: true,
                  percent: 73 / 100,
                  center: Text(appFonts.percent,
                      style: appCss.dmDenseMedium14
                          .textColor(appColor(context).appTheme.lightText)),
                  backgroundColor: appColor(context).appTheme.processColor,
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: appColor(context).appTheme.primary)
            ])),
        const VSpace(Insets.i15),
        CommonContainerTile(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              Row(children: [
                SvgPicture.asset(eSvgAssets.jpeg),
                const HSpace(Insets.i12),
                Text(appFonts.shradhavanCertificate,
                    style: appCss.dmDenseMedium16
                        .textColor(appColor(context).appTheme.primary))
              ]),
              Container(
                  padding: const EdgeInsets.all(5),
                  height: Sizes.s30,
                  width: Sizes.s30,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          appColor(context).appTheme.primary.withOpacity(0.06)),
                  child: SvgPicture.asset(eSvgAssets.closeButton))
            ]))
      ]).paddingSymmetric(horizontal: Insets.i20))));
    });
  }
}
