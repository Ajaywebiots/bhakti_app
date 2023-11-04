// import 'package:bhakti_app/common/extension/spacing.dart';
// import 'package:bhakti_app/common/extension/text_style_extensions.dart';
// import 'package:bhakti_app/config.dart';
// import 'package:bhakti_app/providers/home_screen_provider/home_screen_provider.dart';
// import 'package:bhakti_app/screens/home_screen/layouts/list_model.dart';
// import 'package:bhakti_app/screens/home_screen/scrollable_positioned_list/scrollable_positioned_list.dart';
//
// class CommonBook extends StatelessWidget {
//   const CommonBook({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<HomeScreenProvider>(
//         builder: (BuildContext context, homeScreenPvr, child) {
//         return Container(height: 180,width: 115,
//           child: ScrollablePositionedList.builder(
//             itemBuilder: (context, index) {
//               return Container(
//               margin: const EdgeInsets.only(right: 15),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(6),
//                   boxShadow: [
//                     BoxShadow(
//                         color: appColor(context).appTheme.shadowClr,
//                         blurRadius: 12,
//                         offset: const Offset(0, 2),
//                         spreadRadius: 0)
//                   ],
//                   color: appColor(context).appTheme.whiteColor),
//               height: Sizes.s179,
//               width: Sizes.s115,
//               child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     ClipRRect(
//                         borderRadius: BorderRadius.circular(2),
//                         child: Image.asset(bookList[index]['book'],
//                             height: Sizes.s132)),
//                     const VSpace(Insets.i6),
//                     Text(bookList[index]['time'],
//                         style: appCss.dmDenseMedium16
//                             .textColor(appColor(context).appTheme.primary))
//                   ]));
//             }, itemCount: bookList.length,
//           ),
//         );
//       }
//     );
//   }
// }
