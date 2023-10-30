import 'package:bhakti_app/common/extension/spacing.dart';
import 'package:bhakti_app/common/theme/app_css.dart';
import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/providers/home_screen_provider/home_screen_provider.dart';
import 'package:bhakti_app/screens/home_screen/layouts/common_chanting_container.dart';
import 'package:flutter/material.dart';

class ChantingCommon extends StatelessWidget {
  const ChantingCommon({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(
      builder: (BuildContext context, homeScreenPvr, child) {
        return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              CommonChantingContainer(
                  text: 'Before 6:30 am',
                  chantingText: '8',
                  onTap: () {
                    homeScreenPvr.onChantingCountSelect(context);
                  }),
              const HSpace(Insets.i10),
              CommonChantingContainer(
                  text: 'Before 8:30 am',
                  chantingText: '4',
                  onTap: () {
                    homeScreenPvr.onChantingCountSelect(context);
                  }),
              const HSpace(Insets.i10),
              CommonChantingContainer(
                  text: 'Before 10:00 am',
                  chantingText: '8',
                  onTap: () {
                    homeScreenPvr.onChantingCountSelect(context);
                  }),
              const HSpace(Insets.i10),
              CommonChantingContainer(
                  text: 'Before 10:00 am',
                  chantingText: '4',
                  onTap: () {
                    homeScreenPvr.onChantingCountSelect(context);
                  })
            ]));
      },
    );
  }
}
