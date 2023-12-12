import '../config.dart';

class CommonTextField extends StatelessWidget {
  final String? hintText, prefixSvg;
  final TextEditingController? controller;
  final bool? readOnly, isPrefixSvg;

  const CommonTextField(
      {super.key,
      this.hintText,
      this.prefixSvg,
      this.controller,
      this.readOnly = false,
      this.isPrefixSvg = false});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: 40,
        decoration: BoxDecoration(
            border: Border.all(
                color: appColor(context).appTheme.primary.withOpacity(0.20)),
            borderRadius: BorderRadius.circular(8)),
        child: TextField(
            controller: controller,
            readOnly: readOnly ?? true,
            decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0x0FC35DD2),
                hintText: hintText,
                hintStyle: appCss.dmDenseRegular14.textColor(
                  appColor(context).appTheme.black,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                prefixIcon: isPrefixSvg == true
                    ? Row(
                        children: [
                          SvgPicture.asset(prefixSvg!),
                          const HSpace(Insets.i10),
                          SvgPicture.asset(eSvgAssets.line),
                        ],
                      ).paddingAll(10)
                    : Container(),
                // disabledBorder: const OutlineInputBorder(
                //   borderRadius: BorderRadius.all(Radius.circular(AppRadius.r8)),
                //   borderSide: BorderSide.none,
                // ),
                // focusedBorder: const OutlineInputBorder(
                //   borderRadius: BorderRadius.all(Radius.circular(AppRadius.r8)),
                //   borderSide: BorderSide.none,
                // ),
                // enabledBorder: const OutlineInputBorder(
                //   borderRadius: BorderRadius.all(Radius.circular(AppRadius.r8)),
                //   borderSide: BorderSide.none,
                // ),
                border: const OutlineInputBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(AppRadius.r8)),
                    borderSide: BorderSide.none)),
            style: appCss.dmDenseRegular14
                .textColor(appColor(context).appTheme.primary)));
  }
}
