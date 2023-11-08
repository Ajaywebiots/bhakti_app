import 'package:bhakti_app/common/extension/spacing.dart';
import 'package:bhakti_app/common/extension/widget_extension.dart';
import 'package:bhakti_app/providers/update_profile_provider.dart';
import 'package:bhakti_app/widgets/text_common_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../common/assets/index.dart';
import '../../../../config.dart';
import '../../../../widgets/custom_title_widget.dart';

class UpdatePhoneNumberTextBox extends StatelessWidget {
  const UpdatePhoneNumberTextBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UpdateProfileProvider>(builder: (context,profilePvr,child) {
        return CustomTitleWidget(
          height: 52,
          width: double.infinity,
          color: profilePvr.phoneNumberValid == null
              ? const Color(0xff541F5C).withOpacity(.20)
              : appColor(context).appTheme.red,
          title: 'Phone Number',
          radius: 8,
          child: TextFieldCommon(
              maxLength: 10,
              validator: (value) {
                if (value!.isEmpty) {
                  profilePvr.phoneNumberValid = 'Enter a Valid Phone Number!';
                  profilePvr.notifyListeners();
                  return 'Enter a Phone Number!';
                } else {
                  profilePvr.phoneNumberValid = null;
                  profilePvr.notifyListeners();
                  return null;
                }
              },
              keyboardType: TextInputType.number,
              hintText: "Phone Number",
              controller: profilePvr.phoneNum,
              prefixIcon: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const HSpace(Sizes.s20),
                    SvgPicture.asset(eSvgAssets.call1, height: 20),
                    const HSpace(Sizes.s10),
                    SvgPicture.asset(eSvgAssets.line, height: 24, width: 24),
                    const HSpace(Sizes.s20),
                  ])),
        ).paddingSymmetric(vertical: 10);
      },
    );
  }
}
