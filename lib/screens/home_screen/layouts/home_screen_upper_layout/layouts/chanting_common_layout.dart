import 'package:bhakti_app/config.dart';
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
