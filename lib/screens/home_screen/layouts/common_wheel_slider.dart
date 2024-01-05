import '../../../config.dart';
import '../../../customise/custom_wheel_sildersss/wheel_sliderssss.dart';

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              WheelSlider.number(
                horizontal: true,
                horizontalListWidth: 400.0,
                itemSize: 50.0,
                perspective: 0.002,
                totalCount: totalCount!,
                initValue: initValue!,
                unSelectedNumberStyle:
                const TextStyle(fontSize: 20, color: Colors.black54),
                selectedNumberStyle: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: appColor(context).appTheme.primary,
                ),
                currentIndex: currentIndex!,
                onValueChanged: onValueChanged!,
                interval: interval,
                squeeze: 0.9,
                pointerWidth: 40,
                pointerHeight: 40,
                isInfinite: false,
                isVibrate: true,
                allowPointerTappable: true,
              ),
              // Positioned(
              //  bottom: 0,
              //   child: Container(
              //     width: 20, // Adjust the width as needed
              //     height: 2,
              //     color: Colors.black, // Color of the horizontal line
              //   ),
              // ),Positioned(
              //  top: 0,
              //   child: Container(
              //     width: 20, // Adjust the width as needed
              //     height: 2,
              //     color: Colors.black, // Color of the horizontal line
              //   ),
              // ),

              // Positioned(
              //   right: 135,
              //   child: Container(
              //     width: 15,
              //     height: 2,
              //     color: Colors.black
              //   ),
              // ),
              // Positioned(
              //   left: 135,
              //   child: Container(
              //       width: 15,
              //       height: 2,
              //       color: Colors.black
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
