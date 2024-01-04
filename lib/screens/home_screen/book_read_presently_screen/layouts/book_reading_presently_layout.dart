// import '../../../../config.dart';
//
// class BookReadingPresentlyLayout extends StatelessWidget {
//   final dynamic data;
//   final int? index;
//
//   const BookReadingPresentlyLayout({super.key, this.data, this.index});
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<HomeScreenProvider>(
//         builder: (context, homeScreenPvr, child) {
//       return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
//         Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//           Row(children: [
//             ClipRRect(
//                 borderRadius: BorderRadius.circular(4),
//                 child: Image.network(data['image_src'],
//                     fit: BoxFit.cover, height: 70, width: 50)),
//             const HSpace(Insets.i12),
//             Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//               SizedBox(
//                   width: MediaQuery.of(context).size.width / 2,
//                   child: Text(data['book_name'],
//                       overflow: TextOverflow.ellipsis,
//                       style: appCss.dmDenseMedium16
//                           .textColor(appColor(context).appTheme.rulesClr))),
//               SizedBox(
//                   width: MediaQuery.of(context).size.width / 2,
//                   child: Text(data['book_name'],
//                       overflow: TextOverflow.fade,
//                       style: appCss.dmDenseRegular12
//                           .textColor(appColor(context).appTheme.lightText)))
//             ])
//           ]),
//           Container(
//                   padding: const EdgeInsets.all(6),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(6),
//                       boxShadow: [
//                         BoxShadow(
//                             color: appColor(context).appTheme.shadowClr,
//                             blurRadius: 16,
//                             offset: const Offset(0, 4),
//                             spreadRadius: 0)
//                       ],
//                       color: appColor(context).appTheme.whiteColor),
//                   width: 34,
//                   height: 35,
//                   child: appArray.bookList.any(
//                           (element) => element['book_id'] == data['book_id'])
//                       ? SvgPicture.asset(eSvgAssets.delete).inkWell(
//                           onTap: () => homeScreenPvr.deleteData(context))
//                       : SvgPicture.asset(eSvgAssets.add))
//               .inkWell(onTap: () {
//             if (!appArray.bookList.contains(data)) {
//               appArray.bookList.add(data);
//             }
//             homeScreenPvr.notifyListeners();
//           })
//         ]),
//         index == homeScreenPvr.bookingLis.length - 1
//             ? Container()
//             : const VSpace(Insets.i10),
//         index == homeScreenPvr.bookingLis.length - 1
//             ? Container()
//             : SvgPicture.asset(eSvgAssets.lineRuler),
//         index == homeScreenPvr.bookingLis.length - 1
//             ? Container()
//             : const VSpace(Insets.i10)
//       ]);
//     });
//   }
// }


import 'dart:developer';

import '../../../../config.dart';

class BookReadingPresentlyLayout extends StatelessWidget {
  final dynamic data;
  final int? index;

  const BookReadingPresentlyLayout({super.key, this.data, this.index});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(
        builder: (context, homeScreenPvr, child) {
          return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.network(
                data['image_src'],
                fit: BoxFit.cover,
                height: 70,
                width: 50,
              ),
            ),
            const SizedBox(width: 12),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Text(data['book_name'],
                      overflow: TextOverflow.ellipsis,
                      style: appCss.dmDenseMedium16
                          .textColor(appColor(context).appTheme.rulesClr))),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Text(data['book_name'],
                      overflow: TextOverflow.fade,
                      style: appCss.dmDenseRegular12
                          .textColor(appColor(context).appTheme.lightText)))
            ])
          ]),
          Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                            color: appColor(context).appTheme.shadowClr,
                            blurRadius: 16,
                            offset: const Offset(0, 4),
                            spreadRadius: 0)
                      ],
                      color: appColor(context).appTheme.whiteColor),
                  width: 34,
                  height: 35,
                  child: appArray.bookList.any(
                          (element) => element['book_id'] == data['book_id'])
                      ? SvgPicture.asset(eSvgAssets.delete).inkWell(
                          onTap: () => homeScreenPvr.deleteData(context))
                      : SvgPicture.asset(eSvgAssets.add))
              .inkWell(onTap: () {

            if (!appArray.bookList
                .any((element) => element['book_id'] == data['book_id'])) {
              appArray.bookList.add(data);
              homeScreenPvr.notifyListeners();
            }
          })
        ]),
        if (index == homeScreenPvr.bookingLis.length - 1)
          Container()
        else
          const SizedBox(height: 10),
        if (index == homeScreenPvr.bookingLis.length - 1)
          Container()
        else
          SvgPicture.asset(eSvgAssets.lineRuler),
        if (index == homeScreenPvr.bookingLis.length - 1)
          Container()
        else
          const SizedBox(height: 10)
      ]);
    });
  }
}
