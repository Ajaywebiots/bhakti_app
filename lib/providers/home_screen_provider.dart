import 'dart:developer';
import 'dart:io';

import 'package:bhakti_app/screens/home_screen/layouts/common_wheel_slider.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:intl/intl.dart';
import 'package:vibration/vibration.dart';

import '../config.dart';
import '../customise/custom_wheel_sildersss/wheel_sliderssss.dart';

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
  final dynamic sleepTotalMinute = 59;
  final dynamic sleepInitMinute = 0;

  dynamic sleepCurrentMinute = 0;

  onSleepAtHour(val) {
    int hour12 = val % 12;
    String period = (val < 12) ? 'AM' : 'PM';
    sleepAt =
        "${hour12.toString().padLeft(2, '0')}:${sleepCurrentMinute.toString().padLeft(2, '0')} $period";
    print("Updated sleepAt: $sleepAt");
    sleepCurrentHour = val;
    notifyListeners();
    Vibration.vibrate(
        duration: 10,
        amplitude: 128,
        pattern: [100, 100],
        intensities: [1, 255]);
  }

  onSleepAtMinute(val) {
    int hour12 = sleepCurrentHour % 12;
    String period = (sleepCurrentHour < 12) ? 'AM' : 'PM';
    notifyListeners();
    sleepAt =
        "${hour12.toString().padLeft(2, '0')}:${val.toString().padLeft(2, '0')} $period";
    print("Updated sleepAt: $sleepAt");
    sleepCurrentMinute = val;
    notifyListeners();

    Vibration.vibrate(
        duration: 10,
        amplitude: 128,
        pattern: [100, 100],
        intensities: [1, 255]);
  }

  final dynamic wokeUpTotalHour = 24;
  final dynamic wokeUpInitHour = 0;
  dynamic wokeUpCurrentHour = 0;

  final dynamic wokeUpTotalMinute = 11;
  final dynamic wokeUpInitMinute = 0;
  dynamic wokeUpCurrentMinute = 0;

  onWokeUpHour(val) {
    int hour12 = val % 12;
    String period = (val < 12) ? 'AM' : 'PM';
    wakeupTime =
        "${hour12.toString().padLeft(2, '0')}:${val.toString().padLeft(2, '0')} $period";
    print("Updated sleepAt: $wakeupTime");
    notifyListeners();
    wokeUpCurrentHour = val;
    Vibration.vibrate(
        duration: 10,
        amplitude: 128,
        pattern: [100, 100],
        intensities: [1, 255]);
  }

  onWokeUpMinute(val) {
    int hour12 = wokeUpCurrentHour % 12;
    String period = (sleepCurrentHour < 12) ? 'AM' : 'PM';
    notifyListeners();
    wakeupTime =
        "${hour12.toString().padLeft(2, '0')}:${val.toString().padLeft(2, '0')} $period";
    print("Updated sleepAt: $wakeupTime");
    notifyListeners();
    wokeUpCurrentMinute = val;

    Vibration.vibrate(
        duration: 10,
        amplitude: 128,
        pattern: [100, 100],
        intensities: [1, 255]);

    wakeupTime =
        "${wokeUpCurrentHour.toString().padLeft(2, '0')}:${val.toString().padLeft(2, '0')}";
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
                                style: appCss.dmDenseMedium14.textColor(
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
                                style: appCss.dmDenseMedium14.textColor(
                                    appColor(context).appTheme.primary)),
                            const VSpace(Insets.i15),
                            CommonWheelSlider(
                                interval: 5,
                                totalCount: sleepTotalMinute,
                                initValue: sleepInitMinute,
                                currentIndex: sleepCurrentMinute,
                                onValueChanged: (val) => onSleepAtMinute(val)),
                            const VSpace(Insets.i60),
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
                            style: appCss.dmDenseMedium14
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
                            style: appCss.dmDenseMedium14
                                .textColor(appColor(context).appTheme.primary)),
                        const VSpace(Insets.i15),
                        CommonWheelSlider(
                            interval: 5,
                            totalCount: wokeUpTotalMinute,
                            initValue: wokeUpInitMinute,
                            currentIndex: wokeUpCurrentMinute,
                            onValueChanged: (val) => onWokeUpMinute(val)),
                        const VSpace(Insets.i60),
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

  onChantingCountQuality(val,index) {
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
                            style: appCss.dmDenseMedium14
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
                            style: appCss.dmDenseMedium14
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

          ;
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

  onSandhyaArtiHour(val) {
    int hour12 = val % 12;
    String period = (val < 12) ? 'AM' : 'PM';
    sandhyaArtiTime =
        "${hour12.toString().padLeft(2, '0')}:${sandhyaArtiCurrentMinute.toString().padLeft(2, '0')} $period";
    print("Updated sleepAt: $sandhyaArtiTime");
    notifyListeners();
    sandhyaArtiCurrentHour = val;
    Vibration.vibrate(
        duration: 10,
        amplitude: 128,
        pattern: [100, 100],
        intensities: [1, 255]);
  }

  onSandhyaArtiMinute(val) {
    sandhyaArtiTime =
        "${wokeUpCurrentHour.toString().padLeft(2, '0')}:${val.toString().padLeft(2, '0')}";
    print("Updated sleepAt: $sandhyaArtiTime");
    notifyListeners();
    wokeUpCurrentMinute = val;
    Vibration.vibrate(
        duration: 10,
        amplitude: 128,
        pattern: [100, 100],
        intensities: [1, 255]);
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
                                style: appCss.dmDenseMedium14.textColor(
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
                                style: appCss.dmDenseMedium14.textColor(
                                    appColor(context).appTheme.primary)),
                            const VSpace(Insets.i15),
                            CommonWheelSlider(
                                interval: 5,
                                currentIndex: sandhyaArtiCurrentMinute,
                                initValue: sandhyaArtiInitMinute,
                                onValueChanged: (val) =>
                                    onSandhyaArtiMinute(val),
                                totalCount: sandhyaArtiTotalMinute),
                            const VSpace(Insets.i25),
                            Container(
                                padding: const EdgeInsets.all(15),
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

  onManglaArtiHour(val) {
    int hour12 = val % 12;
    String period = (val < 12) ? 'AM' : 'PM';
    mangalaArtiTime =
        "${hour12.toString().padLeft(2, '0')}:${wokeUpCurrentMinute.toString().padLeft(2, '0')} $period";
    print("Updated sleepAt: $mangalaArtiTime");
    notifyListeners();
    wokeUpCurrentHour = val;
    Vibration.vibrate(
        duration: 10,
        amplitude: 128,
        pattern: [100, 100],
        intensities: [1, 255]);
  }

  onManglaArtiMinute(val) {
    wakeupTime =
        "${wokeUpCurrentHour.toString().padLeft(2, '0')}:${val.toString().padLeft(2, '0')}";
    print("Updated sleepAt: $wakeupTime");
    notifyListeners();
    wokeUpCurrentMinute = val;
    Vibration.vibrate(
        duration: 10,
        amplitude: 128,
        pattern: [100, 100],
        intensities: [1, 255]);
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
                            style: appCss.dmDenseMedium14
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
                            style: appCss.dmDenseMedium14
                                .textColor(appColor(context).appTheme.primary)),
                        const VSpace(Insets.i15),
                        CommonWheelSlider(
                            interval: 5,
                            currentIndex: manglaArtiCurrentMinute,
                            initValue: manglaArtiInitMinute,
                            onValueChanged: (val) => onManglaArtiMinute(val),
                            totalCount: manglaArtiTotalMinute),
                        const VSpace(Insets.i25),
                        Container(
                            padding: const EdgeInsets.all(15),
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

  onHearingSelect(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CommonDialog(text: 'Hearing', text1: 'Hour', text2: 'Minutes');
        });
  }

  onPreachingSelect(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CommonDialog(
              text: 'Preaching', text1: 'Hour', text2: 'Minutes');
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
          );
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

  String? sadhanaHearing;
  String? hearingGuru;
  String? hearingOthers;
  String? preaching;
  String? otherActivities;
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

            for(var sadhnaData in sadhana.sadhanaData){
              if(sadhnaData["date"] == toData){

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
              sadhanaHearing =
                  sadhana.sadhanaData[0]['data']['association']['hearing_sp'];

              hearingGuru =
                  sadhana.sadhanaData[0]['data']['association']['hearing_guru'];
              hearingOthers = sadhana.sadhanaData[0]['data']['association']
                  ['hearing_others'];
              preaching =
                  sadhana.sadhanaData[0]['data']['association']['preaching'];
              otherActivities = sadhana.sadhanaData[0]['data']['association']
                  ['other_activities'];
            } else {
              sadhanaHearing = 'N/A';
              hearingGuru = 'N/A';
              hearingOthers = 'N/A';
              preaching = 'N/A';
              otherActivities = 'N/A';
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
    log("SSS $wakeupTime");
    var body = {
      "date": DateFormat('yyyy-MM-dd').format(selectedDate),
      "data": {
        "sleep": {"slept_time": sleepAt, "wakeup_time": wakeupTime},
        "mangala_arti": {
          "time": mangalaArtiTime,
          "guru_astaka": appArray.manglaArtiTypeList[0]['isOn'],
          "narasimha_arti": appArray.manglaArtiTypeList[1]['isOn'],
          "tulasi_arti": appArray.manglaArtiTypeList[2]['isOn'],
          "guru_arti": appArray.manglaArtiTypeList[3]['isOn'],
          "bhoga_offering": appArray.manglaArtiTypeList[4]['isOn']
        },
        "sandhya_arti": {
          "time": "07:30:00",
          "sandhya_arti": appArray.sandhyaTypeList[0]['isOn'],
          "narasimha_arti": appArray.sandhyaTypeList[1]['isOn'],
          "bhoga_offering": appArray.sandhyaTypeList[2]['isOn']
        },
        "chanting": {
          "slot_1": {"rounds": chantinglist[0]['rounds'], "quality": chantinglist[0]['quality']},
          "slot_2": {"rounds": chantinglist[1]['rounds'], "quality": chantinglist[1]['quality']},
          "slot_3": {"rounds": chantinglist[2]['rounds'], "quality": chantinglist[2]['quality']},
          "slot_4": {"rounds": chantinglist[3]['rounds'], "quality": chantinglist[3]['quality']}
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
          "hearing_sp": sadhanaHearing,
          "hearing_guru": hearingGuru,
          "hearing_others": hearingOthers,
          "preaching": preaching,
          "other_activities": otherActivities
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
