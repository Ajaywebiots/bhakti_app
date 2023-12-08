import '../config.dart';

class CommonTrailingLayout extends StatelessWidget {
  final GestureTapCallback? onTap;
  final String? svg;
  const CommonTrailingLayout({super.key,this.svg,this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                  color: appColor(context).appTheme.shadowClr,
                  blurRadius: 16,
                  offset: const Offset(0, 4),
                  spreadRadius: 0)
            ],
            color: appColor(context).appTheme.whiteColor),
        width: 34,
        height: 35,
        child: SvgPicture.asset(svg!))
        .inkWell(onTap: onTap);
  }
}
