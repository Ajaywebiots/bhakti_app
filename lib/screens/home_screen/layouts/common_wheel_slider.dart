import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/customise/custom_wheel_sildersss/wheel_sliderssss.dart';

class CommonWheelSlider extends StatelessWidget {
  final int? totalCount;
  final int? initValue;
  final int? currentIndex;
  final int? interval;
  final Function(dynamic)? onValueChanged;

  const CommonWheelSlider({
    super.key,
    this.totalCount,
    this.initValue,
    this.currentIndex,
    this.onValueChanged,
    this.interval,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          WheelSlider.number(enableAnimation: true,animationDuration: const Duration(milliseconds: 50),
              horizontal: true,
              horizontalListWidth: 400.0,
              itemSize: 50.0,
              perspective: 0.002,
              totalCount: totalCount!,
              initValue: initValue!,
              unSelectedNumberStyle:
                  const TextStyle(fontSize: 18, color: Colors.black54),
              selectedNumberStyle: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: appColor(context).appTheme.primary),
              currentIndex: currentIndex!,
              onValueChanged: onValueChanged!,
              interval: interval,
              squeeze: 0.9,
              isInfinite: false,
              isVibrate: true),
          SvgPicture.asset(eSvgAssets.horizontalPointer)
        ]));
  }
}
