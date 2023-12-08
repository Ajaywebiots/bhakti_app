import '../../../../../config.dart';

class CommonBookDistribution extends StatelessWidget {
  final String? textOne,textTwo;

  const CommonBookDistribution({super.key,  this.textOne, this.textTwo});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: appColor(context).appTheme.shadowClr,
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                  spreadRadius: 0,
                )
              ],
              color: appColor(context).appTheme.whiteColor,
            ),
            height: Sizes.s86,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                    const HSpace(Insets.i8),
                    SvgPicture.asset(eSvgAssets.bookDistribution),
                    const HSpace(Insets.i8),
                    Text(textOne!,
                        style: appCss.dmDenseBold24
                            .textColor(appColor(context).appTheme.primary))
                  ]),
                  Text(textTwo!,
                    style: appCss.dmDenseMedium12
                        .textColor(appColor(context).appTheme.lightText),
                  ).paddingOnly(left: 8)
                ])));
  }
}
