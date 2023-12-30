import 'package:bhakti_app/config.dart';
import '../../../customise/custom_week_calendar/custom_week_calendar.dart';

class WeekCalendar extends StatefulWidget {
  const WeekCalendar({super.key});

  @override
  State<WeekCalendar> createState() => _WeekCalendarState();
}

class _WeekCalendarState extends State<WeekCalendar> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(
        builder: (context1, homeScreenPvr, child) {
      return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
            height: 72,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: appColor(context).appTheme.whiteColor),
            child: HorizontalWeekCalendar(
                datePickChange: homeScreenPvr.selectedDate,
                todayDate: DateTime.now(),
                inactiveWeekColor: appColor(context).appTheme.rulesClr,
                activeBackgroundColor: appColor(context).appTheme.primary,
                activeTextColor: Colors.white,
                inactiveBackgroundColor: appColor(context).appTheme.whiteColor,
                inactiveDateColor: appColor(context).appTheme.lightText,
                disabledTextColor: appColor(context).appTheme.lightText,
                disabledBackgroundColor: appColor(context).appTheme.whiteColor,
                activeNavigatorColor: appColor(context).appTheme.whiteColor,
                inactiveNavigatorColor: appColor(context).appTheme.whiteColor,
                onDateChange: (date) => {
                      homeScreenPvr.onCalendarDateChange(date),
                      homeScreenPvr.getData(context)
                    })),
      ]);
    });
  }
}
