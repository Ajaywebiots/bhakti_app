import 'layouts/notes_layout.dart';
import 'layouts/regulation_layout.dart';
import 'package:bhakti_app/config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bhakti_app/common/assets/index.dart';
import 'package:bhakti_app/widgets/common_app_bar.dart';
import 'package:bhakti_app/common/extension/spacing.dart';
import 'package:bhakti_app/common/extension/widget_extension.dart';
import 'package:bhakti_app/common/extension/text_style_extensions.dart';
import 'package:bhakti_app/screens/home_screen/layouts/book_layout.dart';
import 'package:bhakti_app/screens/home_screen/layouts/sleep_layout.dart';
import 'package:bhakti_app/screens/home_screen/layouts/week_calendar.dart';
import 'package:bhakti_app/screens/home_screen/layouts/wokship_layout.dart';
import 'package:bhakti_app/screens/home_screen/layouts/common_bottom_bar.dart';
import 'package:bhakti_app/screens/home_screen/layouts/association_layout.dart';
import 'package:bhakti_app/screens/home_screen/layouts/chanting_common_layout.dart';
import 'package:bhakti_app/screens/home_screen/layouts/bookdistribution_layout.dart';
import 'package:bhakti_app/providers/home_screen_provider/home_screen_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(
        builder: (context1, homeScreenPvr, child) {
      return SafeArea(
          child: Scaffold(
              extendBody: true,
              bottomNavigationBar: const CommonBottomBar(),
              body: Stack(alignment: Alignment.center, children: [
                Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(eImageAssets.splashBg)))),
                SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      const CommonAppBar(),
                      const VSpace(Insets.i23),
                      const WeekCalendar(),
                      const VSpace(Insets.i15),
                      Text(appFonts.sleep, style: appCss.philosopherBold18),
                      const VSpace(Insets.i15),
                      const SleepLayout(),
                      const VSpace(Insets.i25),
                      Text(appFonts.worship, style: appCss.philosopherBold18),
                      const VSpace(Insets.i15),
                      const WorshipLayout(),
                      const VSpace(Insets.i25),
                      Text(appFonts.chanting, style: appCss.philosopherBold18),
                      const VSpace(Insets.i15),
                      const ChantingCommon(),
                      const VSpace(Insets.i25),
                      Text(appFonts.regulations,
                          style: appCss.philosopherBold18),
                      const VSpace(Insets.i15),
                      const RegulationLayout(),
                      const VSpace(Insets.i25),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(appFonts.books,
                                textAlign: TextAlign.start,
                                style: appCss.philosopherBold18),
                            Row(children: [
                              SvgPicture.asset(eSvgAssets.add),
                              Text('Add Book',
                                  style: appCss.dmDenseMedium14.textColor(
                                      appColor(context).appTheme.primary))
                            ])
                          ]),
                      const VSpace(Insets.i15),
                      const BookLayout(),
                      const VSpace(Insets.i25),
                      Text(appFonts.association,
                          style: appCss.philosopherBold18),
                      const VSpace(Insets.i15),
                      const AssociationLayout(),
                      const VSpace(Insets.i25),
                      Text(appFonts.bookDistribution,
                          style: appCss.philosopherBold18),
                      const VSpace(Insets.i15),
                      const BookDistributionLayout(),
                      const VSpace(Insets.i25),
                      Text(appFonts.notes, style: appCss.philosopherBold18),
                      const VSpace(Insets.i15),
                      const NotesLayout(),
                      const VSpace(Insets.i25)
                    ]).paddingOnly(
                        top: MediaQuery.of(context).size.height * 0.01,
                        bottom: MediaQuery.of(context).size.height * 0.07,
                        left: Insets.i20,
                        right: Insets.i20))
              ])));
    });
  }
}
