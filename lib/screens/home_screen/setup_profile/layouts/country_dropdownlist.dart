import 'package:bhakti_app/common/assets/index.dart';
import 'package:bhakti_app/common/extension/spacing.dart';
import 'package:bhakti_app/common/extension/text_style_extensions.dart';
import 'package:bhakti_app/common/extension/widget_extension.dart';
import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/providers/setup_profile_provider/setup_profile_provider.dart';
import 'package:bhakti_app/widgets/custom_title_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CountryDropDownBox extends StatelessWidget {
  const CountryDropDownBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SetUpProfileProvider>(
        builder: (context, profilePvr, child) {
      return CustomTitleWidget(
          radius: 8,
          height: 52,
          width: double.infinity,
          color: const Color(0xff541F5C).withOpacity(.20),
          title: 'Country',
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
                                  style: TextStyle(color: Color(0xff767676)))),
                          style: appCss.dmDenseExtraBold14
                              .textColor(const Color(0xff767676)),
                          isExpanded: true,
                          icon: Container(),
                          value: profilePvr.countrySelected,
                          items: profilePvr.countryItems.map((e) {
                            return DropdownMenuItem(
                                value: e["name"],
                                child: Text(e["name"],
                                    style: appCss.dmDenseExtraBold14
                                        .textColor(const Color(0xff767676))));
                          }).toList(),
                          onChanged: (value) {
                            profilePvr.countrySelected = value.toString();
                            profilePvr.notifyListeners();
                          })))
            ])),
            SvgPicture.asset(eSvgAssets.arrowUp)
                .marginSymmetric(horizontal: Insets.i20)
          ])).paddingSymmetric(vertical: 10);
    });
  }
}
