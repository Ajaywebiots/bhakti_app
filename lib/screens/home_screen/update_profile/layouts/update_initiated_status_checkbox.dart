import 'package:bhakti_app/common/assets/index.dart';
import 'package:bhakti_app/common/extension/spacing.dart';
import 'package:bhakti_app/common/extension/text_style_extensions.dart';
import 'package:bhakti_app/common/extension/widget_extension.dart';
import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/providers/update_profile_provider.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../widgets/custom_title_widget.dart';

class UpdateInitiatedStatusBox extends StatelessWidget {
  const UpdateInitiatedStatusBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UpdateProfileProvider>(builder: (context,profilePvr,child) {
      return   CustomTitleWidget(
        height: 52,
        width: double.infinity,
        color: const Color(0xff541F5C).withOpacity(.20),
        radius: 8,
        title: 'Are you initiated ?',
        child: Row(children: [
          const HSpace(Insets.i16),
          SvgPicture.asset("assets/svg/Frame.svg"),
          const HSpace(Sizes.s10),
          SvgPicture.asset(eSvgAssets.line),
          const HSpace(Sizes.s22),
          InkWell(
              onTap: () {
                profilePvr.value = !profilePvr.value;
                if (profilePvr.value = true) {
                  profilePvr.valueFirst = false;
                } else {
                  profilePvr.valueFirst = true;
                }
                profilePvr.notifyListeners();
              },
              child: Container(
                  height: Sizes.s20,
                  width: Sizes.s20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                          color: const Color(0xFF541F5C),
                          width: 1.3)),
                  child: profilePvr.value == true
                      ? const Icon(Icons.check, size: 14)
                      : Container())),
          const HSpace(Sizes.s10),
          Text("Yes",
              style: appCss.dmDenseExtraBold16
                  .textColor(const Color(0xff767676))),
          const HSpace(Sizes.s10),
          InkWell(
            onTap: () {
              profilePvr.valueFirst = !profilePvr.valueFirst;
              if (profilePvr.valueFirst = true) {
                profilePvr.value = false;
              } else {
                profilePvr.value = true;
              }
              profilePvr.notifyListeners();
            },
            child: Container(
                height: Sizes.s20,
                width: Sizes.s20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                      color: const Color(0xFF541F5C),
                      width: 1.3),
                ),
                child: profilePvr.valueFirst == true
                    ? const Icon(Icons.check, size: 14)
                    : Container()),
          ),
          const HSpace(Sizes.s10),
          Text(
            "No",
            style: appCss.dmDenseExtraBold16
                .textColor(const Color(0xff767676)),
          ),
        ]),
      ).paddingSymmetric(vertical: 10);
    },);
  }
}
