import 'package:bhakti_app/common/assets/index.dart';
import 'package:bhakti_app/common/extension/spacing.dart';
import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/providers/home_screen_provider.dart';
import 'package:bhakti_app/screens/home_screen/layouts/common_regulation.dart';
import 'package:bhakti_app/screens/home_screen/layouts/list_model.dart';
import 'package:flutter_svg/svg.dart';

class RegulationLayout extends StatelessWidget {
  const RegulationLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(
        builder: (context, homeScreenPvr, child) {
      return Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: appColor(context).appTheme.whiteColor,
              boxShadow: [
                BoxShadow(
                    color: appColor(context).appTheme.shadowClr,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                    spreadRadius: 0)
              ]),
          child: Column(
              children: rulesList.asMap().entries.map((e) {
            return Column(children: [
              CommonRegulation(
                  index: e.key,
                  list: rulesList,
                  isRegulation: true,
                  status: e.value['isOn'],
                  text: e.value['rule'],
                  onToggle: (val) {
                    homeScreenPvr.notifyListeners();
                    e.value['isOn'] = val;
                  })
            ]);
          }).toList()));
    });
  }
}
