import 'package:bhakti_app/config.dart';
import 'common_book_distribution.dart';

class BookDistributionLayout extends StatelessWidget {
  const BookDistributionLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(
        builder: (context, homeProviderPvr, child) {
      return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        CommonBookDistribution(
            textOne: homeProviderPvr.smallBooks.toString(),
            textTwo: appFonts.smallBooks),
        const HSpace(Insets.i10),
        CommonBookDistribution(
            textOne: homeProviderPvr.mediumBooks.toString(),
            textTwo: appFonts.mediumBooks),
        const HSpace(Insets.i10),
        CommonBookDistribution(
            textOne: homeProviderPvr.largeBooks.toString(),
            textTwo: appFonts.largeBooks)
      ]);
    });
  }
}
