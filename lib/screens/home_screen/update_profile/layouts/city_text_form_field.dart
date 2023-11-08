import 'package:bhakti_app/common/assets/index.dart';
import 'package:bhakti_app/common/extension/widget_extension.dart';
import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/widgets/custom_title_widget.dart';
import 'package:bhakti_app/widgets/text_common_widget.dart';
import 'package:flutter_svg/svg.dart';

import 'package:bhakti_app/common/extension/spacing.dart';
import 'package:bhakti_app/providers/update_profile_provider.dart';

class UpdateCityTextFieldBox extends StatelessWidget {
  const UpdateCityTextFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UpdateProfileProvider>(
        builder: (context, profilePvr, child) {
      return CustomTitleWidget(
          height: 52,
          width: double.infinity,
          color: profilePvr.cityValid == null
              ? const Color(0xff541F5C).withOpacity(.20)
              : appColor(context).appTheme.red,
          title: 'City',
          radius: 8,
          child: TextFieldCommon(
              validator: (value) {
                if (value!.isEmpty) {
                  profilePvr.cityValid = 'Enter A City Name!';
                  profilePvr.notifyListeners();
                  return 'Enter a City Name!';
                } else {
                  profilePvr.cityValid = null;
                  profilePvr.notifyListeners();
                  return null;
                }
              },
              hintText: "City",
              prefixIcon: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const HSpace(Sizes.s14),
                    SvgPicture.asset(eSvgAssets.location, height: 25),
                    const HSpace(Sizes.s12),
                    SvgPicture.asset(eSvgAssets.line, height: 24, width: 24),
                    const HSpace(Sizes.s20)
                  ]))).paddingSymmetric(vertical: 10);
    });
  }
}
