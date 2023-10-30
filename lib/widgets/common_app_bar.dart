import 'package:bhakti_app/common/assets/index.dart';
import 'package:bhakti_app/common/extension/spacing.dart';
import 'package:bhakti_app/common/theme/app_css.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommonAppBar extends StatelessWidget {
  const CommonAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading: SvgPicture.asset(eSvgAssets.menu),
        leadingWidth: 30,
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        titleSpacing: 10,
        title:
        Image.asset(eImageAssets.bhaktiLogo, height: 35),
        actions: [
          SvgPicture.asset(eSvgAssets.chat),
          const HSpace(Insets.i10),
          SvgPicture.asset(eSvgAssets.calendar,
              height: Sizes.s32),
          const HSpace(Insets.i10),
          Image.asset(eImageAssets.img, height: Sizes.s32)
        ]);
  }
}
