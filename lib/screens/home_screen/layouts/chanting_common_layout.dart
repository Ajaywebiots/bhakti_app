import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/providers/home_screen_provider.dart';
import 'package:bhakti_app/screens/home_screen/layouts/common_chanting_container.dart';
import 'package:bhakti_app/screens/home_screen/layouts/list_model.dart';
import 'package:bhakti_app/screens/home_screen/scrollable_positioned_list/scrollable_positioned_list.dart';

class ChantingCommon extends StatelessWidget {
  const ChantingCommon({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(
        builder: (BuildContext context, homeScreenPvr, child) {
      return SizedBox(
          height: 90,
          child: ScrollablePositionedList.builder(
              scrollDirection: Axis.horizontal,
              itemCount: chantingList.length,
              itemScrollController: homeScreenPvr.itemScrollController,
              itemBuilder: (context, index) {
                return CommonChantingContainer(
                    text: chantingList[index]['time'],
                    chantingText: chantingList[index]['chantingText'],
                    onTap: () {
                      homeScreenPvr.onChantingCountSelect(context);
                    });
              }));
    });
  }
}
