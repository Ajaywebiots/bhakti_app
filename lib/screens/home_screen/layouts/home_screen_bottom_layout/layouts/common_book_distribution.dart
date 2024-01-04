import '../../../../../config.dart';

class CommonBookDistribution extends StatelessWidget {
  final String? textTwo;
  final TextEditingController? controller;

  const CommonBookDistribution({super.key, this.textTwo, this.controller});

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
                      spreadRadius: 0)
                ],
                color: appColor(context).appTheme.whiteColor),
            height: Sizes.s86,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                    const HSpace(Insets.i8),
                    SvgPicture.asset(eSvgAssets.bookDistribution),
                    const HSpace(Insets.i8),
                    Container(
                        height: 35,
                        width: 40,
                        alignment: Alignment.center,
                        child: TextField(
                            controller: controller,
                            maxLength: 2,
                            keyboardType: TextInputType.number,
                            maxLines: 1,
                            style: appCss.dmDenseBold24.copyWith(
                                color: appColor(context).appTheme.primary,
                                overflow: TextOverflow.clip),
                            decoration: const InputDecoration(
                                border: InputBorder.none, counterText: '')))
                  ]),
                  Text(textTwo!,
                          style: appCss.dmDenseMedium12
                              .textColor(appColor(context).appTheme.lightText))
                      .paddingOnly(left: 8)
                ])));
  }
}
