import 'package:bhakti_app/common/extension/text_style_extensions.dart';
import 'package:bhakti_app/common/extension/widget_extension.dart';
import 'package:bhakti_app/providers/home_screen_provider.dart';
import 'package:bhakti_app/screens/home_screen/layouts/regulation_layout.dart';
import 'package:flutter_svg/svg.dart';
import '../../../common/assets/index.dart';
import '../../../common/extension/spacing.dart';
import '../../../config.dart';
import 'association_layout.dart';
import 'book_distribution_layout.dart';
import 'book_layout.dart';
import 'list_model.dart';

class HomeScreenBottomLayout extends StatelessWidget {
  const HomeScreenBottomLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(builder: (context, homeScreenPvr, child) {

      return Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        Text(appFonts.regulations, style: appCss.philosopherBold18),
        const VSpace(Insets.i15),
        const RegulationLayout(),
        const VSpace(Insets.i25),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(appFonts.books,
              textAlign: TextAlign.start, style: appCss.philosopherBold18),
          Row(children: [
            SvgPicture.asset(eSvgAssets.add),
            Text('Add Book',
                style: appCss.dmDenseMedium14
                    .textColor(appColor(context).appTheme.primary))
          ]).inkWell(
              onTap: () => homeScreenPvr.bookReadingPresentlyNavigate(context))
        ]),
        bookReadingList == [] ? const VSpace(Insets.i15) : Container(),
        bookReadingList == [] ? const BookLayout() : Container(),
        const VSpace(Insets.i25),
        Text(appFonts.association, style: appCss.philosopherBold18),
        const VSpace(Insets.i15),
        const AssociationLayout(),
        const VSpace(Insets.i25),
        Text(appFonts.bookDistribution, style: appCss.philosopherBold18),
        const VSpace(Insets.i15),
        const BookDistributionLayout(),
        const VSpace(Insets.i25),
        Text(appFonts.notes, style: appCss.philosopherBold18)
      ]);
    });
  }
}
