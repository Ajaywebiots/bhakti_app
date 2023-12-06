import 'package:bhakti_app/common/extension/text_style_extensions.dart';

import '../config.dart';

class CommonAuthButton extends StatelessWidget {
  final String? text;
  final GestureTapCallback? onTap;
  const CommonAuthButton({super.key, this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: GestureDetector(
            onTap: onTap,
            child: Container(
                alignment: Alignment.center,
                height: Sizes.s44,
                width: Sizes.s141,
                decoration: BoxDecoration(
                    color: appColor(context)
                        .appTheme
                        .primary,
                    borderRadius:
                    const BorderRadius.all(
                        Radius.circular(10))),
                child: Text(text!,
                    style: appCss.dmDenseMedium16
                        .textColor(Colors.white)))));
  }
}
