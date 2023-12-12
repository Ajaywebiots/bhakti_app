import 'package:bhakti_app/config.dart';
import '../../../../widgets/custom_title_widget.dart';

class UpdateInitiatedStatusBox extends StatelessWidget {
  const UpdateInitiatedStatusBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UpdateProfileProvider>(
        builder: (context, updateProfilePvr, child) {
      return CustomTitleWidget(
          height: Sizes.s52,
          width: double.infinity,
          color: const Color(0xff541F5C).withOpacity(.20),
          radius: 8,
          title: 'Are you initiated ?',
          child: Row(children: [
            const HSpace(Insets.i16),
            SvgPicture.asset(eSvgAssets.frame),
            const HSpace(Sizes.s10),
            SvgPicture.asset(eSvgAssets.line),
            const HSpace(Sizes.s22),
            InkWell(
                onTap: () => updateProfilePvr.yesCheckBox(),
                child: Container(
                    height: Sizes.s20,
                    width: Sizes.s20,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            color: const Color(0xFF541F5C), width: 1.3)),
                    child: updateProfilePvr.value == true
                        ? const Icon(Icons.check, size: 14)
                        : Container())),
            const HSpace(Sizes.s10),
            Text(appFonts.yes,
                style: appCss.dmDenseExtraBold16
                    .textColor(const Color(0xff767676))),
            const HSpace(Sizes.s10),
            InkWell(
                onTap: () => updateProfilePvr.noCheckBox(),
                child: Container(
                    height: Sizes.s20,
                    width: Sizes.s20,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                            color: const Color(0xFF541F5C), width: 1.3)),
                    child: updateProfilePvr.valueFirst == true
                        ? const Icon(Icons.check, size: 14)
                        : Container())),
            const HSpace(Sizes.s10),
            Text(appFonts.no,
                style: appCss.dmDenseExtraBold16
                    .textColor(const Color(0xff767676)))
          ])).paddingSymmetric(vertical: 10);
    });
  }
}
