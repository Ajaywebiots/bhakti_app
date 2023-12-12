import 'package:bhakti_app/config.dart';

class ShareMySadhanaDialog extends StatelessWidget {
  const ShareMySadhanaDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: SizedBox(
            height: Sizes.s175,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const VSpace(Insets.i10),
              Center(
                  child: Text(appFonts.stopSharing,
                      style: appCss.philosopherBold18
                          .textColor(appColor(context).appTheme.primary))),
              const VSpace(Insets.i10),
              Center(
                  child: Text(appFonts.areYouSureToStop,
                      style: appCss.dmDenseRegular14
                          .textColor(appColor(context).appTheme.rulesClr))),
              Center(
                  child: Text(appFonts.sadhana,
                      style: appCss.dmDenseRegular14
                          .textColor(appColor(context).appTheme.rulesClr))),
              const VSpace(Insets.i25),
              CommonSelectionButton(
                  textTwo: appFonts.delete,
                  onTapOne: () => Navigator.pop(context),
                  onTapTwo: () => Navigator.pop(context))
            ])));
  }
}
