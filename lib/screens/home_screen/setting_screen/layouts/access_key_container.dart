import '../../../../config.dart';

class AccessKeyContainer extends StatelessWidget {
  final String? svgImage;

  const AccessKeyContainer({super.key, this.svgImage});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        padding: const EdgeInsets.all(8),
        width: 40,
        decoration: BoxDecoration(
            color: const Color(0x0FC35DD2),
            border: Border.all(
                color: appColor(context).appTheme.primary.withOpacity(0.20)),
            borderRadius: BorderRadius.circular(8)),
        child: SvgPicture.asset(svgImage!));
  }
}
