import '../../../../config.dart';

class CommonChantingRow extends StatelessWidget {
  final String? textOne,textTwo,countOne,countTwo;
  const CommonChantingRow({super.key, this.textOne, this.textTwo, this.countOne, this.countTwo});

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.center, children: [

      GroupViewChantingCommonContainer(
          text: textOne,
          countText: countOne,
          svgImage: eSvgAssets.chanting),
      const HSpace(Insets.i10),
      SvgPicture.asset(eSvgAssets.verticalLine),
      GroupViewChantingCommonContainer(
          text: textTwo, countText: countTwo, svgImage: eSvgAssets.chanting)
    ]);
  }
}
