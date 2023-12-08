import '../config.dart';

class CommonAppBar extends StatelessWidget {
  final String? text;
  final double? hSpace;
  final GestureTapCallback? onTap;
  const CommonAppBar({super.key, this.text, this.hSpace, this.onTap});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading: Container(),
        backgroundColor: Colors.transparent,
        titleSpacing: 0,
        leadingWidth: Sizes.s0,
        title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset("assets/svg/arrowLeft.svg")
                  .inkWell(onTap:onTap),
              HSpace(hSpace!),
              Text(text!,
                  style: appCss.philosopherBold28
                      .textColor(appColor(context)
                      .appTheme
                      .oneText))
            ]));
  }
}
