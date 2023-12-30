import 'package:bhakti_app/screens/home_screen/layouts/regulation_layout.dart';
import '../../../../config.dart';
import 'layouts/association_layout.dart';
import 'layouts/book_distribution_layout.dart';
import 'layouts/book_layout.dart';
import '../notes_layout.dart';

class HomeScreenBottomLayout extends StatelessWidget {
  const HomeScreenBottomLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(
        builder: (context, homeScreenPvr, child) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CommonLeftSideText(text: appFonts.regulations),
        const VSpace(Insets.i15),
        const RegulationLayout(),
        const VSpace(Insets.i25),
        CommonLeftSideText(
            rightText: "Add Book",
            isRightText: true,
            text: appFonts.books,
            onTap: () => homeScreenPvr.bookReadingPresentlyNavigate(context)),
        homeScreenPvr.bookingLis == [] ? const VSpace(Insets.i15) : Container(),
        homeScreenPvr.bookingLis == [] ? Container() : const BookLayout(),
        const VSpace(Insets.i25),
        CommonLeftSideText(text: appFonts.association),
        const VSpace(Insets.i15),
        const AssociationLayout(),
        const VSpace(Insets.i25),
        CommonLeftSideText(text: appFonts.bookDistribution),
        const VSpace(Insets.i15),
        const BookDistributionLayout(),
        const VSpace(Insets.i25),
        CommonLeftSideText(text: appFonts.notes),
        const VSpace(Insets.i15),
        const NotesLayout()
      ]);
    });
  }
}
