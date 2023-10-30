import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/screens/home_screen/layouts/common_dialog_box.dart';

class HomeScreenProvider extends ChangeNotifier {
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
  int qualityRating = 0;
  int wokeUpTimeHour = 0;
  int wokeUpTimeMin = 0;
  bool isSandhyaArti = false;

  onSleepTimeSelect(context) {
    showDialog(
        context: context,
        builder: (BuildContext context1) {
          return CommonDialog(
              text: 'Sleep Time',
              text1: 'Hour',
              text2: 'Minutes',
              onHourChange: (value) {
                sleepTimeHour = value;
                notifyListeners();
              },
              onMinChange: (value) {
                sleepTimeMin = value;
                notifyListeners();
              });
        });
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

  onSandhyaArtiSelect(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CommonDialog(
              text: 'Sandhya Arti',
              text1: 'Hour',
              text2: 'Minutes',
              onHourChange: (value) {
                sandhyaArtiHour = value;
                notifyListeners();
              },
              onMinChange: (value) {
                sandhyaArtiMin = value;
                notifyListeners();
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
}
