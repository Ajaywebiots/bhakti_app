import '../../../../config.dart';

class CommonChantingRow extends StatelessWidget {
  final String? textOne,textTwo,countOne,countTwo;
  const CommonChantingRow({super.key, this.textOne, this.textTwo, this.countOne, this.countTwo});

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
      const HSpace(Insets.i15),
      GroupViewChantingCommonContainer(
          text: textOne,
          countText: countOne,
          svgImage: eSvgAssets.chanting),
      const HSpace(Insets.i28),
      SvgPicture.asset(eSvgAssets.verticalLine),
      const HSpace(Insets.i20),
      GroupViewChantingCommonContainer(
          text: textTwo, countText: countTwo, svgImage: eSvgAssets.chanting)
    ]);
  }
}
