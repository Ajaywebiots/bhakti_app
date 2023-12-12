import '../config.dart';

class CommonAppBar extends StatelessWidget {
  final String? text;
  final double? hSpace;
  final GestureTapCallback? onTap;
  final bool? isWidth;

  const CommonAppBar(
      {super.key, this.text, this.hSpace, this.onTap, this.isWidth = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading: Container(),
        backgroundColor: Colors.transparent,
        titleSpacing: 0,
        leadingWidth: Sizes.s0,
        title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          SvgPicture.asset(eSvgAssets.arrowLeft).inkWell(onTap: onTap),
          HSpace(hSpace!),
          isWidth == true
              ? SizedBox(
                  width: MediaQuery.of(context).size.width / 1.3,
                  child: Text(text!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: appCss.philosopherBold28
                          .textColor(appColor(context).appTheme.oneText)),
                )
              : Text(text!,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: appCss.philosopherBold28
                      .textColor(appColor(context).appTheme.oneText)),
        ]));
  }
}
