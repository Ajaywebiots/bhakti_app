import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/widgets/common_app_bar.dart';
import 'package:bhakti_app/widgets/common_bg_image.dart';
import 'layouts/book_reading_presently_layout.dart';

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
                    text: 'Books Reading Presently',
                    onTap: () => Navigator.pop(context),
                    hSpace: Insets.i12),
                const VSpace(Insets.i25),
                Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: const Color(0x0FC35DD2),
                        border: Border.all(
                            color: appColor(context)
                                .appTheme
                                .primary
                                .withOpacity(0.20)),
                        borderRadius: BorderRadius.circular(8)),
                    child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Search Here',
                            hintStyle: appCss.dmDenseMedium12,
                            prefixIcon: Row(children: [
                              SvgPicture.asset("assets/svg/search-normal.svg"),
                              const HSpace(Insets.i10),
                              SvgPicture.asset(eSvgAssets.line)
                            ]).paddingAll(10),
                            disabledBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(AppRadius.r8)),
                                borderSide: BorderSide.none),
                            focusedBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(AppRadius.r8)),
                                borderSide: BorderSide.none),
                            enabledBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(AppRadius.r8)),
                                borderSide: BorderSide.none),
                            border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(AppRadius.r8)),
                                borderSide: BorderSide.none)),
                        onSubmitted: (String value) {
                          debugPrint(value);
                        })),
                const VSpace(Insets.i15),
                Row(children: [
                  Text("Book list",
                      style: appCss.philosopherBold18
                          .textColor(appColor(context).appTheme.oneText))
                ]),
                const VSpace(Insets.i15),
                Container(
                    alignment: Alignment.topCenter,
                    decoration: BoxDecoration(
                        color: appColor(context).appTheme.whiteColor,
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                              color: appColor(context).appTheme.shadowClr,
                              blurRadius: 16,
                              offset: const Offset(0, 4),
                              spreadRadius: 0)
                        ]),
                    child: ListView.builder(
                        itemCount: homeScreenPvr.bookingLis.length,
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(15),
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return BookReadingPresentlyLayout(
                              data: homeScreenPvr.bookingLis[index],
                              index: index);
                        }))
              ]).paddingSymmetric(horizontal: 20))));
    });
  }
}
