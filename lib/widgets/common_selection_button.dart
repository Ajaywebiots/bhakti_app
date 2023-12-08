import '../config.dart';

class CommonSelectionButton extends StatelessWidget {
  final GestureTapCallback? onTapOne, onTapTwo;
  final String? textOne, textTwo;


  const CommonSelectionButton(
      {super.key, this.onTapOne, this.onTapTwo, this.textOne, this.textTwo});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      CommonButton(
          borderColor: appColor(context).appTheme.primary,
          style: appCss.dmDenseMedium16
              .textColor(appColor(context).appTheme.primary),
          width: Sizes.s120,
          text: textOne ?? appFonts.cancel,
          isColor: true,
          bColor: Colors.white,
          onTap: onTapOne),
      const HSpace(Insets.i15),
      CommonButton(width: Sizes.s120, text: textTwo ?? appFonts.save, onTap: onTapTwo)
    ]);
  }
}
