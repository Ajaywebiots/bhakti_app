import '../../../../config.dart';

class CommonContainerDesign extends StatelessWidget {
  final Widget? child;
  const CommonContainerDesign({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: appColor(context).appTheme.whiteColor,
            boxShadow: [
              BoxShadow(
                  color: appColor(context).appTheme.shadowClr,
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                  spreadRadius: 0)
            ]),
        child: child);
  }
}
