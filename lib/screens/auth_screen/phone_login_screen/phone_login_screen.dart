import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/providers/phone_login_provider.dart';
import 'package:bhakti_app/common/assets/index.dart';
import 'package:bhakti_app/common/extension/spacing.dart';
import '../../../widgets/common_auth_button.dart';
import 'layouts/phone_login_upper_layout.dart';

class PhoneLoginScreen extends StatefulWidget {
  const PhoneLoginScreen({super.key});

  static String verify = "";

  @override
  State<PhoneLoginScreen> createState() => _PhoneLoginScreenState();
}

class _PhoneLoginScreenState extends State<PhoneLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PhoneLoginProvider>(
        builder: (context, phoneLoginPvr, child) {
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
                          key: phoneLoginPvr.formKey,
                          child: Column(children: [
                            const PhoneLoginUpperLayout(),
                            const VSpace(Insets.i25),
                            const VSpace(Insets.i20),
                            CommonAuthButton(
                                onTap: () =>
                                    phoneLoginPvr.sendOtpButton(context),
                                text: appFonts.sendOtp)
                          ])))
                ]))),
        if (phoneLoginPvr.isLoading) const CircularProgressIndicator()
      ]);
    });
  }
}
