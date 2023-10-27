// import 'dart:developer';
// import 'package:bhakti_app/common/assets/index.dart';
// import 'package:bhakti_app/common/extension/spacing.dart';
// import 'package:bhakti_app/config.dart';
// import 'package:bhakti_app/screens/home_screen/layouts/common_regulation.dart';
// import 'package:bhakti_app/screens/home_screen/layouts/regulation_list_model.dart';
// import 'package:flutter_svg/svg.dart';
//
// class RegulationCommonLayout extends StatelessWidget {
//   const RegulationCommonLayout({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         padding: const EdgeInsets.all(15),
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(8),
//             color: appColor(context).appTheme.whiteColor,
//             boxShadow: [
//               BoxShadow(
//                   color: appColor(context).appTheme.shadowClr,
//                   blurRadius: 8,
//                   offset: const Offset(0, 4),
//                   spreadRadius: 0)
//             ]),
//         child: Column(
//             children: rulesList.asMap().entries.map((e) {
//               log("conValue = ::: ${e.key}");
//               return Column(children: [
//                 CommonRegulation(
//                     status: e.value['isOn'],
//                     text: e.value['rule'],
//                     onToggle: (val) {
//                       setState(() {
//                         e.value['isOn'] = val;
//                       });
//                     }),
//                 const VSpace(Insets.i10),
//                 e.key == 4
//                     ? Container()
//                     : SvgPicture.asset(eSvgAssets.lineRuler),
//                 e.key == 4 ? Container() : const VSpace(Insets.i10)
//               ]);
//             }).toList()));
//   }
// }
