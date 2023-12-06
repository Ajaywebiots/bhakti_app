import 'package:bhakti_app/common/extension/spacing.dart';
import 'package:bhakti_app/common/extension/text_style_extensions.dart';
import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/providers/otp_screen_provider.dart';
import 'package:pinput/pinput.dart';
import '../../../../common/assets/index.dart';

class OtpUpperLayout extends StatelessWidget {
  const OtpUpperLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final focusedBorderColor =
        appColor(context).appTheme.primary.withOpacity(0.20);
    final fillColor = appColor(context).appTheme.whiteColor;
    final borderColor = appColor(context).appTheme.primary;
    final defaultPinTheme = PinTheme(
        width: Sizes.s56,
        height: Sizes.s56,
        textStyle: appCss.dmDenseMedium22
            .textColor(appColor(context).appTheme.lightText),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(19),
            border: Border.all(color: borderColor)));

    return Consumer<OtpScreenProvider>(builder: (context, otpPvr, child) {
      return Column(children: [
        Image.asset(eImageAssets.bhaktiLogo,
            height: Sizes.s63, width: Sizes.s267),
        Text(appFonts.sadhanaRecord, style: appCss.philosopherBold25),
        VSpace(MediaQuery.of(context).size.height * 0.2),
        const VSpace(Insets.i25),
        SizedBox(
            height: Sizes.s100,
            child: Pinput(
                errorTextStyle: appCss.dmDenseMedium14.textColor(Colors.red),
                keyboardType: TextInputType.number,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                length: 6,
                validator: (value) => otpPvr.validator(value),
                controller: otpPvr.pinController,
                focusNode: otpPvr.focusNode,
                defaultPinTheme: defaultPinTheme,
                onCompleted: (pin) => otpPvr.onCompleted(context, pin),
                onChanged: (value) => otpPvr.onChanged(value, context),
                focusedPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!.copyWith(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: focusedBorderColor))),
                submittedPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!.copyWith(
                        color: fillColor,
                        borderRadius: BorderRadius.circular(19),
                        border: Border.all(color: focusedBorderColor))),
                errorPinTheme: defaultPinTheme.copyBorderWith(
                    border: Border.all(color: Colors.redAccent))))
      ]);
    });
  }
}
