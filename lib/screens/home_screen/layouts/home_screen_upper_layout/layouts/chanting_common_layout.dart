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
              itemCount: homeScreenPvr.chantinglist.length,
              itemBuilder: (BuildContext context, int index) {
                return CommonChantingContainer(
                    text: DateFormat('hh:mm').format(DateTime.now()),
                    chantingText: homeScreenPvr.chantinglist.isEmpty
                        ? '0'
                        : homeScreenPvr.chantinglist[index]['rounds']
                            .toString(),
                    onTap: () {
                      homeScreenPvr.onChantingCountSelect(context, index);
                    });
              },
              itemScrollController: ItemScrollController()));
    });
  }
}
