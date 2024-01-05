import '../../../config.dart';
import '../../../customise/custom_wheel_sildersss/wheel_sliderssss.dart';

Widget buildChantingWheel(
    {required String title,
    required dynamic totalCount,
    required dynamic initValue,
    required dynamic currentIndex,
    required Function(dynamic) onValueChanged,
    context}) {
  return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
    Text(
      title,
      style:
          appCss.dmDenseMedium14.textColor(appColor(context).appTheme.primary),
    ),
    const VSpace(Insets.i15),
    SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, children: [
          WheelSlider.number(
              horizontal: true,
              horizontalListWidth: 400.0,
              itemSize: 50.0,
              perspective: 0.002,
              totalCount: totalCount,
              initValue: initValue,
              unSelectedNumberStyle:
                  const TextStyle(fontSize: 18, color: Colors.black54),
              selectedNumberStyle: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: appColor(context).appTheme.primary),
              currentIndex: currentIndex,
              onValueChanged: onValueChanged,
              interval: 1,
              squeeze: 0.9,
              pointerWidth: 40,
              pointerHeight: 40,
              isInfinite: false,
              isVibrate: true,
              allowPointerTappable: true)
        ]))
  ]);
}
