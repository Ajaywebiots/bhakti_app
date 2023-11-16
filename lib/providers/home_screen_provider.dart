import 'dart:convert';
import 'dart:developer';

import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/screens/auth_screen/login_auth_screen/login_auth_screen.dart';
import 'package:bhakti_app/screens/home_screen/layouts/common_dialog_box.dart';
import 'package:bhakti_app/screens/home_screen/scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';

class HomeScreenProvider extends ChangeNotifier {
  int index = 0;
  bool onLastPage = false;
  bool onChange = false;
  bool onLength = false;
  int sleepTimeHour = 0;
  int sleepTimeMin = 0;
  int sandhyaArtiMin = 0;
  int sandhyaArtiHour = 0;
  int bhagavadGitaHour = 0;
  int srilaHour = 0;
  int selfRealizationHour = 0;
  int selfRealizationMin = 0;
  int srilaMin = 0;
  int bhagavadGitaMin = 0;
  int hearingHour = 0;
  int hearingMin = 0;
  int chantingHour = 0;
  int chantingMin = 0;
  int preachingHour = 0;
  int preachingMin = 0;
  int countRounds = 0;
  UserModel? userModel;
  int qualityRating = 0;
  int wokeUpTimeHour = 0;
  int wokeUpTimeMin = 0;
  bool isSandhyaArti = false;
  ScrollController scrollController = ScrollController();
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemScrollController itemScrollController1 = ItemScrollController();
  TextEditingController dob = TextEditingController();

  onSleepTimeSelect(context) {
    showDialog(
        context: context,
        builder: (BuildContext context1) {
          return StatefulBuilder(builder: (context, setState) {
            return Consumer<HomeScreenProvider>(
                builder: (context, ctrl, child) {
              return CommonDialog(
                  text: 'Sleep Time',
                  text1: 'Hour',
                  text2: 'Minutes',
                  onHourChange: (value) {
                    // sleepTimeHour = value;
                    // ctrl.notifyListeners();
                    log("sleepTimeHour :$sleepTimeHour");
                    // setState;
                  },
                  onMinChange: (value) {
                    sleepTimeMin = value;
                    notifyListeners();
                  });
            });
          });
        });
  }

  void clearSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    notifyListeners();
  }

  onWokeUpTimeSelect(context) {
    showDialog(
        context: context,
        builder: (BuildContext context1) {
          return CommonDialog(
              text: 'WokeUp Time',
              text1: 'Hour',
              text2: 'Minutes',
              onHourChange: (value) {
                wokeUpTimeHour = value;
                notifyListeners();
              },
              onMinChange: (value) {
                wokeUpTimeMin = value;
                notifyListeners();
              });
        });
  }

  onChantingCountSelect(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CommonDialog(
              text: 'Chanting',
              text1: 'Count of Rounds',
              text2: 'Chanting Quality Rating',
              onHourChange: (value) {
                countRounds = value;
                notifyListeners();
              },
              onMinChange: (value) {
                qualityRating = value;
                notifyListeners();
              });
        });
  }

  var selectedDate = DateTime.now();
  onCalendarDateChange(date) {
    notifyListeners();
    selectedDate = date;
    notifyListeners();
    log("selected date ::: $selectedDate");
  }


  onSandhyaArtiSelect(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context2, setState) {
            return Consumer<HomeScreenProvider>(
                builder: (context1, ctrl, child) {
              return CommonDialog(
                  text: 'Sandhya Arti',
                  text1: 'Hour',
                  text2: 'Minutes',
                  onHourChange: (value) {
                    ctrl.sandhyaArtiHour = value;
                    ctrl.notifyListeners();
                  },
                  onMinChange: (value) {
                    ctrl.sandhyaArtiMin = value;
                    ctrl.notifyListeners();
                  });
            });
          });
        });
  }

  onManglaArtiSelect(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CommonDialog(
              text: 'Mangala Arti',
              text1: 'Hour',
              text2: 'Minutes',
              onHourChange: (value) {
                bhagavadGitaHour = value;
                notifyListeners();
              },
              onMinChange: (value) {
                bhagavadGitaMin = value;
                notifyListeners();
              });
        });
  }

  onBhagvadGitaSelect(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CommonDialog(
              text: 'Bhagavadgita',
              text1: 'Hour',
              text2: 'Minutes',
              onHourChange: (value) {
                bhagavadGitaHour = value;
                notifyListeners();
              },
              onMinChange: (value) {
                bhagavadGitaMin = value;
                notifyListeners();
              });
        });
  }

  onHearingSelect(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CommonDialog(
              text: 'Hearing',
              text1: 'Hour',
              text2: 'Minutes',
              onHourChange: (value) {
                hearingHour = value;
                notifyListeners();
              },
              onMinChange: (value) {
                hearingMin = value;
                notifyListeners();
              });
        });
  }

  onPreachingSelect(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CommonDialog(
              text: 'Preaching',
              text1: 'Hour',
              text2: 'Minutes',
              onHourChange: (value) {
                preachingHour = value;
                notifyListeners();
              },
              onMinChange: (value) {
                preachingMin = value;
                notifyListeners();
              });
        });
  }

  onChantSelect(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CommonDialog(
              text: 'Chanting',
              text1: 'Hour',
              text2: 'Minutes',
              onHourChange: (value) {
                chantingHour = value;
                notifyListeners();
              },
              onMinChange: (value) {
                chantingMin = value;
                notifyListeners();
              });
        });
  }

  onSignOutClick(context) async {
    await FirebaseAuth.instance.signOut().then((value) {
      clearSharedPreferences();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const LoginAuthScreen();
      }));
    });
  }

  onReady(context) async {
   SharedPreferences
    preferences = await SharedPreferences.getInstance();

//Map user = json.decode(preferences!.getString(session.user)!);
    await Future.delayed(Durations.s1);
    userModel =
        UserModel.fromJson(json.decode(preferences!.getString(session.user)!));

    notifyListeners();
  }
}
