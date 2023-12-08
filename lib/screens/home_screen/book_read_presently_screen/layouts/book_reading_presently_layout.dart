import '../../../../config.dart';
import '../../../../widgets/common_selection_button.dart';

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
                child: Image.network(data['image_src'],
                    fit: BoxFit.cover, height: 70, width: 50)),
            const HSpace(Insets.i12),
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
                  child: appArray.bookList
                          .where((element) =>
                              element['book_id'] == data['book_id'])
                          .isNotEmpty
                      ? SvgPicture.asset("assets/svg/delete.svg").inkWell(
                          onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    child: SizedBox(
                                        height: 175,
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Center(
                                                  child: Text("Delete Book",
                                                      style: appCss
                                                          .philosopherBold18
                                                          .textColor(
                                                              appColor(context)
                                                                  .appTheme
                                                                  .primary))),
                                              const VSpace(Insets.i10),
                                              Center(
                                                  child: Text(
                                                      "Are You Sure You Want to Delete This Book?",
                                                      style: appCss
                                                          .dmDenseRegular14
                                                          .textColor(
                                                              appColor(context)
                                                                  .appTheme
                                                                  .rulesClr))),
                                              Center(
                                                  child: Text(
                                                      style: appCss
                                                          .dmDenseRegular14
                                                          .textColor(
                                                              appColor(context)
                                                                  .appTheme
                                                                  .rulesClr),
                                                      "This Action Can’t Be Undone.")),
                                              const VSpace(Insets.i25),
                                              CommonSelectionButton(
                                                  textTwo: appFonts.delete,
                                                  onTapOne: () =>
                                                      Navigator.pop(context),
                                                  onTapTwo: () =>
                                                      Navigator.pop(context))
                                            ])));
                              });
                        })
                      : SvgPicture.asset(eSvgAssets.add))
              .inkWell(onTap: () {
            if (!appArray.bookList.contains(data)) {
              appArray.bookList.add(data);
            }
            homeScreenPvr.notifyListeners();
          })
        ]),
        index == homeScreenPvr.bookingLis.length - 1
            ? Container()
            : const VSpace(Insets.i10),
        index == homeScreenPvr.bookingLis.length - 1
            ? Container()
            : SvgPicture.asset(eSvgAssets.lineRuler),
        index == homeScreenPvr.bookingLis.length - 1
            ? Container()
            : const VSpace(Insets.i10)
      ]);
    });
  }
}
