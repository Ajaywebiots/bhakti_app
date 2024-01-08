import 'dart:developer';
import 'dart:io';
import 'package:bhakti_app/screens/home_screen/layouts/common_wheel_slider.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:intl/intl.dart';
import 'package:vibration/vibration.dart';
import '../config.dart';

class HomeScreenProvider extends ChangeNotifier {
  bookReadingPresentlyNavigate(context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return BookReadPresentlyScreen(bookReadingList: bookingLis);
    }));
  }

  regulationToggle(val, e, context) {
    notifyListeners();
    e.value['isOn'] = val;
    updateData(context);
    notifyListeners();
  }

  onListNavigate() {
    // Navigator.push(context, MaterialPageRoute(builder: (context) {
    //   return const MyDocumentScreen();
    // }));
    // key.currentState!.closeDrawer();
  }

  int totalCount = 100;
  int initValue = 0;
  int currentValue = 0;

  sleepSlider(val) {
    notifyListeners();
    currentValue = val;
    notifyListeners();
    log("$currentValue");
  }

  int selectedIndex = 0;

  Widget yourBackgroundWidget() {
    return Container(
      color: Colors.blue[100],
    );
  }

  onTapDrawer(index) {
    isExpanded = false;
    selectedIndex = index;
    notifyListeners();
  }

  final dynamic sleepTotalHour = 24;
  final dynamic sleepInitHour = 0;

  dynamic sleepCurrentHour = 0;
  final dynamic sleepTotalMinute = 11;
  final dynamic sleepInitMinute = 0;

  dynamic sleepCurrentMinute = 0;

  String sleepAt24 = '';

  onSleepAtHour(val) {
    // 24-hour format
    int hour24 = val % 24;
    sleepAt24 =
        "${hour24.toString().padLeft(2, '0')}:${sleepCurrentMinute.toString().padLeft(2, '0')}:00";
    log("Updated sleepAt (24-hour with seconds): $sleepAt24");

    // 12-hour format
    int hour12 = val % 12;
    String period = (val < 12) ? 'AM' : 'PM';
    sleepAt =
        "${hour12.toString().padLeft(2, '0')}:${sleepCurrentMinute.toString().padLeft(2, '0')} $period";

    log("Updated sleepAt (12-hour): $sleepAt");

    sleepCurrentHour = val;
    notifyListeners();
    Vibration.vibrate(
      duration: 10,
      amplitude: 128,
      pattern: [100, 100],
      intensities: [1, 255],
    );
  }

  onWokeUpHour(val) {
    // 24-hour format with seconds
    int hour24 = val % 24;
    wakeupTime24 =
        "${hour24.toString().padLeft(2, '0')}:${wokeUpCurrentMinute.toString().padLeft(2, '0')}:00";
    print("Updated wakeupTime (24-hour with seconds): $wakeupTime24");

    // 12-hour format
    int hour12 = val % 12;
    String period = (val < 12) ? 'AM' : 'PM';
    wakeupTime =
        "${hour12.toString().padLeft(2, '0')}:${wokeUpCurrentMinute.toString().padLeft(2, '0')} $period";
    print("Updated wakeupTime (12-hour): $wakeupTime");

    wokeUpCurrentHour = val;
    notifyListeners();
    Vibration.vibrate(
      duration: 10,
      amplitude: 128,
      pattern: [100, 100],
      intensities: [1, 255],
    );
  }

  onSleepAtMinute(val) {
    // 24-hour format
    int hour24 = sleepCurrentHour % 24;
    sleepAt24 =
        "${hour24.toString().padLeft(2, '0')}:${sleepCurrentHour.toString().padLeft(2, '0')}:00";
    print("Updated sleepAt (24-hour with seconds): $sleepAt24");
    // 12-hour format
    int hour12 = sleepCurrentHour % 12;
    String period = (sleepCurrentHour < 12) ? 'AM' : 'PM';
    sleepAt =
        "${hour12.toString().padLeft(2, '0')}:${sleepCurrentHour.toString().padLeft(2, '0')} $period";
    print("Updated sleepAt (12-hour): $sleepAt");

    notifyListeners();
    print("Updated sleepAt: $sleepAt");
    sleepCurrentMinute = val;
    notifyListeners();

    Vibration.vibrate(
      duration: 10,
      amplitude: 128,
      pattern: [100, 100],
      intensities: [1, 255],
    );
  }

  final dynamic wokeUpTotalHour = 24;
  final dynamic wokeUpInitHour = 0;
  dynamic wokeUpCurrentHour = 0;

  final dynamic wokeUpTotalMinute = 11;
  final dynamic wokeUpInitMinute = 0;
  dynamic wokeUpCurrentMinute = 0;

  String wakeupTime24 = "";

  onWokeUpMinute(val) {
    int hour12 = wokeUpCurrentHour % 12;
    String period = (wokeUpCurrentHour < 12) ? 'AM' : 'PM';
    notifyListeners();
    wakeupTime =
        "${hour12.toString().padLeft(2, '0')}:${val.toString().padLeft(2, '0')} $period";
    print("Updated wakeupTime: $wakeupTime");
    notifyListeners();
    wokeUpCurrentMinute = val;

    Vibration.vibrate(
      duration: 10,
      amplitude: 128,
      pattern: [100, 100],
      intensities: [1, 255],
    );

    wakeupTime24 =
        "${wokeUpCurrentHour.toString().padLeft(2, '0')}:${val.toString().padLeft(2, '0')}:00";
    print("Updated wakeupTime (24-hour): $wakeupTime24");
  }

  bool isExpanded = false;

  final colors = [Colors.amber[400], Colors.yellow[400]];
  final stops = [0.0, 0.9];

  onExpandTileTap() {
    isExpanded = !isExpanded;
    notifyListeners();
  }

  List<bool> selectedList = List.generate(3, (index) => false);

  List<bool> get selectedLists => selectedList;

  void drawerExpansionList(index) {
    selectedList[index] = !selectedList[index];
    notifyListeners();
  }

  TextEditingController searchHere = TextEditingController();
  TextEditingController smallBookCtrl = TextEditingController();
  TextEditingController mediumBookCtrl = TextEditingController();
  TextEditingController largeBookCtrl = TextEditingController();

  final GlobalKey<ScaffoldState> key = GlobalKey();

  List bookingLis = [];

  //call this function in init
  onReadyHome() async {
    final remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: const Duration(minutes: 5)));
    await remoteConfig.fetchAndActivate();

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

      log('File name: ${file.name}');
      log('File size: ${formatBytes(file.size)}');
      log('File extension: ${file.extension}');
      log('File path: ${file.path}');
    } else {}
  }

  deleteData(context) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: SizedBox(
                  height: 175,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                            child: Text(appFonts.deleteBook,
                                style: appCss.philosopherBold18.textColor(
                                    appColor(context).appTheme.primary))),
                        const VSpace(Insets.i10),
                        Center(
                            child: Text(appFonts.areYouSureYouWantToDelete,
                                style: appCss.dmDenseRegular14.textColor(
                                    appColor(context).appTheme.rulesClr))),
                        Center(
                            child: Text(
                                style: appCss.dmDenseRegular14.textColor(
                                    appColor(context).appTheme.rulesClr),
                                appFonts.thisActionCant)),
                        const VSpace(Insets.i25),
                        CommonSelectionButton(
                            textTwo: appFonts.delete,
                            onTapOne: () => Navigator.pop(context),
                            onTapTwo: () => Navigator.pop(context))
                      ])));
        });
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
  TextEditingController notesCtrl = TextEditingController();

  onSleepTimeSelect(context) {
    showDialog(
        context: context,
        builder: (BuildContext context1) {
          return StatefulBuilder(builder: (context, setState) {
            return Consumer<HomeScreenProvider>(
                builder: (context, ctrl, child) {
              return Dialog(
                  insetPadding: const EdgeInsets.symmetric(horizontal: 20),
                  backgroundColor: Colors.transparent,
                  alignment: Alignment.center,
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white),
                      width: double.infinity,
                      height: Sizes.s420,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                                    child: Text('Sleep Time',
                                        style: appCss.philosopherBold18
                                            .textColor(appColor(context)
                                                .appTheme
                                                .primary)))
                                .paddingSymmetric(vertical: 20),
                            Text(
                                textAlign: TextAlign.start,
                                'Hour',
                                style: appCss.dmDenseMedium17.textColor(
                                    appColor(context).appTheme.primary)),
                            const VSpace(Insets.i15),
                            CommonWheelSlider(
                                interval: 1,
                                totalCount: sleepTotalHour,
                                initValue: sleepInitHour,
                                currentIndex: sleepCurrentHour,
                                onValueChanged: (val) => onSleepAtHour(val)),
                            const VSpace(Insets.i15),
                            Text(
                                textAlign: TextAlign.start,
                                'Minutes',
                                style: appCss.dmDenseMedium17.textColor(
                                    appColor(context).appTheme.primary)),
                            const VSpace(Insets.i15),
                            CommonWheelSlider(
                                interval: 5,
                                totalCount: sleepTotalMinute,
                                initValue: sleepInitMinute,
                                currentIndex: sleepCurrentMinute,
                                onValueChanged: (val) => onSleepAtMinute(val)),
                            const VSpace(Insets.i50),
                            CommonSelectionButton(
                                onTapOne: () => Navigator.pop(context),
                                onTapTwo: () {
                                  Navigator.pop(context);
                                  updateData(context);
                                })
                          ]).paddingAll(15)));
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
          return Dialog(
              insetPadding: const EdgeInsets.symmetric(horizontal: 20),
              backgroundColor: Colors.transparent,
              alignment: Alignment.center,
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white),
                  width: double.infinity,
                  height: Sizes.s420,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                                child: Text('WokeUp Time',
                                    style: appCss.philosopherBold18.textColor(
                                        appColor(context).appTheme.primary)))
                            .paddingSymmetric(vertical: 20),
                        Text(
                            textAlign: TextAlign.start,
                            'Hour',
                            style: appCss.dmDenseMedium17
                                .textColor(appColor(context).appTheme.primary)),
                        const VSpace(Insets.i15),
                        CommonWheelSlider(
                            interval: 1,
                            totalCount: wokeUpTotalHour,
                            initValue: wokeUpInitHour,
                            currentIndex: wokeUpCurrentHour,
                            onValueChanged: (val) => onWokeUpHour(val)),
                        const VSpace(Insets.i15),
                        Text(
                            textAlign: TextAlign.start,
                            'Minutes',
                            style: appCss.dmDenseMedium17
                                .textColor(appColor(context).appTheme.primary)),
                        const VSpace(Insets.i15),
                        CommonWheelSlider(
                            interval: 5,
                            totalCount: wokeUpTotalMinute,
                            initValue: wokeUpInitMinute,
                            currentIndex: wokeUpCurrentMinute,
                            onValueChanged: (val) => onWokeUpMinute(val)),
                        const VSpace(Insets.i50),
                        CommonSelectionButton(
                            onTapOne: () => Navigator.pop(context),
                            onTapTwo: () {
                              updateData(context);
                              Navigator.pop(context);
                            })
                      ]).paddingAll(15)));
        });
  }

  final dynamic chantingCountTotalRounds = 100;
  final dynamic chantingCountInitRounds = 0;
  dynamic chantingCountCurrentRounds = 0;

  final dynamic chantingCountTotalQuality = 100;
  final dynamic chantingCountInitQuality = 0;
  dynamic chantingCountCurrentQuality = 0;

  onChantingCountRounds(val, index) {
    notifyListeners();
    chantingCountCurrentRounds = val;

    chantinglist[index]["rounds"] = val;
    notifyListeners();
    Vibration.vibrate(
        duration: 10,
        amplitude: 128,
        pattern: [100, 100],
        intensities: [1, 255]);
  }

  onChantingCountQuality(val, index) {
    notifyListeners();
    chantingCountCurrentQuality = val;
    chantinglist[index]["quality"] = val;
    notifyListeners();
    Vibration.vibrate(
        duration: 10,
        amplitude: 128,
        pattern: [100, 100],
        intensities: [1, 255]);
  }

  onChantingCountSelect(context, index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              insetPadding: const EdgeInsets.symmetric(horizontal: 20),
              backgroundColor: Colors.transparent,
              alignment: Alignment.center,
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white),
                  width: double.infinity,
                  height: Sizes.s420,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                                child: Text('Chanting',
                                    style: appCss.philosopherBold18.textColor(
                                        appColor(context).appTheme.primary)))
                            .paddingSymmetric(vertical: 20),
                        Text(
                            textAlign: TextAlign.start,
                            'Count of Rounds',
                            style: appCss.dmDenseMedium17
                                .textColor(appColor(context).appTheme.primary)),
                        const VSpace(Insets.i15),
                        CommonWheelSlider(
                            interval: 1,
                            totalCount: chantingCountTotalRounds,
                            initValue: chantingCountInitRounds,
                            currentIndex: chantingCountCurrentRounds,
                            onValueChanged: (val) =>
                                onChantingCountRounds(val, index)),
                        const VSpace(Insets.i10),
                        Text(
                            textAlign: TextAlign.start,
                            'Chanting Quality Rating',
                            style: appCss.dmDenseMedium17
                                .textColor(appColor(context).appTheme.primary)),
                        const VSpace(Insets.i15),
                        CommonWheelSlider(
                            interval: 1,
                            totalCount: chantingCountTotalQuality,
                            initValue: chantingCountInitQuality,
                            currentIndex: chantingCountCurrentQuality,
                            onValueChanged: (val) =>
                                onChantingCountQuality(val, index)),
                        const VSpace(Insets.i10),
                        const VSpace(Insets.i20),
                        const VSpace(Insets.i10),
                        CommonSelectionButton(
                            onTapOne: () => Navigator.pop(context),
                            onTapTwo: () {
                              updateData(context);
                              Navigator.pop(context);
                            })
                      ]).paddingAll(15)));
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
      getData(context);
      notifyListeners();
      log("Selected date: $selectedDate");
    }
  }

  onCalendarDateChange(date) {
    selectedDate = date;
    notifyListeners();
    print("onCalendarDateChange ::: $selectedDate");
  }

  onSandhyaContainerTap(context) {
    isSandhyaArti = !isSandhyaArti;
    if (isSandhyaArti == true) {
      onSandhyaArtiSelect(context);
    }
    notifyListeners();
  }

  onSandhyaContainerToggle(context) {
    isSandhyaArti = !isSandhyaArti;
    if (isSandhyaArti == true) {
      onSandhyaArtiSelect(context);
    }
    notifyListeners();
  }

  final dynamic sandhyaArtiTotalHour = 24;
  final dynamic sandhyaArtiInitHour = 0;
  dynamic sandhyaArtiCurrentHour = 0;

  final dynamic sandhyaArtiTotalMinute = 11;
  final dynamic sandhyaArtiInitMinute = 0;
  dynamic sandhyaArtiCurrentMinute = 0;

  String sandhyaArtiTime = "";

  String sandhyaArtiTime24 = "";

  onSandhyaArtiHour(val) {
    // 12-hour format
    int hour12 = val % 12;
    String period = (val < 12) ? 'AM' : 'PM';
    String sandhyaArtiTime12 =
        "${hour12.toString().padLeft(2, '0')}:${val.toString().padLeft(2, '0')} $period";
    print("Updated sandhyaArtiTime (12-hour): $sandhyaArtiTime12");

    // 24-hour format
    sandhyaArtiTime24 =
        "${val.toString().padLeft(2, '0')}:${sandhyaArtiCurrentMinute.toString().padLeft(2, '0')}";
    print("Updated sandhyaArtiTime (24-hour): $sandhyaArtiTime24");

    sandhyaArtiCurrentHour = val;
    sandhyaArtiTime = sandhyaArtiTime12;

    notifyListeners();
    Vibration.vibrate(
      duration: 10,
      amplitude: 128,
      pattern: [100, 100],
      intensities: [1, 255],
    );
  }

  onSandhyaArtiMinute(val) {
    // 12-hour format
    String sandhyaArtiTime12 =
        "${sandhyaArtiCurrentHour.toString().padLeft(2, '0')}:${val.toString().padLeft(2, '0')}";
    print("Updated sandhyaArtiTime (12-hour): $sandhyaArtiTime12");

    // 24-hour format
    sandhyaArtiTime24 =
        "${sandhyaArtiCurrentHour.toString().padLeft(2, '0')}:${val.toString().padLeft(2, '0')}";
    print("Updated sandhyaArtiTime (24-hour): $sandhyaArtiTime24");
    sandhyaArtiTime = sandhyaArtiTime12;
    notifyListeners();
    sandhyaArtiCurrentMinute = val;
    Vibration.vibrate(
      duration: 10,
      amplitude: 128,
      pattern: [100, 100],
      intensities: [1, 255],
    );
  }

  onSandhyaToggle(val, e) {
    notifyListeners();
    e.value['isOn'] = val;
    notifyListeners();
  }

  onSandhyaArtiSelect(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context2, setState) {
            return Consumer<HomeScreenProvider>(
                builder: (context1, ctrl, child) {
              return Dialog(
                  insetPadding: const EdgeInsets.symmetric(horizontal: 20),
                  backgroundColor: Colors.transparent,
                  alignment: Alignment.center,
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white),
                      width: double.infinity,
                      height: Sizes.s520,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                                    child: Text('Sandhya Arti',
                                        style: appCss.philosopherBold18
                                            .textColor(appColor(context)
                                                .appTheme
                                                .primary)))
                                .paddingSymmetric(vertical: 20),
                            Text(
                                textAlign: TextAlign.start,
                                'Hour',
                                style: appCss.dmDenseMedium17.textColor(
                                    appColor(context).appTheme.primary)),
                            const VSpace(Insets.i15),
                            CommonWheelSlider(
                                interval: 1,
                                totalCount: sandhyaArtiTotalHour,
                                initValue: sandhyaArtiInitHour,
                                currentIndex: sandhyaArtiCurrentHour,
                                onValueChanged: (val) =>
                                    onSandhyaArtiHour(val)),
                            const VSpace(Insets.i10),
                            Text(
                                textAlign: TextAlign.start,
                                'Minute',
                                style: appCss.dmDenseMedium17.textColor(
                                    appColor(context).appTheme.primary)),
                            const VSpace(Insets.i15),
                            CommonWheelSlider(
                                interval: 5,
                                currentIndex: sandhyaArtiCurrentMinute,
                                initValue: sandhyaArtiInitMinute,
                                onValueChanged: (val) =>
                                    onSandhyaArtiMinute(val),
                                totalCount: sandhyaArtiTotalMinute),
                            const VSpace(Insets.i15),
                            Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color:
                                        appColor(context).appTheme.whiteColor),
                                child: Column(
                                    children: appArray.sandhyaTypeList
                                        .asMap()
                                        .entries
                                        .map((e) {
                                  return Column(children: [
                                    SandhyaAlertList(
                                        status: e.value['isOn'],
                                        text: e.value['artiType'],
                                        onToggle: (val) =>
                                            onSandhyaToggle(val, e)),
                                    const VSpace(Sizes.s10),
                                    e.key == 2
                                        ? Container()
                                        : SvgPicture.asset(
                                            eSvgAssets.lineRuler),
                                    e.key == 2
                                        ? Container()
                                        : const VSpace(Sizes.s10)
                                  ]);
                                }).toList())),
                            const VSpace(Insets.i10),
                            CommonSelectionButton(
                                onTapOne: () => Navigator.pop(context),
                                onTapTwo: () {
                                  updateData(context);
                                  Navigator.pop(context);
                                })
                          ]).paddingAll(15)));
            });
          });
        });
  }

  onExpansionChanged() {
    notifyListeners();
    onChange = !onChange;
  }

  final dynamic manglaArtiTotalHour = 24;
  final dynamic manglaArtiInitHour = 0;
  dynamic manglaArtiCurrentHour = 0;

  final dynamic manglaArtiTotalMinute = 11;
  final dynamic manglaArtiInitMinute = 0;
  dynamic manglaArtiCurrentMinute = 0;

  String manglaArtiTime24 = "";

  onManglaArtiHour(val) {
    // 12-hour format
    int hour12 = val % 12;
    String period = (val < 12) ? 'AM' : 'PM';
    mangalaArtiTime =
        "${hour12.toString().padLeft(2, '0')}:${val.toString().padLeft(2, '0')} $period";
    print("Updated mangalaArtiTime (12-hour): $mangalaArtiTime");

    // 24-hour format with seconds
    manglaArtiTime24 =
        "${val.toString().padLeft(2, '0')}:${manglaArtiCurrentMinute.toString().padLeft(2, '0')}:00";
    print("Updated mangalaArtiTime (24-hour with seconds): $manglaArtiTime24");

    manglaArtiCurrentHour = val;
    notifyListeners();
    Vibration.vibrate(
      duration: 10,
      amplitude: 128,
      pattern: [100, 100],
      intensities: [1, 255],
    );
  }

  onManglaArtiMinute(val) {
    // 12-hour format
    int hour12 = manglaArtiCurrentHour % 12;
    String period = (manglaArtiCurrentHour < 12) ? 'AM' : 'PM';
    mangalaArtiTime =
        "${hour12.toString().padLeft(2, '0')}:${val.toString().padLeft(2, '0')} $period";
    print("Updated mangalaArtiTime (12-hour): $mangalaArtiTime");

    // 24-hour format with seconds
    manglaArtiTime24 =
        "${manglaArtiCurrentHour.toString().padLeft(2, '0')}:${val.toString().padLeft(2, '0')}:00";
    print("Updated mangalaArtiTime (24-hour with seconds): $manglaArtiTime24");

    notifyListeners();
    manglaArtiCurrentMinute = val;
    Vibration.vibrate(
      duration: 10,
      amplitude: 128,
      pattern: [100, 100],
      intensities: [1, 255],
    );
  }

  manglaArtiToggle(val, e) {
    notifyListeners();
    e.value['isOn'] = val;
    notifyListeners();
  }

  onManglaArtiSelect(context) {
    notifyListeners();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          notifyListeners();
          return Dialog(
              insetPadding: const EdgeInsets.symmetric(horizontal: 20),
              backgroundColor: Colors.transparent,
              alignment: Alignment.center,
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white),
                  width: double.infinity,
                  height: Sizes.s610,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                                child: Text('Mangala Arti',
                                    style: appCss.philosopherBold18.textColor(
                                        appColor(context).appTheme.primary)))
                            .paddingSymmetric(vertical: 20),
                        Text(
                            textAlign: TextAlign.start,
                            'Hour',
                            style: appCss.dmDenseMedium17
                                .textColor(appColor(context).appTheme.primary)),
                        const VSpace(Insets.i15),
                        CommonWheelSlider(
                            interval: 1,
                            currentIndex: manglaArtiCurrentHour,
                            initValue: manglaArtiInitHour,
                            onValueChanged: (val) => onManglaArtiHour(val),
                            totalCount: manglaArtiTotalHour),
                        const VSpace(Insets.i10),
                        Text(
                            textAlign: TextAlign.start,
                            'Minutes',
                            style: appCss.dmDenseMedium17
                                .textColor(appColor(context).appTheme.primary)),
                        const VSpace(Insets.i15),
                        CommonWheelSlider(
                            interval: 5,
                            currentIndex: manglaArtiCurrentMinute,
                            initValue: manglaArtiInitMinute,
                            onValueChanged: (val) => onManglaArtiMinute(val),
                            totalCount: manglaArtiTotalMinute),
                        const VSpace(Insets.i15),
                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: appColor(context).appTheme.whiteColor),
                            child: Column(
                                children: appArray.manglaArtiTypeList
                                    .asMap()
                                    .entries
                                    .map((e) {
                              return Column(children: [
                                SandhyaAlertList(
                                    status: e.value['isOn'],
                                    text: e.value['artiType'],
                                    onToggle: (val) =>
                                        manglaArtiToggle(val, e)),
                                const VSpace(Sizes.s10),
                                e.key == 4
                                    ? Container()
                                    : SvgPicture.asset(eSvgAssets.lineRuler),
                                e.key == 4
                                    ? Container()
                                    : const VSpace(Sizes.s10)
                              ]);
                            }).toList())),
                        const VSpace(Insets.i10),
                        CommonSelectionButton(
                            onTapOne: () => Navigator.pop(context),
                            onTapTwo: () {
                              updateData(context);
                              Navigator.pop(context);
                            })
                      ]).paddingAll(15)));
        });
  }

  final dynamic bookReadingTotalHour = 24;
  final dynamic bookReadingInitHour = 0;
  dynamic bookReadingCurrentHour = 0;

  final dynamic bookReadingTotalMinute = 11;
  final dynamic bookReadingInitMinute = 0;
  dynamic bookReadingCurrentMinute = 0;
  List reverseList = List.from(appArray.bookList.reversed);

  String bookReadingTime24 = '';

  onBookReadingHour(val, index) {
    // 24-hour format with seconds
    bookReadingTime24 =
        "${val.toString().padLeft(2, '0')}:${bookReadingCurrentMinute.toString().padLeft(2, '0')}:00";
    print("Updated bookReadingTime (24-hour with seconds): $bookReadingTime24");

    bookReadingCurrentHour = val;
    reverseList[index]['reading_time'] = bookReadingTime24;

    notifyListeners();
    Vibration.vibrate(
      duration: 10,
      amplitude: 128,
      pattern: [100, 100],
      intensities: [1, 255],
    );
  }

  onBookReadingMinute(val, index) {
    // 24-hour format with seconds
    bookReadingTime24 =
        "${bookReadingCurrentHour.toString().padLeft(2, '0')}:${val.toString().padLeft(2, '0')}:00";
    print("Updated bookReadingTime (24-hour with seconds): $bookReadingTime24");

    notifyListeners();
    bookReadingCurrentMinute = val;
    reverseList[index]['reading_time'] = bookReadingTime24;
    Vibration.vibrate(
      duration: 10,
      amplitude: 128,
      pattern: [100, 100],
      intensities: [1, 255],
    );
  }

  Future<bool> showExitPopup(context) async {
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              content: SizedBox(
                  height: 90,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Do you want to exit?"),
                        const SizedBox(height: 20),
                        Row(children: [
                          Expanded(
                              child: ElevatedButton(
                                  onPressed: () {
                                    print('yes selected');
                                    exit(0);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.red.shade800),
                                  child: const Text("Yes"))),
                          const SizedBox(width: 15),
                          Expanded(
                              child: ElevatedButton(
                                  onPressed: () {
                                    print('no selected');
                                    Navigator.of(context).pop();
                                  },
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.white),
                                  child: const Text("No",
                                      style: TextStyle(color: Colors.black))))
                        ])
                      ])));
        });
  }

  final dynamic hearingSpTotalHour = 24;
  final dynamic hearingSpInitHour = 0;
  dynamic hearingSpCurrentHour = 0;

  final dynamic hearingSpTotalMinute = 11;
  final dynamic hearingSpInitMinute = 0;
  dynamic hearingSpCurrentMinute = 0;

  String hearingSpTime24 = '';

  onHearingSpHour(val) {
    // 24-hour format with seconds
    hearingSpTime24 =
        "${val.toString().padLeft(2, '0')}:${hearingSpCurrentMinute.toString().padLeft(2, '0')}:00";
    print("Updated hearingSpTime (24-hour with seconds): $hearingSpTime24");

    hearingSpCurrentHour = val;
    notifyListeners();
    Vibration.vibrate(
      duration: 10,
      amplitude: 128,
      pattern: [100, 100],
      intensities: [1, 255],
    );
  }

  onHearingSpMinute(val) {
    // 24-hour format with seconds
    hearingSpTime24 =
        "${hearingSpCurrentHour.toString().padLeft(2, '0')}:${val.toString().padLeft(2, '0')}:00";
    print("Updated hearingSpTime (24-hour with seconds): $hearingSpTime24");

    notifyListeners();
    hearingSpCurrentMinute = val;
    Vibration.vibrate(
      duration: 10,
      amplitude: 128,
      pattern: [100, 100],
      intensities: [1, 255],
    );
  }

  onHearingSp(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              insetPadding: const EdgeInsets.symmetric(horizontal: 20),
              backgroundColor: Colors.transparent,
              alignment: Alignment.center,
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white),
                  width: double.infinity,
                  height: Sizes.s400,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                                child: Text('Hearing Sp',
                                    style: appCss.philosopherBold18.textColor(
                                        appColor(context).appTheme.primary)))
                            .paddingSymmetric(vertical: 20),
                        Text(
                            textAlign: TextAlign.start,
                            'Hour',
                            style: appCss.dmDenseMedium17
                                .textColor(appColor(context).appTheme.primary)),
                        const VSpace(Insets.i15),
                        CommonWheelSlider(
                            interval: 1,
                            currentIndex: hearingSpCurrentHour,
                            initValue: hearingSpInitHour,
                            onValueChanged: (val) => onHearingSpHour(val),
                            totalCount: hearingSpTotalHour),
                        const VSpace(Insets.i10),
                        Text(
                            textAlign: TextAlign.start,
                            'Minutes',
                            style: appCss.dmDenseMedium17
                                .textColor(appColor(context).appTheme.primary)),
                        const VSpace(Insets.i15),
                        CommonWheelSlider(
                            interval: 5,
                            currentIndex: hearingSpCurrentMinute,
                            initValue: hearingSpInitMinute,
                            onValueChanged: (val) => onHearingSpMinute(val),
                            totalCount: hearingSpTotalMinute),
                        const VSpace(Insets.i25),
                        CommonSelectionButton(
                            onTapOne: () => Navigator.pop(context),
                            onTapTwo: () {
                              updateData(context);
                              Navigator.pop(context);
                            })
                      ]).paddingAll(15)));
        });
  }

  final dynamic hearingGuruTotalHour = 24;
  final dynamic hearingGuruInitHour = 0;
  dynamic hearingGuruCurrentHour = 0;

  final dynamic hearingGuruTotalMinute = 11;
  final dynamic hearingGuruInitMinute = 0;
  dynamic hearingGuruCurrentMinute = 0;

  String hearingGuruTime24 = '';

  onHearingGuruHour(val) {
    // 24-hour format with seconds
    hearingGuruTime24 =
        "${val.toString().padLeft(2, '0')}:${hearingGuruCurrentMinute.toString().padLeft(2, '0')}:00";
    print("Updated hearingGuruTime (24-hour with seconds): $hearingGuruTime24");

    hearingGuruCurrentHour = val;
    notifyListeners();
    Vibration.vibrate(
      duration: 10,
      amplitude: 128,
      pattern: [100, 100],
      intensities: [1, 255],
    );
  }

  onHearingGuruMinute(val) {
    // 24-hour format with seconds
    hearingGuruTime24 =
        "${hearingGuruCurrentHour.toString().padLeft(2, '0')}:${val.toString().padLeft(2, '0')}:00";
    print("Updated hearingGuruTime (24-hour with seconds): $hearingGuruTime24");

    notifyListeners();
    hearingGuruCurrentMinute = val;
    Vibration.vibrate(
      duration: 10,
      amplitude: 128,
      pattern: [100, 100],
      intensities: [1, 255],
    );
  }

  onHearingGuru(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              insetPadding: const EdgeInsets.symmetric(horizontal: 20),
              backgroundColor: Colors.transparent,
              alignment: Alignment.center,
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white),
                  width: double.infinity,
                  height: Sizes.s400,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                                child: Text('Hearing Guru',
                                    style: appCss.philosopherBold18.textColor(
                                        appColor(context).appTheme.primary)))
                            .paddingSymmetric(vertical: 20),
                        Text(
                            textAlign: TextAlign.start,
                            'Hour',
                            style: appCss.dmDenseMedium17
                                .textColor(appColor(context).appTheme.primary)),
                        const VSpace(Insets.i15),
                        CommonWheelSlider(
                            interval: 1,
                            currentIndex: hearingGuruCurrentHour,
                            initValue: hearingGuruInitHour,
                            onValueChanged: (val) => onHearingGuruHour(val),
                            totalCount: hearingGuruTotalHour),
                        const VSpace(Insets.i10),
                        Text(
                            textAlign: TextAlign.start,
                            'Minutes',
                            style: appCss.dmDenseMedium17
                                .textColor(appColor(context).appTheme.primary)),
                        const VSpace(Insets.i15),
                        CommonWheelSlider(
                            interval: 5,
                            currentIndex: hearingGuruCurrentMinute,
                            initValue: hearingGuruInitMinute,
                            onValueChanged: (val) => onHearingGuruMinute(val),
                            totalCount: hearingGuruTotalMinute),
                        const VSpace(Insets.i25),
                        CommonSelectionButton(
                            onTapOne: () => Navigator.pop(context),
                            onTapTwo: () {
                              updateData(context);
                              Navigator.pop(context);
                            })
                      ]).paddingAll(15)));
        });
  }

  final dynamic hearingOthersTotalHour = 24;
  final dynamic hearingOthersInitHour = 0;
  dynamic hearingOthersCurrentHour = 0;

  final dynamic hearingOthersTotalMinute = 11;
  final dynamic hearingOthersInitMinute = 0;
  dynamic hearingOthersCurrentMinute = 0;

  String hearingOthersTime24 = '';

  onHearingOthersHour(val) {
    // 24-hour format with seconds
    hearingOthersTime24 =
        "${val.toString().padLeft(2, '0')}:${hearingOthersCurrentMinute.toString().padLeft(2, '0')}:00";
    print(
        "Updated hearingOthersTime (24-hour with seconds): $hearingOthersTime24");

    hearingOthersCurrentHour = val;
    notifyListeners();
    Vibration.vibrate(
      duration: 10,
      amplitude: 128,
      pattern: [100, 100],
      intensities: [1, 255],
    );
  }

  onHearingOthersMinute(val) {
    // 24-hour format with seconds
    hearingOthersTime24 =
        "${hearingOthersCurrentHour.toString().padLeft(2, '0')}:${val.toString().padLeft(2, '0')}:00";
    print(
        "Updated hearingOthersTime (24-hour with seconds): $hearingOthersTime24");

    notifyListeners();
    hearingOthersCurrentMinute = val;
    Vibration.vibrate(
      duration: 10,
      amplitude: 128,
      pattern: [100, 100],
      intensities: [1, 255],
    );
  }

  onHearingOther(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              insetPadding: const EdgeInsets.symmetric(horizontal: 20),
              backgroundColor: Colors.transparent,
              alignment: Alignment.center,
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white),
                  width: double.infinity,
                  height: Sizes.s400,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                                child: Text('Hearing Others',
                                    style: appCss.philosopherBold18.textColor(
                                        appColor(context).appTheme.primary)))
                            .paddingSymmetric(vertical: 20),
                        Text(
                            textAlign: TextAlign.start,
                            'Hour',
                            style: appCss.dmDenseMedium17
                                .textColor(appColor(context).appTheme.primary)),
                        const VSpace(Insets.i15),
                        CommonWheelSlider(
                            interval: 1,
                            currentIndex: hearingOthersCurrentHour,
                            initValue: hearingOthersInitHour,
                            onValueChanged: (val) => onHearingOthersHour(val),
                            totalCount: hearingOthersTotalHour),
                        const VSpace(Insets.i10),
                        Text(
                            textAlign: TextAlign.start,
                            'Minutes',
                            style: appCss.dmDenseMedium17
                                .textColor(appColor(context).appTheme.primary)),
                        const VSpace(Insets.i15),
                        CommonWheelSlider(
                            interval: 5,
                            currentIndex: hearingOthersCurrentMinute,
                            initValue: hearingOthersInitMinute,
                            onValueChanged: (val) => onHearingOthersMinute(val),
                            totalCount: hearingOthersTotalMinute),
                        const VSpace(Insets.i25),
                        CommonSelectionButton(
                            onTapOne: () => Navigator.pop(context),
                            onTapTwo: () {
                              updateData(context);
                              Navigator.pop(context);
                            })
                      ]).paddingAll(15)));
        });
  }

  final dynamic preachingTotalHour = 24;
  final dynamic preachingInitHour = 0;
  dynamic preachingCurrentHour = 0;

  final dynamic preachingTotalMinute = 11;
  final dynamic preachingInitMinute = 0;
  dynamic preachingCurrentMinute = 0;

  String preachingTime24 = '';

  onPreachingHour(val) {
    // 24-hour format with seconds
    preachingTime24 =
        "${val.toString().padLeft(2, '0')}:${preachingCurrentMinute.toString().padLeft(2, '0')}:00";
    print("Updated preachingTime (24-hour with seconds): $preachingTime24");

    preachingCurrentHour = val;
    notifyListeners();
    Vibration.vibrate(
      duration: 10,
      amplitude: 128,
      pattern: [100, 100],
      intensities: [1, 255],
    );
  }

  onPreachingMinute(val) {
    // 24-hour format with seconds
    preachingTime24 =
        "${preachingCurrentHour.toString().padLeft(2, '0')}:${val.toString().padLeft(2, '0')}:00";
    print("Updated preachingTime (24-hour with seconds): $preachingTime24");

    notifyListeners();
    preachingCurrentMinute = val;
    Vibration.vibrate(
      duration: 10,
      amplitude: 128,
      pattern: [100, 100],
      intensities: [1, 255],
    );
  }

  onPreaching(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              insetPadding: const EdgeInsets.symmetric(horizontal: 20),
              backgroundColor: Colors.transparent,
              alignment: Alignment.center,
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white),
                  width: double.infinity,
                  height: Sizes.s400,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                                child: Text('Preaching',
                                    style: appCss.philosopherBold18.textColor(
                                        appColor(context).appTheme.primary)))
                            .paddingSymmetric(vertical: 20),
                        Text(
                            textAlign: TextAlign.start,
                            'Hour',
                            style: appCss.dmDenseMedium17
                                .textColor(appColor(context).appTheme.primary)),
                        const VSpace(Insets.i15),
                        CommonWheelSlider(
                            interval: 1,
                            currentIndex: preachingCurrentHour,
                            initValue: preachingInitHour,
                            onValueChanged: (val) => onPreachingHour(val),
                            totalCount: preachingTotalHour),
                        const VSpace(Insets.i10),
                        Text(
                            textAlign: TextAlign.start,
                            'Minutes',
                            style: appCss.dmDenseMedium17
                                .textColor(appColor(context).appTheme.primary)),
                        const VSpace(Insets.i15),
                        CommonWheelSlider(
                            interval: 5,
                            currentIndex: preachingCurrentMinute,
                            initValue: preachingInitMinute,
                            onValueChanged: (val) => onPreachingMinute(val),
                            totalCount: preachingTotalMinute),
                        const VSpace(Insets.i25),
                        CommonSelectionButton(
                            onTapOne: () => Navigator.pop(context),
                            onTapTwo: () {
                              updateData(context);
                              Navigator.pop(context);
                            })
                      ]).paddingAll(15)));
        });
  }

  final dynamic othersActivitiesTotalHour = 24;
  final dynamic othersActivitiesInitHour = 0;
  dynamic othersActivitiesCurrentHour = 0;

  final dynamic othersActivitiesTotalMinute = 11;
  final dynamic othersActivitiesInitMinute = 0;
  dynamic othersActivitiesCurrentMinute = 0;

  String othersActivitiesTime24 = '';

  onOthersActivitiesHour(val) {
    // 24-hour format with seconds
    othersActivitiesTime24 =
        "${val.toString().padLeft(2, '0')}:${othersActivitiesCurrentMinute.toString().padLeft(2, '0')}:00";
    print(
        "Updated othersActivitiesTime (24-hour with seconds): $othersActivitiesTime24");

    othersActivitiesCurrentHour = val;
    notifyListeners();
    Vibration.vibrate(
      duration: 10,
      amplitude: 128,
      pattern: [100, 100],
      intensities: [1, 255],
    );
  }

  onOthersActivitiesMinute(val) {
    // 24-hour format with seconds
    othersActivitiesTime24 =
        "${othersActivitiesCurrentHour.toString().padLeft(2, '0')}:${val.toString().padLeft(2, '0')}:00";
    print(
        "Updated othersActivitiesTime (24-hour with seconds): $othersActivitiesTime24");

    notifyListeners();
    othersActivitiesCurrentMinute = val;
    Vibration.vibrate(
      duration: 10,
      amplitude: 128,
      pattern: [100, 100],
      intensities: [1, 255],
    );
  }

  onOther(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              insetPadding: const EdgeInsets.symmetric(horizontal: 20),
              backgroundColor: Colors.transparent,
              alignment: Alignment.center,
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white),
                  width: double.infinity,
                  height: Sizes.s400,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                                child: Text('Other Activities',
                                    style: appCss.philosopherBold18.textColor(
                                        appColor(context).appTheme.primary)))
                            .paddingSymmetric(vertical: 20),
                        Text(
                            textAlign: TextAlign.start,
                            'Hour',
                            style: appCss.dmDenseMedium17
                                .textColor(appColor(context).appTheme.primary)),
                        const VSpace(Insets.i15),
                        CommonWheelSlider(
                            interval: 1,
                            currentIndex: othersActivitiesCurrentHour,
                            initValue: othersActivitiesInitHour,
                            onValueChanged: (val) =>
                                onOthersActivitiesHour(val),
                            totalCount: othersActivitiesTotalHour),
                        const VSpace(Insets.i10),
                        Text(
                            textAlign: TextAlign.start,
                            'Minutes',
                            style: appCss.dmDenseMedium17
                                .textColor(appColor(context).appTheme.primary)),
                        const VSpace(Insets.i15),
                        CommonWheelSlider(
                            interval: 5,
                            currentIndex: othersActivitiesCurrentMinute,
                            initValue: othersActivitiesInitMinute,
                            onValueChanged: (val) =>
                                onOthersActivitiesMinute(val),
                            totalCount: othersActivitiesTotalMinute),
                        const VSpace(Insets.i25),
                        CommonSelectionButton(
                            onTapOne: () => Navigator.pop(context),
                            onTapTwo: () {
                              updateData(context);
                              Navigator.pop(context);
                            })
                      ]).paddingAll(15)));
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

  List chantinglist = [];

  List qualityList = [];

  List regulations = [];

  String? notes;
  int? small;
  int? medium;
  int? large;

  getData(context) async {
    showLoading(context);
    notifyListeners();
    DateTime getDate(DateTime d) => DateTime(d.year, d.month, d.day);
    var toData = DateFormat("yyyy-MM-dd").format(selectedDate);
    var fromData = DateFormat("yyyy-MM-dd")
        .format(getDate(selectedDate).subtract(const Duration(days: 6)));
    try {
      Map<String, String> body = {"from_date": fromData, "to_date": toData};
      // Map<String, String> body = {
      //   "from_date": "2023-12-30",
      //   "to_date": "2023-12-30"
      // };
      log("BODY $body");
      await apiServices
          .postApi(api.getSadhana, body, isToken: true)
          .then((value) async {
        hideLoading(context);
        notifyListeners();
        log('From Date: ${value.isSuccess!}');
        print("RESPONSE ${value.data}");
        print("RESPONSEs ${value.data['book_reading']}");
        if (value.isSuccess!) {
          notifyListeners();
          Sadhana sadhana = Sadhana.fromJson(value.data);

          log("AAAA : ${sadhana.sadhanaData}");
          if (sadhana.sadhanaData.isNotEmpty) {
            for (var sadhnaData in sadhana.sadhanaData) {
              if (sadhnaData["date"] == toData) {
                var sleepData = sadhnaData['data']['sleep'];
                log("sleepdataaa :: $sleepData");
              }
            }

            notifyListeners();
            var sleepData = sadhana.sadhanaData[0]['data']['sleep'];
            var mangalaData = sadhana.sadhanaData[0]['data']['mangala_arti'];
            var sandhyaData = sadhana.sadhanaData[0]['data']['sandhya_arti'];
            var dateFormat = DateFormat("h:mm a");
            var regulations = sadhana.sadhanaData[0]['data']['regulations'];
            var mangalaArti = sadhana.sadhanaData[0]['data']['mangala_arti'];
            var sandhyaArti = sadhana.sadhanaData[0]['data']['sandhya_arti'];

            ////////////////////////////////////

            /////////////////////////////////////

            if (sadhana.sadhanaData[0]['data']['association'] != null) {
              log("ASSSS : ${sadhana.sadhanaData[0]['data']['association'] != "null"}");
              hearingSpTime24 =
                  sadhana.sadhanaData[0]['data']['association']['hearing_sp'];

              hearingGuruTime24 =
                  sadhana.sadhanaData[0]['data']['association']['hearing_guru'];
              hearingOthersTime24 = sadhana.sadhanaData[0]['data']
                  ['association']['hearing_others'];
              preachingTime24 =
                  sadhana.sadhanaData[0]['data']['association']['preaching'];
              othersActivitiesTime24 = sadhana.sadhanaData[0]['data']
                  ['association']['other_activities'];
            } else {
              hearingSpTime24 = 'N/A';
              hearingGuruTime24 = 'N/A';
              hearingOthersTime24 = 'N/A';
              preachingTime24 = 'N/A';
              othersActivitiesTime24 = 'N/A';
            }
            notifyListeners();
            notes = sadhana.sadhanaData[0]['data']['notes'];
            notesCtrl.text = notes!;

            small = sadhana.sadhanaData[0]['data']['book_distribution']
                ['small_books'];
            medium = sadhana.sadhanaData[0]['data']['book_distribution']
                ['medium_books'];
            large = sadhana.sadhanaData[0]['data']['book_distribution']
                ['big_books'];
            smallBookCtrl.text = small.toString();
            mediumBookCtrl.text = medium.toString();
            largeBookCtrl.text = large.toString();
            // if (sadhana.sadhanaData[0]['data']['book_distribution'] != null) {
            //   small = sadhana.sadhanaData[0]['data']['book_distribution']['small_books'];
            //   medium = sadhana.sadhanaData[0]['data']['book_distribution']['medium_books'];
            //   large = sadhana.sadhanaData[0]['data']['book_distribution']['big_books'];
            //
            //   smallBookCtrl.text = small.toString();
            //   mediumBookCtrl.text = medium.toString();
            //   largeBookCtrl.text = large.toString();
            // } else {
            //   smallBookCtrl.text = '00';
            //   mediumBookCtrl.text = '00';
            //   largeBookCtrl.text = '00';
            // }

            List book_data = sadhana.sadhanaData[0]['data']['book_reading'];

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
            notifyListeners();
            for (int i = 1; i <= 4; i++) {
              chantinglist.add({
                'rounds': sadhana.sadhanaData[0]['data']['chanting']['slot_$i']
                    ['rounds'],
                "quality": sadhana.sadhanaData[0]['data']['chanting']['slot_$i']
                    ['quality']
              });
            }

            log("message   $qualityList");

            appArray.rulesList = [
              {'rule': 'No meat eating', 'isOn': regulations['no_meat_eating']},
              {
                'rule': 'No intoxication',
                'isOn': regulations['no_intoxication']
              },
              {'rule': 'No illicit sex', 'isOn': regulations['no_illicit_sex']},
              {'rule': 'No gambling', 'isOn': regulations['no_gambling']},
              {'rule': 'Only prasadam', 'isOn': regulations['only_prasadam']}
            ];
            appArray.manglaArtiTypeList = [
              {'artiType': 'Guru Astaka', 'isOn': mangalaArti['guru_astaka']},
              {
                'artiType': 'Narasimha Arti',
                'isOn': mangalaArti['narasimha_arti']
              },
              {
                'artiType': 'Tulasi Arti & Parikrama',
                'isOn': mangalaArti['tulasi_arti']
              },
              {'artiType': 'Guru Arti', 'isOn': mangalaArti['guru_arti']},
              {
                'artiType': 'Bhoga Offering ',
                'isOn': mangalaArti['bhoga_offering']
              }
            ];

            appArray.sandhyaTypeList = [
              {'artiType': 'Sandhya Arti', 'isOn': sandhyaArti['sandhya_arti']},
              {
                'artiType': 'Narasimha Arti',
                'isOn': sandhyaArti['narasimha_arti']
              },
              {
                'artiType': 'Bhoga Offering',
                'isOn': sandhyaArti['bhoga_offering']
              }
            ];
            notifyListeners();
            for (int i = 0; i < book_data.length; i++) {
              log("book_data[i] : ${book_data[i]}");
              appArray.bookList.add(book_data[i]);
            }

            notifyListeners();
            log('Book Read: ${appArray.bookList}');
          } else {
            sleepAt = "";
            wakeupTime = "";
            mangalaArtiTime = "";
            isSandhyaArti = false;
            notifyListeners();
            chantinglist.clear();
            appArray.bookList.clear();
            notifyListeners();
            smallBookCtrl.text = '00';
            mediumBookCtrl.text = '00';
            largeBookCtrl.text = '00';
            notifyListeners();
            log('Book Read: ${appArray.bookList}');
            for (int ii = 0; ii < appArray.rulesList.length; ii++) {
              appArray.rulesList[ii]['isOn'] = false;
              log("iiiiii $ii");
            }
            notesCtrl.text = "";
          }
        } else {
          notifyListeners();
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

  updateData(context) async {
    log("SSS $selectedDate");
    log("SSS $sleepAt");
    log("SSS $sleepAt24");
    log("SSS $wakeupTime");
    log("SSS $wakeupTime24");
    var body = {
      "date": DateFormat('yyyy-MM-dd').format(selectedDate),
      "data": {
        "sleep": {"slept_time": sleepAt24, "wakeup_time": wakeupTime24},
        "mangala_arti": {
          "time": manglaArtiTime24,
          "guru_astaka": appArray.manglaArtiTypeList[0]['isOn'],
          "narasimha_arti": appArray.manglaArtiTypeList[1]['isOn'],
          "tulasi_arti": appArray.manglaArtiTypeList[2]['isOn'],
          "guru_arti": appArray.manglaArtiTypeList[3]['isOn'],
          "bhoga_offering": appArray.manglaArtiTypeList[4]['isOn']
        },
        "sandhya_arti": {
          "time": sandhyaArtiTime24,
          "sandhya_arti": appArray.sandhyaTypeList[0]['isOn'],
          "narasimha_arti": appArray.sandhyaTypeList[1]['isOn'],
          "bhoga_offering": appArray.sandhyaTypeList[2]['isOn']
        },
        "chanting": {
          "slot_1": {
            "rounds": chantinglist[0]['rounds'],
            "quality": chantinglist[0]['quality']
          },
          "slot_2": {
            "rounds": chantinglist[1]['rounds'],
            "quality": chantinglist[1]['quality']
          },
          "slot_3": {
            "rounds": chantinglist[2]['rounds'],
            "quality": chantinglist[2]['quality']
          },
          "slot_4": {
            "rounds": chantinglist[3]['rounds'],
            "quality": chantinglist[3]['quality']
          }
        },
        "regulations": {
          "no_meat_eating": appArray.rulesList[0]['isOn'],
          "no_intoxication": appArray.rulesList[1]['isOn'],
          "no_illicit_sex": appArray.rulesList[2]['isOn'],
          "no_gambling": appArray.rulesList[3]['isOn'],
          "only_prasadam": appArray.rulesList[4]['isOn']
        },
        "book_reading": [
          {
            "book_id": appArray.bookList[0]['book_id'],
            "chapter": appArray.bookList[0]['chapter'],
            "reading_time": appArray.bookList[0]['reading_time']
          },
          {
            "book_id": appArray.bookList[1]['book_id'],
            "chapter": appArray.bookList[1]['chapter'],
            "reading_time": appArray.bookList[1]['reading_time']
          }
        ],
        "association": {
          "hearing_sp": hearingSpTime24,
          "hearing_guru": hearingGuruTime24,
          "hearing_others": hearingOthersTime24,
          "preaching": preachingTime24,
          "other_activities": othersActivitiesTime24
        },
        "book_distribution": {
          "small_books": smallBookCtrl.text,
          "medium_books": mediumBookCtrl.text,
          "big_books": largeBookCtrl.text
        },
        "notes": notesCtrl.text
      }
    };

    log("BBBBB :$body");

    await apiServices
        .postApi(api.sadhanaUpdate, body, isToken: true)
        .then((value) async {
      log("sadhanaUpdate  :: ${value.data}");
      hideLoading(context);
      notifyListeners();
      print("value.data ${value.data}");

      if (value.isSuccess!) {
        notifyListeners();
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(value.message)));
      }
    });
  }
}
