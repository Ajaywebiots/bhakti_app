import 'package:bhakti_app/config.dart';

class BookReadPresentlyScreen extends StatelessWidget {
  final List? bookReadingList;

  const BookReadPresentlyScreen({super.key, this.bookReadingList});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(
        builder: (context, homeScreenPvr, child) {
      return Scaffold(
          extendBodyBehindAppBar: true,
          extendBody: true,
          body: CommonBgImage(
              widget: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                CommonAppBar(
                    isWidth: true,
                    text: appFonts.booksReadingPresently,
                    onTap: () => Navigator.pop(context),
                    hSpace: Insets.i12),
                const VSpace(Insets.i25),
                CommonTextField(
                    prefixIcon: Row(children: [
                      SvgPicture.asset(eSvgAssets.searchNormal)
                          .paddingOnly(right: 10, left: 10),
                      SvgPicture.asset(eSvgAssets.line).paddingOnly(right: 10)
                    ]),
                    height: 50,
                    controller: homeScreenPvr.searchHere,
                    hintText: appFonts.searchHere),
                const VSpace(Insets.i15),
                CommonLeftSideText(text: appFonts.bookList),
                const VSpace(Insets.i15),
                Container(
                    alignment: Alignment.topCenter,
                    decoration: BoxDecoration(
                        color: appColor(context).appTheme.whiteColor,
                        borderRadius: BorderRadius.circular(Insets.i6),
                        boxShadow: [
                          BoxShadow(
                              color: appColor(context).appTheme.shadowClr,
                              blurRadius: Insets.i16,
                              offset: const Offset(0, 4),
                              spreadRadius: 0)
                        ]),
                    child: ListView.builder(
                        itemCount: homeScreenPvr.bookingLis.length,
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(Insets.i15),
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return BookReadingPresentlyLayout(
                              data: homeScreenPvr.bookingLis[index],
                              index: index);
                        }))
              ]).paddingSymmetric(horizontal: Insets.i20))));
    });
  }
}
