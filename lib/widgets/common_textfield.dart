import '../config.dart';

class CommonTextField extends StatelessWidget {
  final String? hintText, prefixSvg, prefixSvg1;

  const CommonTextField(
      {super.key, this.hintText, this.prefixSvg, this.prefixSvg1});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: 50,
        decoration: BoxDecoration(
            border: Border.all(
                color: appColor(context).appTheme.primary.withOpacity(0.20)),
            borderRadius: BorderRadius.circular(8)),
        child: TextField(
            decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0x0FC35DD2),
                hintText: hintText,
                hintStyle: appCss.dmDenseRegular14
                    .textColor(appColor(context).appTheme.lightText),
                prefixIcon: Row(children: [
                  SvgPicture.asset(prefixSvg!),
                  const HSpace(Insets.i10),
                  SvgPicture.asset(prefixSvg1!)
                ]).paddingAll(10),
                disabledBorder: const OutlineInputBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(AppRadius.r8)),
                    borderSide: BorderSide.none),
                focusedBorder: const OutlineInputBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(AppRadius.r8)),
                    borderSide: BorderSide.none),
                enabledBorder: const OutlineInputBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(AppRadius.r8)),
                    borderSide: BorderSide.none),
                border: const OutlineInputBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(AppRadius.r8)),
                    borderSide: BorderSide.none))));
  }
}
