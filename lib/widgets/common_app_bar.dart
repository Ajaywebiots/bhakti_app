import 'dart:convert';
import 'dart:developer';
import 'package:bhakti_app/common/extension/widget_extension.dart';
import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/models/user_model.dart';
import 'package:bhakti_app/screens/home_screen/update_profile/update_profile.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bhakti_app/common/assets/index.dart';
import 'package:bhakti_app/common/extension/spacing.dart';
import 'package:bhakti_app/providers/home_screen_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommonAppBar extends StatelessWidget {
  const CommonAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(
        builder: (context, homeScreenPvr, child) {
      return AppBar(
          leading: SvgPicture.asset(eSvgAssets.menu)
              .inkWell(onTap: () => Scaffold.of(context).openDrawer()),
          leadingWidth: 30,
          centerTitle: false,
          elevation: 0,
          backgroundColor: Colors.transparent,
          titleSpacing: 10,
          title: Image.asset(eImageAssets.bhaktiLogo, height: 35),
          actions: [
            SvgPicture.asset(eSvgAssets.chat),
            const HSpace(Insets.i10),
            SvgPicture.asset(eSvgAssets.calendar, height: Sizes.s32).inkWell(
                onTap: () async {
              var results = await showCalendarDatePicker2Dialog(
                context: context,
                config: CalendarDatePicker2WithActionButtonsConfig(
                    lastDate: DateTime.now(), firstDate: DateTime(1886)),
                dialogSize: const Size(325, 400),
                dialogBackgroundColor: Colors.white,
                builder: (context, child) {
                  return Theme(
                      data: Theme.of(context).copyWith(
                          dialogTheme: DialogTheme(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0))),
                          colorScheme: ColorScheme.light(
                              primary: appColor(context).appTheme.primary,
                              onSurface: Colors.black,
                              error: Colors.red),
                          textButtonTheme: TextButtonThemeData(
                              style: TextButton.styleFrom(
                                  textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                  primary:
                                      appColor(context).appTheme.whiteColor,
                                  backgroundColor:
                                      appColor(context).appTheme.primary,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20))))),
                      child: child!);
                },
                borderRadius: BorderRadius.circular(15),
              );
              log("result :: $results");
              if (results!.isNotEmpty) {
                homeScreenPvr.notifyListeners();
              }
            }),
            const HSpace(Insets.i10),
            homeScreenPvr.userModel?.profilePictureUrl! != null
                ? Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(4),
                        color: appColor(context).appTheme.whiteColor),
                    child: Image.network(
                            homeScreenPvr.userModel!.profilePictureUrl!,
                            height: Sizes.s32)
                        .inkWell(onTap: () {
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
                    }))
                : Image.asset(eImageAssets.img, height: Sizes.s32).inkWell(
                    onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const ProfileEditScreen();
                    }));
                  })
          ]);
    });
  }
}
