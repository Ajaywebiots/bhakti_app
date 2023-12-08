import 'package:bhakti_app/config.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<OtpScreenProvider>(builder: (context1, otpPvr, child) {
      return Stack(alignment: Alignment.center, children: [
        Scaffold(
            body: Container(
                height: double.infinity,
                width: double.infinity,
                padding: EdgeInsets.only(
                    bottom: Insets.i27,
                    top: MediaQuery.of(context).size.height * 0.13),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(eImageAssets.splashBg))),
                child: Stack(alignment: Alignment.topCenter, children: [
                  SingleChildScrollView(
                      child: Form(
                          key: otpPvr.formKey,
                          child: Column(children: [
                            const OtpUpperLayout(),
                            if (otpPvr.isValid)
                              Text(appFonts.enterValidOTP,
                                  style: appCss.dmDenseMedium16.textColor(
                                      appColor(context).appTheme.red)),
                            const VSpace(Insets.i100),
                            CommonButton(
                                width: Sizes.s141,
                                onTap: () => otpPvr.verifyButton(context),
                                text: appFonts.verify)
                          ])))
                ]).paddingSymmetric(horizontal: 20))),
        if (otpPvr.isLoading) const CircularProgressIndicator()
      ]);
    });
  }
}
