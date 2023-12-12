import 'dart:convert';
import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/models/user_model.dart';
import 'package:bhakti_app/screens/home_screen/update_profile/update_profile.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(
        builder: (context, homeScreenPvr, child) {
      return AppBar(
          automaticallyImplyLeading: false,
          leading: SvgPicture.asset(eSvgAssets.menu)
                .inkWell(onTap: () => homeScreenPvr.key.currentState!.openDrawer()),
          leadingWidth: 30,
          centerTitle: false,
          elevation: 0,
          backgroundColor: Colors.transparent,
          titleSpacing: 10,
          title: Image.asset(eImageAssets.bhaktiLogo, height: Sizes.s35),
          actions: [
            SvgPicture.asset(eSvgAssets.chat),
            const HSpace(Insets.i10),
            SvgPicture.asset(eSvgAssets.calendar, height: Sizes.s32)
                .inkWell(onTap: () => homeScreenPvr.onCalendarChange(context)),
            const HSpace(Insets.i10),
            homeScreenPvr.userModel != null &&
                    homeScreenPvr.userModel?.profilePictureUrl != null
                /*  ? Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                alignment: Alignment.center,
                                image: NetworkImage(
                                  homeScreenPvr.userModel!.profilePictureUrl!,
                                )),
                            borderRadius: BorderRadius.circular(4),
                            color: appColor(context).appTheme.whiteColor))*/
                ? CachedNetworkImage(
                    imageUrl: homeScreenPvr.userModel!.profilePictureUrl!,
                    errorWidget: (context, url, error) => Container(
                        height: Sizes.s32,
                        width: Sizes.s32,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                alignment: Alignment.center,
                                image: AssetImage(eImageAssets.img)),
                            borderRadius: BorderRadius.circular(4),
                            color: appColor(context).appTheme.whiteColor)),
                    placeholder: (context, url) => const CircularProgressIndicator(),
                    imageBuilder: (context, imageProvider) => Container(
                        height: Sizes.s32,
                        width: Sizes.s32,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                alignment: Alignment.center,
                                image: imageProvider),
                            borderRadius: BorderRadius.circular(4),
                            color: appColor(context).appTheme.whiteColor)),
                  ).inkWell(onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const ProfileEditScreen();
                    })).then((value) async {
                      SharedPreferences pref =
                          await SharedPreferences.getInstance();
                      homeScreenPvr.userModel = UserModel.fromJson(
                          json.decode(pref.getString(session.user)!));
                      homeScreenPvr.notifyListeners();
                    });
                  })
                : Container(
                        height: Sizes.s32,
                        width: Sizes.s32,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                alignment: Alignment.center,
                                image: AssetImage(eImageAssets.img)),
                            borderRadius: BorderRadius.circular(Insets.i4),
                            color: appColor(context).appTheme.whiteColor))
                    .inkWell(onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const ProfileEditScreen();
                    }));
                  })
          ]);
    });
  }
}
