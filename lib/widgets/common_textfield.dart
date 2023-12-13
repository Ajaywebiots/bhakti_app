import '../config.dart';

class CommonTextField extends StatelessWidget {
  final String? hintText, errorText;
  final TextEditingController? controller;
  final bool? readOnly;
  final double? height;
  final FormFieldValidator<String>? validator;
  final Widget? suffixIcon, prefixIcon;
  final Color? fillColor;
  final bool obscureText;
  final double? vertical;
  final InputBorder? border;

  // final String? errorText;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;
  final int? maxLength, minLines, maxLines;
  final String? counterText;
  final GestureTapCallback? onTap;
  final Widget? prefix;

  const CommonTextField(
      {super.key,
      this.hintText,
      // this.prefixSvg,
      this.controller,
      this.readOnly = false,
      // this.isPrefixSvg = false,
      this.errorText,
      this.validator,
      this.suffixIcon,
      this.prefixIcon,
      this.border,
      this.obscureText = false,
      this.fillColor,
      this.vertical,
      this.keyboardType,
      this.focusNode,
      this.onChanged,
      this.onTap,
      this.maxLength,
      this.minLines,
      this.maxLines,
      this.counterText,
      this.height,
      this.prefix});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height ?? 40,
        decoration: BoxDecoration(
            border: Border.all(
                color: appColor(context).appTheme.primary.withOpacity(0.20)),
            borderRadius: BorderRadius.circular(8)),
        child: TextFormField(
            cursorColor: appColor(context).appTheme.primary,
            showCursor: true,
            maxLines: maxLines ?? 1,
            style: appCss.dmDenseExtraBold16.textColor(const Color(0xff767676)),
            focusNode: focusNode,
            obscureText: obscureText,
            keyboardType: keyboardType,
            validator: validator,
            onTap: onTap,
            readOnly: readOnly ?? false,
            controller: controller,
            onChanged: onChanged,
            minLines: minLines,
            maxLength: maxLength,
            decoration: InputDecoration(
                filled: true,
                fillColor: appColor(context).appTheme.textFieldClr,
                counterText: '',
                errorMaxLines: 1,
                errorStyle:
                    const TextStyle(fontSize: 0, color: Colors.transparent),
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
                    borderSide: BorderSide.none),
                suffixIcon: suffixIcon,
                prefixIcon: Row(mainAxisSize: MainAxisSize.min, children: [
                  prefixIcon ?? const SizedBox(),
                ]),
                contentPadding: EdgeInsets.symmetric(
                    vertical: vertical ?? 17.0, horizontal: 15.0),
                hintText: hintText,
                hintStyle:
                    appCss.dmDenseMedium14.textColor(const Color(0xff767676)),
                labelStyle: appCss.dmDenseRegular14
                    .textColor(const Color(0xff767676)))));
    /*Container(
        height: height ?? 40,
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
                .textColor(appColor(context).appTheme.primary)))*/
    ;
  }
}
