import '../config.dart';

class CommonContainerTile extends StatelessWidget {
  final Widget? child;
  final EdgeInsetsGeometry? paddingArea;

  const CommonContainerTile({super.key, this.child, this.paddingArea});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: paddingArea ?? const EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: appColor(context).appTheme.whiteColor,
            boxShadow: [
              BoxShadow(
                  color: appColor(context).appTheme.shadowClr,
                  blurRadius: 16,
                  offset: const Offset(0, 2),
                  spreadRadius: 0)
            ]),
        child: child);
  }
}
