import 'dart:developer';
import 'package:bhakti_app/config.dart';

class BookLayout extends StatelessWidget {
  const BookLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(
        builder: (context, homeScreenPvr, child) {
      log("bookList :${appArray.bookList}");
      return SizedBox(
          height: Sizes.s180,
          child: ScrollablePositionedList.builder(
              scrollDirection: Axis.horizontal,
              itemCount: appArray.bookList.length,
              itemBuilder: (context, index) {
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
                                  homeScreenPvr.bookingLis[index]['image_src']
                                      .toString(),
                                  height: Sizes.s132)),
                          const VSpace(Insets.i6),
                          Text(
                              appArray.bookList[index]['reading_time'] == null
                                  ? 'N/A'
                                  : appArray.bookList[index]['reading_time']
                                      .toString(),
                              style: appCss.dmDenseMedium16.textColor(
                                  appColor(context).appTheme.primary))
                        ])).inkWell(onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CommonDialog(
                            text: homeScreenPvr.bookingLis[index]['book_name'],
                            text1: 'Hour',
                            text2: 'Minutes',
                            onHourChange: (value) {
                              log("value :: $value");
                              appArray.bookList[index] == 0
                                  ? homeScreenPvr.bhagavadGitaHour = value
                                  : appArray.bookList[index] == 1
                                      ? homeScreenPvr.srilaHour = value
                                      : homeScreenPvr.selfRealizationHour =
                                          value;
                            },
                            onMinChange: (value) {
                              appArray.bookList[index] == 0
                                  ? homeScreenPvr.bhagavadGitaMin = value
                                  : appArray.bookList[index] == 1
                                      ? homeScreenPvr.srilaMin = value
                                      : homeScreenPvr.selfRealizationMin =
                                          value;
                            });
                      });
                });
              }));
    });
  }
}
