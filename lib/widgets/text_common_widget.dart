import 'package:bhakti_app/common/extension/text_style_extensions.dart';
import 'package:bhakti_app/config.dart';

class TextFieldCommon extends StatelessWidget {
  final String? hintText, errorText;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
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
  final bool? readOnly;

  const TextFieldCommon({
    Key? key,
    this.hintText,
    this.errorText,
    this.validator,
    this.controller,
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
    this.readOnly,
    this.maxLength,
    this.minLines,
    this.maxLines,
    this.counterText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
// Text field common
    return TextFormField(
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
            counterText: '',
            errorMaxLines: 1,
            errorText: "",
            errorStyle: const TextStyle(fontSize: 0, color: Colors.transparent),
            isDense: true,
            disabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(AppRadius.r8)),
                borderSide: BorderSide.none),
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(AppRadius.r8)),
                borderSide: BorderSide.none),
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(AppRadius.r8)),
                borderSide: BorderSide.none),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(AppRadius.r8)),
                borderSide: BorderSide.none),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            contentPadding: EdgeInsets.symmetric(
                vertical: vertical ?? 17.0, horizontal: 15.0),
            hintText: hintText,
            hintStyle: appCss.dmDenseBold14.textColor(const Color(0xff767676)),
            labelStyle:
                appCss.dmDenseRegular14.textColor(const Color(0xff767676))));
  }
}
