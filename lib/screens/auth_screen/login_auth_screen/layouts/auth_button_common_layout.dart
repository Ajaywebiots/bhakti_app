import 'package:bhakti_app/config.dart';

class AuthButtonLayout extends StatelessWidget {
  final String label;
  final Color color;
  final String iconPath;
  final Function() onTap;

  const AuthButtonLayout(
      {super.key,
      required this.label,
      required this.color,
      required this.iconPath,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Sizes.s250,
        height: Sizes.s50,
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(
              color: Color(0x1E000000),
              blurRadius: 4,
              offset: Offset(0, 2),
              spreadRadius: 0)
        ], color: color, borderRadius: BorderRadius.circular(50)),
        child: Row(children: [
          const HSpace(Insets.i20),
          SvgPicture.asset(iconPath),
          const HSpace(Insets.i12),
          Text(label,
              style: label == appFonts.loginViaGoogle
                  ? appCss.dmDenseBold16
                      .textColor(appColor(context).appTheme.googleTxtClr)
                  : appCss.dmDenseBold16
                      .textColor(appColor(context).appTheme.whiteColor))
        ])).inkWell(onTap: onTap);
  }
}
