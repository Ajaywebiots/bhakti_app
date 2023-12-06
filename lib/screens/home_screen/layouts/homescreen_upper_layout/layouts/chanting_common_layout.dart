import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/providers/home_screen_provider.dart';
import 'package:bhakti_app/screens/home_screen/layouts/homescreen_upper_layout/layouts/common_chanting_container.dart';
import 'package:bhakti_app/screens/home_screen/scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:intl/intl.dart';

class ChantingCommon extends StatelessWidget {
  const ChantingCommon({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(
        builder: (BuildContext context, homeScreenPvr, child) {
      return SizedBox(
          height: Sizes.s90,
          child: ScrollablePositionedList.builder(
              scrollDirection: Axis.horizontal,
              itemCount: homeScreenPvr.chantinglist.isEmpty ? appArray.chantingList.length :  homeScreenPvr.chantinglist.length,
              itemScrollController: homeScreenPvr.itemScrollController,
              itemBuilder: (context, index) {
                return CommonChantingContainer(
                    text: DateFormat('hh:mm').format(DateTime.now()),
                    chantingText:  homeScreenPvr.chantinglist.isEmpty ? appArray.chantingList[index].toString() : homeScreenPvr.chantinglist[index].toString(),
                    onTap: () {
                      homeScreenPvr.onChantingCountSelect(context);
                    });
              }));
    });
  }
}
