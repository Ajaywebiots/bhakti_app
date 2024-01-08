import 'dart:developer';
import 'package:bhakti_app/config.dart';

import '../../common_wheel_slider.dart';

class BookLayout extends StatelessWidget {
  const BookLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(
        builder: (context, homeScreenPvr, child) {
      List<dynamic> filteredBooks =
          homeScreenPvr.bookingLis.where((configBookList) {
        return appArray.bookList.any((selectedBook) =>
            selectedBook['book_id'] == configBookList['book_id']);
      }).toList();
      List reverseList = List.from(appArray.bookList.reversed);
      log("bookList : ${appArray.bookList}");
      log("filteredBooks $filteredBooks");
      return SizedBox(
          height: Sizes.s180,
          child: ScrollablePositionedList.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filteredBooks.length,
              itemBuilder: (context, index) {
                log("appArray.bookList ${appArray.bookList[index]['reading_time']}");
                return Container(
                    margin: const EdgeInsets.only(right: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                              color: appColor(context).appTheme.shadowClr,
                              blurRadius: 12,
                              offset: const Offset(0, 2),
                              spreadRadius: 0)
                        ],
                        color: appColor(context).appTheme.whiteColor),
                    height: Sizes.s179,
                    width: Sizes.s115,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(2),
                              child: Image.network(
                                  filteredBooks[index]['image_src'].toString(),
                                  height: Sizes.s132)),
                          const VSpace(Insets.i6),
                          Text(reverseList[index]['reading_time'] ?? 'N/A',
                              style: appCss.dmDenseMedium16.textColor(
                                  appColor(context).appTheme.primary))
                        ])).inkWell(onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                            insetPadding:
                                const EdgeInsets.symmetric(horizontal: 20),
                            backgroundColor: Colors.transparent,
                            alignment: Alignment.center,
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white),
                                width: double.infinity,
                                height: Sizes.s420,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                              child: Text(filteredBooks[index]['book_name'],
                                                  style: appCss
                                                      .philosopherBold18
                                                      .textColor(
                                                          appColor(context)
                                                              .appTheme
                                                              .primary)))
                                          .paddingSymmetric(vertical: 20),
                                      Text(
                                          textAlign: TextAlign.start,
                                          'Hour',
                                          style: appCss.dmDenseMedium17
                                              .textColor(appColor(context)
                                                  .appTheme
                                                  .primary)),
                                      const VSpace(Insets.i15),
                                      CommonWheelSlider(
                                          interval: 1,
                                          totalCount: homeScreenPvr
                                              .bookReadingTotalHour,
                                          initValue:
                                              homeScreenPvr.bookReadingInitHour,
                                          currentIndex: homeScreenPvr
                                              .bookReadingCurrentHour,
                                          onValueChanged: (val) => homeScreenPvr
                                              .onBookReadingHour(val,index)),
                                      const VSpace(Insets.i15),
                                      Text(
                                          textAlign: TextAlign.start,
                                          'Minutes',
                                          style: appCss.dmDenseMedium17
                                              .textColor(appColor(context)
                                                  .appTheme
                                                  .primary)),
                                      const VSpace(Insets.i15),
                                      CommonWheelSlider(
                                          interval: 5,
                                          totalCount: homeScreenPvr
                                              .bookReadingTotalMinute,
                                          initValue: homeScreenPvr
                                              .bookReadingInitMinute,
                                          currentIndex: homeScreenPvr
                                              .bookReadingCurrentMinute,
                                          onValueChanged: (val) => homeScreenPvr
                                              .onBookReadingMinute(val,index)),
                                      const VSpace(Insets.i50),
                                      CommonSelectionButton(
                                          onTapOne: () =>
                                              Navigator.pop(context),
                                          onTapTwo: () {
                                            Navigator.pop(context);
                                            homeScreenPvr.updateData(context);
                                          })
                                    ]).paddingAll(15)));
                      });
                });
              }));
    });
  }
}
