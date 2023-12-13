import 'package:dotted_border/dotted_border.dart';
import '../../../../config.dart';

class DottedBorderLayout extends StatelessWidget {
  const DottedBorderLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(
        builder: (context, homeScreenPvr, child) {
      return DottedBorder(
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
                    SvgPicture.asset(eSvgAssets.documentUpload),
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
                                    color: appColor(context).appTheme.primary)
                                .textColor(appColor(context).appTheme.primary)))
                  ])));
    });
  }
}
