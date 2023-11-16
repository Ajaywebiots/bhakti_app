import 'dart:developer';

import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/providers/home_screen_provider.dart';
import 'package:bhakti_app/widgets/custom_week_calendar.dart';

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
                inactiveWeekColor: appColor(context).appTheme.rulesClr,
                weekStartFrom: WeekStartFrom.Sunday,
                activeBackgroundColor: appColor(context).appTheme.primary,
                activeTextColor: Colors.white,
                inactiveBackgroundColor: appColor(context).appTheme.whiteColor,
                inactiveDateColor: appColor(context).appTheme.lightText,
                disabledTextColor: appColor(context).appTheme.lightText,
                disabledBackgroundColor: appColor(context).appTheme.whiteColor,
                activeNavigatorColor: appColor(context).appTheme.whiteColor,
                inactiveNavigatorColor: appColor(context).appTheme.whiteColor,
                onDateChange: (date) =>
                    homeScreenPvr.onCalendarDateChange(date)))
      ]);
    });
  }
}
