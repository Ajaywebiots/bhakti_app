import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/screens/home_screen/layouts/common_regulation.dart';

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
              children: appArray.rulesList.asMap().entries.map((e) {
            return Column(children: [
              CommonRegulation(
                  index: e.key,
                  list: appArray.rulesList,
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
