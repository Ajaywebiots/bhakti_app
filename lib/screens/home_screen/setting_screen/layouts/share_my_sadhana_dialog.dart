  import '../../../../config.dart';

class ShareMySadhanaDialog extends StatelessWidget {
  const ShareMySadhanaDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: SizedBox(
            height: 175,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const VSpace(Insets.i10),
              Center(
                  child: Text("Stop Sharing",
                      style: appCss.philosopherBold18
                          .textColor(appColor(context).appTheme.primary))),
              const VSpace(Insets.i10),
              Center(
                  child: Text("Are You Sure You Want to stop shared",
                      style: appCss.dmDenseRegular14
                          .textColor(appColor(context).appTheme.rulesClr))),
              Center(
                  child: Text(
                      style: appCss.dmDenseRegular14
                          .textColor(appColor(context).appTheme.rulesClr),
                      "Sadhana?")),
              const VSpace(Insets.i25),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                            style: appCss.dmDenseMedium16
                                .textColor(appColor(context).appTheme.primary)))
                    .inkWell(onTap: () {
                  Navigator.pop(context);
                }),
                const HSpace(Insets.i15),
                Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: appColor(context).appTheme.primary),
                        height: 44,
                        width: 120,
                        child: Text("Delete",
                            style: appCss.dmDenseMedium16.textColor(
                                appColor(context).appTheme.whiteColor)))
                    .inkWell(onTap: () {
                  Navigator.pop(context);
                })
              ])
            ])));
  }
}
