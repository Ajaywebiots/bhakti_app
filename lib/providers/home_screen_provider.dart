import 'dart:convert';
import 'dart:developer';
import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/screens/auth_screen/login_auth_screen/login_auth_screen.dart';
import 'package:bhakti_app/screens/home_screen/book_read_presently_screen/book_read_presently_screen.dart';
import 'package:bhakti_app/screens/home_screen/layouts/common_dialog_box.dart';
import 'package:bhakti_app/services/sadhana_api_data.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../customise/scrollable_positioned_list/scrollable_positioned_list.dart';
import '../models/user_model.dart';

class HomeScreenProvider extends ChangeNotifier {
  bookReadingPresentlyNavigate(context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return BookReadPresentlyScreen(
        bookReadingList: bookingLis,
      );
    }));
  }

  final GlobalKey<ScaffoldState> key = GlobalKey();

  List bookingLis = [];

  //call this function in init
  onReadyHome() async {
    final remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(minutes: 5),
    ));
    await remoteConfig.fetchAndActivate();
    // String technicalIssueStatus = remoteConfig.getString('books');
    List mapValues = json.decode(remoteConfig.getValue("books").asString());

    bookingLis = mapValues;
    print("mapValues $bookingLis");
    notifyListeners();
  }

  filePick() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg', 'png'],
    );

    if (result != null) {
      PlatformFile file = result.files.first;

      print('File name: ${file.name}');
      print('File size: ${formatBytes(file.size)}');
      print('File extension: ${file.extension}');
      print('File path: ${file.path}');
    } else {}
  }

  String formatBytes(int bytes) {
    int KB = 1024;
    int MB = 1024 * KB;

    if (bytes >= MB) {
      double sizeInMB = bytes / MB;
      return '${sizeInMB.toStringAsFixed(2)} MB';
    } else if (bytes >= KB) {
      double sizeInKB = bytes / KB;
      return '${sizeInKB.toStringAsFixed(2)} KB';
    } else {
      return '$bytes bytes';
    }
  }

  int index = 0;
  bool onLastPage = false;
  bool onChange = false;
  bool onLength = false;
  String sleepAt = "";
  String wakeupTime = "";
  String mangalaArtiTime = "";
  int smallBooks = 0;
  int mediumBooks = 0;
  int largeBooks = 0;
  dynamic slot1, slot2, slot3, slot4;
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
                    sleepTimeHour = value;
                    ctrl.notifyListeners();
                    log("sleepTimeHour :$sleepTimeHour");
                    setState;
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

  DateTime selectedDate = DateTime.now();

  onCalendarChange(context) async {
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
                          primary: appColor(context).appTheme.whiteColor,
                          backgroundColor: appColor(context).appTheme.primary,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))))),
              child: child!);
        },
        borderRadius: BorderRadius.circular(15));
    log("result :: $results");
    if (results != null && results.isNotEmpty) {
      selectedDate = results[0]!;
      onCalendarDateChange(selectedDate);
      notifyListeners();
      log("Selected date: $selectedDate");
    }
  }

  onCalendarDateChange(date) {
    selectedDate = date;

    notifyListeners();
    log("onCalendarDateChange ::: $selectedDate");
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

  onExpansionChanged() {
    notifyListeners();
    onChange = !onChange;
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
      notifyListeners();
      clearSharedPreferences();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const LoginAuthScreen();
      }));
    });
  }

  onReady(context) async {
    // getValue();
    onReadyHome();
    getData(context);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await Future.delayed(DurationsClass.s1);
    userModel =
        UserModel.fromJson(json.decode(preferences.getString(session.user)!));

    notifyListeners();
  }

  String chantingRounds = "";
  String chantingRounds1 = "";
  String chantingRounds2 = "";
  String chantingRounds3 = "";

  List chantinglist = [];
  List regulations = [];

  getData(context) async {
    showLoading(context);
    notifyListeners();
    try {
      Map<String, String> body = {
        "from_date": "2023-11-14",
        "to_date": "2023-11-20"
      };
      await apiServices
          .postApi(api.getSadhana, body, isToken: true)
          .then((value) async {
        hideLoading(context);
        notifyListeners();
        log('From Date: ${value.isSuccess!}');
        if (value.isSuccess!) {
          Sadhana sadhana = Sadhana.fromJson(value.data);
          var sleepData = sadhana.sadhanaData[0]['data']['sleep'];
          var mangalaData = sadhana.sadhanaData[0]['data']['mangala_arti'];
          var sandhyaData = sadhana.sadhanaData[0]['data']['sandhya_arti'];
          var dateFormat = DateFormat("h:mm a");
          var regulations = sadhana.sadhanaData[0]['data']['regulations'];
          List book_data = sadhana.sadhanaData[0]['data']['book_reading'];
          var book_distribution =
              sadhana.sadhanaData[0]['data']['book_distribution'];
          DateTime slept_time =
              DateFormat("hh:mm").parse(sleepData['slept_time']);
          DateTime wakeup_timeData =
              DateFormat("hh:mm").parse(sleepData['wakeup_time']);
          DateTime mangalaArtiData =
              DateFormat("hh:mm").parse(mangalaData['time']);
          bool sandhyaArtiData = sandhyaData['sandhya_arti'];

          sleepAt = dateFormat.format(slept_time);
          wakeupTime = dateFormat.format(wakeup_timeData);
          mangalaArtiTime = dateFormat.format(mangalaArtiData);
          isSandhyaArti = sandhyaArtiData;

          for (int i = 1; i <= 4; i++) {
            chantinglist.add(sadhana.sadhanaData[0]['data']['chanting']
                ['slot_$i']['rounds']);
          }
          appArray.rulesList = [
            {'rule': 'No meat eating', 'isOn': regulations['no_meat_eating']},
            {'rule': 'No intoxication', 'isOn': regulations['no_intoxication']},
            {'rule': 'No illicit sex', 'isOn': regulations['no_illicit_sex']},
            {'rule': 'No gambling', 'isOn': regulations['no_gambling']},
            {'rule': 'Only prasadam', 'isOn': regulations['only_prasadam']}
          ];

          for (int i = 0; i < book_data.length; i++) {
            log("book_data[i] : ${book_data[i]}");
            appArray.bookList.add(book_data[i]);
          }

          smallBooks = book_distribution['small_books'];
          mediumBooks = book_distribution['medium_books'];
          largeBooks = book_distribution['big_books'];

          log('Book Read: ${appArray.bookList}');
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(value.message)));
        }
      });
    } catch (e) {
      hideLoading(context);
      notifyListeners();
      log("CATCH : $e");
    }
  }
}
