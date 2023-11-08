import 'package:bhakti_app/common/extension/spacing.dart';
import 'package:bhakti_app/common/extension/widget_extension.dart';
import 'package:bhakti_app/providers/update_profile_provider.dart';
import 'package:bhakti_app/widgets/text_common_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../common/assets/index.dart';
import '../../../../common/theme/app_css.dart';
import '../../../../config.dart';
import '../../../../widgets/custom_title_widget.dart';

class UpdateStateTextFieldBox extends StatelessWidget {
  const UpdateStateTextFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UpdateProfileProvider>(builder: (context,profilePvr,child) {
        return CustomTitleWidget(
          height: 52,
          width: double.infinity,
          title: 'State',
          radius: 8,
          color: profilePvr.stateValid == null
              ? const Color(0xff541F5C).withOpacity(.20)
              : appColor(context).appTheme.red,
          child: TextFieldCommon(
              validator: (value) {
                if (value!.isEmpty) {
                  profilePvr.stateValid = 'Enter a State Name!';
                  profilePvr.notifyListeners();
                  return 'Enter a State Name!';
                } else {
                  profilePvr.stateValid = null;
                  profilePvr.notifyListeners();
                  return null;
                }
              },
              hintText: "State",
              prefixIcon: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const HSpace(Sizes.s14),
                    SvgPicture.asset(eSvgAssets.map, height: 25),
                    const HSpace(Sizes.s12),
                    SvgPicture.asset(eSvgAssets.line, height: 24, width: 24),
                    const HSpace(Sizes.s20),
                  ])),
        ).paddingSymmetric(vertical: 10);
      },
    );
  }
}
