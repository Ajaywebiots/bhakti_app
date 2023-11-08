import 'dart:developer';

import 'package:bhakti_app/common/assets/index.dart';
import 'package:bhakti_app/common/extension/spacing.dart';
import 'package:bhakti_app/common/extension/text_style_extensions.dart';
import 'package:bhakti_app/common/extension/widget_extension.dart';
import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/providers/setup_profile_provider.dart';
import 'package:bhakti_app/widgets/custom_title_widget.dart';
import 'package:bhakti_app/widgets/stateful_wrapper.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CountryDropDownBox extends StatelessWidget {
  const CountryDropDownBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SetUpUpdateProfileProvider>(
        builder: (context1, profilePvr, child) {
      return CustomTitleWidget(
          radius: 8,
          height: 52,
          width: double.infinity,
          color: const Color(0xff541F5C).withOpacity(.20),
          title: 'Country',
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Row(children: [
                  const HSpace(Insets.i16),
                  SvgPicture.asset(eSvgAssets.global),
                  const HSpace(Insets.i10),
                  SvgPicture.asset(eSvgAssets.line, height: 24, width: 24),
                  const HSpace(Insets.i20),
                  Expanded(
                      child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                              hint: const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Select Country",
                                      style: TextStyle(
                                          color: Color(0xff767676)))),
                              style: appCss.dmDenseMedium14.textColor(
                                  appColor(context).appTheme.lightText),
                              isExpanded: true,
                              icon: Container(),
                              value: profilePvr.countrySelected,
                              items: profilePvr.countryItems.map((e) {
                                return DropdownMenuItem(
                                    value: e,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(e["name"],
                                              style: appCss
                                                  .dmDenseExtraBold16
                                                  .textColor(const Color(
                                                      0xff767676))),
                                          Text(e["code"],
                                              style: appCss
                                                  .dmDenseExtraBold16
                                                  .textColor(const Color(
                                                      0xff767676)))
                                        ]));
                              }).toList(),
                              onChanged: (value) {
                                log("value :$value");
                                profilePvr.countrySelected = value;
                                profilePvr.notifyListeners();
                              })))
                ])),
                SvgPicture.asset(eSvgAssets.arrowDown)
                    .marginSymmetric(horizontal: Insets.i20)
              ])).paddingSymmetric(vertical: 10);
    });
  }
}
