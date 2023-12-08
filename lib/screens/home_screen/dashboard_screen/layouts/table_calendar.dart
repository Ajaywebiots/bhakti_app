import 'package:table_calendar/table_calendar.dart';
import '../../../../config.dart';
import '../../../../widgets/common_selection_button.dart';

class TableCalendarLayout extends StatelessWidget {
  const TableCalendarLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder: (context, dashboardPvr, child) {
      return ExpansionTile(
          onExpansionChanged: (value) => dashboardPvr.onExpansionChanged(),
          trailing: SvgPicture.asset(dashboardPvr.onChange == false
              ? eSvgAssets.arrowDown1
              : eSvgAssets.arrowUp),
          leading: SvgPicture.asset("assets/svg/calendarEdit.svg"),
          title: Text(
              "${dashboardPvr.startedRange ?? appFonts.selectFromDate} ${dashboardPvr.startedRange == null ? appFonts.and : appFonts.to} ${dashboardPvr.endedRange ?? appFonts.toDate}",
              style: appCss.dmDenseMedium16
                  .textColor(appColor(context).appTheme.primary)),
          children: <Widget>[
            TableCalendar(
                onFormatChanged: (format) =>
                    dashboardPvr.onFormatChanged(format),
                rangeStartDay: dashboardPvr.rangeStart,
                rangeEndDay: dashboardPvr.rangeEnd,
                onRangeSelected: (start, end, focusedDay) =>
                    dashboardPvr.onRangeSelected(start, end, focusedDay),
                rangeSelectionMode: RangeSelectionMode.toggledOn,
                calendarStyle: CalendarStyle(
                    isTodayHighlighted: false,
                    rangeHighlightColor:
                        appColor(context).appTheme.primary.withOpacity(0.10),
                    rangeEndDecoration: BoxDecoration(
                        color: appColor(context).appTheme.primary,
                        borderRadius: BorderRadius.circular(6)),
                    rangeStartDecoration: BoxDecoration(
                        color: appColor(context).appTheme.primary,
                        borderRadius: BorderRadius.circular(6)),
                    selectedDecoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(1))),
                headerStyle: HeaderStyle(
                    titleTextStyle: appCss.dmDenseMedium14
                        .textColor(appColor(context).appTheme.primary),
                    rightChevronVisible: true,
                    rightChevronIcon: Container(
                        padding: const EdgeInsets.all(6),
                        height: Sizes.s26,
                        width: Sizes.s26,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: appColor(context)
                                .appTheme
                                .primary
                                .withOpacity(0.10)),
                        child: SvgPicture.asset("assets/svg/rightSide.svg")),
                    leftChevronIcon: Container(
                        padding: const EdgeInsets.all(6),
                        height: Sizes.s26,
                        width: Sizes.s26,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: appColor(context).appTheme.primary.withOpacity(0.10)),
                        child: SvgPicture.asset("assets/svg/leftSide.svg")),
                    leftChevronMargin: const EdgeInsets.only(left: 50),
                    rightChevronMargin: const EdgeInsets.only(right: 50),
                    formatButtonVisible: false,
                    titleCentered: true),
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: DateTime.now(),
                onDaySelected: (selectedDay, focusedDay) => dashboardPvr.onDaySelected(),
                onPageChanged: (focusedDay) => dashboardPvr.onPageChanged()),
            CommonSelectionButton(onTapOne: () {}, onTapTwo: () {})
          ]);
    });
  }
}
