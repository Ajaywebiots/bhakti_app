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
              child: SingleChildScrollView(scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    CommonChantingContainer(
                        text: DateFormat('hh:mm').format(DateTime.now()),
                        chantingText: homeScreenPvr.chantinglist.isEmpty
                            ? '0'
                            : homeScreenPvr.chantinglist[0]['rounds'].toString(),
                        onTap: () {
                          homeScreenPvr.onChantingCountSelect(context,0);
                        }),
                    CommonChantingContainer(
                        text: DateFormat('hh:mm').format(DateTime.now()),
                        chantingText: homeScreenPvr.chantinglist.isEmpty
                            ? '0'
                            : homeScreenPvr.chantinglist[1]['rounds'].toString(),
                        onTap: () {
                          homeScreenPvr.onChantingCountSelect(context,1);
                        }),
                    CommonChantingContainer(
                        text: DateFormat('hh:mm').format(DateTime.now()),
                        chantingText: homeScreenPvr.chantinglist.isEmpty
                            ? '0'
                            : homeScreenPvr.chantinglist[2]['rounds'].toString(),
                        onTap: () {
                          homeScreenPvr.onChantingCountSelect(context,2);
                        }),
                    CommonChantingContainer(
                        text: DateFormat('hh:mm').format(DateTime.now()),
                        chantingText: homeScreenPvr.chantinglist.isEmpty
                            ? '0'
                            : homeScreenPvr.chantinglist[3]['rounds'].toString(),
                        onTap: () {
                          homeScreenPvr.onChantingCountSelect(context,3);
                        })
                  ])
              ));
        });
  }
}