import 'package:bhakti_app/config.dart';

class GroupViewChantingCommonContainer extends StatelessWidget {
  final String? text, countText, svgImage;


  const GroupViewChantingCommonContainer(
      {super.key, this.text, this.countText, this.svgImage});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: appColor(context).appTheme.whiteColor),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    HSpace(Insets.i10),
                    SvgPicture.asset(svgImage!),
                    const HSpace(Insets.i6),
                    Column(children: [
                      Text(countText!,
                          style: appCss.dmDenseBold24
                              .textColor(appColor(context).appTheme.primary)),
                      Text(text!,
                          style: appCss.dmDenseMedium11
                              .textColor(appColor(context).appTheme.lightText))
                    ])
                  ])
            ]));
  }
}
