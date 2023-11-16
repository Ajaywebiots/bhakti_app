
import 'package:bhakti_app/common/assets/index.dart';
import 'package:bhakti_app/common/extension/spacing.dart';
import 'package:bhakti_app/common/extension/text_style_extensions.dart';
import 'package:bhakti_app/common/extension/widget_extension.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../config.dart';
import '../../../../providers/update_profile_provider.dart';
import '../../../../widgets/custom_title_widget.dart';

class UpdateSpiritualMasterBox extends StatelessWidget {
  const UpdateSpiritualMasterBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UpdateProfileProvider>(builder: (context,profilePvr,child) {
        return CustomTitleWidget(
          radius: 8,
          height: 52,
          width: double.infinity,
          color: const Color(0xff541F5C).withOpacity(.20),
          title: 'Spiritual Master',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                const HSpace(Insets.i15),
                SvgPicture.asset("assets/svg/profile.svg", height: 25),
                const HSpace(Insets.i8),
                SvgPicture.asset(eSvgAssets.line),
                const HSpace(Insets.i19),
                DropdownButton(
                  underline: Container(),
                  alignment: Alignment.topLeft,
                  elevation: 0,
                  borderRadius: BorderRadius.circular(5),
                  value: profilePvr.spiritualSelectedItems,
                  icon: Container(),
                  items: profilePvr.items.map((String items) {
                    return DropdownMenuItem(
                        value: items,
                        child: Text(
                          items,
                          style: appCss.dmDenseMedium14.textColor(
                              appColor(context).appTheme.lightText),
                        ));
                  }).toList(),
                  onChanged: (newValue) {
                    profilePvr.spiritualSelectedItems = newValue!;
                    profilePvr.notifyListeners();
                  },
                ),
              ]),
              SvgPicture.asset(eSvgAssets.arrowDown)
                  .marginSymmetric(horizontal: Insets.i20)
            ],
          ),
        ).paddingSymmetric(vertical: 10);
      },
    );
  }
}
