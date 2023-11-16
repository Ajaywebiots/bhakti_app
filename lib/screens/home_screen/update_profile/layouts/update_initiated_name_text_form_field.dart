import 'package:bhakti_app/common/assets/index.dart';
import 'package:bhakti_app/common/extension/spacing.dart';
import 'package:bhakti_app/common/extension/widget_extension.dart';
import 'package:bhakti_app/widgets/text_common_widget.dart';
import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/providers/setup_profile_provider.dart';
import 'package:bhakti_app/widgets/custom_title_widget.dart';
import 'package:flutter_svg/svg.dart';

class UpdateInitiatedNameTextBox extends StatelessWidget {
  const UpdateInitiatedNameTextBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UpdateProfileProvider>(
        builder: (context, profilePvr, child) {
      return CustomTitleWidget(
        height: 52,
        width: double.infinity,
        color: profilePvr.initiatedNameValid == null
            ? const Color(0xff541F5C).withOpacity(.20)
            : appColor(context).appTheme.red,
        title: 'Initiated Name',
        radius: 8,
        child: TextFieldCommon(
            validator: (value) {
              if (value!.isNotEmpty) {
                profilePvr.initiatedNameValid = null;
                profilePvr.notifyListeners();
                return null;
              }
            },
            controller: profilePvr.initiatedName,
            hintText: "Initiated Name",
            prefixIcon: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const HSpace(Insets.i18),
                  SvgPicture.asset(eSvgAssets.userInitiated, height: 20),
                  const HSpace(Insets.i12),
                  SvgPicture.asset(eSvgAssets.line, height: 24, width: 24),
                  const HSpace(Insets.i20)
                ])),
      ).paddingSymmetric(vertical: 10);
    });
  }
}
