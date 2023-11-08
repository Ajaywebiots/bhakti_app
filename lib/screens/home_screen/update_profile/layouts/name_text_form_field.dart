import 'package:bhakti_app/common/assets/index.dart';
import 'package:bhakti_app/common/extension/spacing.dart';
import 'package:bhakti_app/common/extension/widget_extension.dart';
import 'package:bhakti_app/providers/update_profile_provider.dart';
import 'package:bhakti_app/widgets/text_common_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../config.dart';
import '../../../../widgets/custom_title_widget.dart';

class UpdateNameTextBox extends StatelessWidget {
  const UpdateNameTextBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UpdateProfileProvider>(builder: (context,profilePvr,child) {
        return CustomTitleWidget(
          height: 52,
          color: profilePvr.nameValid == null
              ? const Color(0xff541F5C).withOpacity(.20)
              : appColor(context).appTheme.red,
          width: double.infinity,
          title: 'Name',
          radius: 8,
          child: TextFieldCommon(
              validator: (value) {
                if (value!.isEmpty) {

                  profilePvr.nameValid = "Enter Correct Name";
                  profilePvr.notifyListeners();
                  return "Enter Correct Name";
                } else {
                  profilePvr.nameValid = null;
                  profilePvr.notifyListeners();
                  return null;
                }
              },
              hintText: "Name",
              errorText: profilePvr.nameValid,
              controller: profilePvr.name,
              prefixIcon: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const HSpace(Sizes.s20),
                    SvgPicture.asset(eSvgAssets.user, height: 20),
                    const HSpace(Sizes.s10),
                    SvgPicture.asset(eSvgAssets.line,
                        height: 24, width: 24),
                    const HSpace(Sizes.s20),
                  ])),
        ).paddingSymmetric(vertical: 10);
      }
    );
  }
}
