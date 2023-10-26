import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/screens/home_screen/set_up_profile/llllla.dart';


class SetUpProfile extends StatefulWidget {
  const SetUpProfile({super.key});

  @override
  State<SetUpProfile> createState() => _SetUpProfileState();
}

class _SetUpProfileState extends State<SetUpProfile> {
  var selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
          height: 72,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: appColor(context).appTheme.whiteColor),
          child: HorizontalWeekCalendar(
              weekStartFrom: WeekStartFrom.Sunday,
              activeBackgroundColor: appColor(context).appTheme.primary,
              activeTextColor: Colors.white,
              inactiveBackgroundColor: appColor(context).appTheme.whiteColor,
              inactiveTextColor: appColor(context).appTheme.black,
              disabledTextColor: appColor(context).appTheme.black,
              disabledBackgroundColor: appColor(context).appTheme.whiteColor,
              activeNavigatorColor: appColor(context).appTheme.whiteColor,
              inactiveNavigatorColor: appColor(context).appTheme.whiteColor,
              onDateChange: (date) {
                setState(() {
                  selectedDate = date;
                });
              }))
    ]);
  }
}
