// import 'package:flutter/material.dart';
//
// import '../../../../customise/custom_wheel_silder/wheel_sliderssss.dart';
//
// class WheelSliderWithDouble extends StatefulWidget {
//   const WheelSliderWithDouble({super.key});
//
//   @override
//   State<WheelSliderWithDouble> createState() => _WheelSliderWithDoubleState();
// }
//
// class _WheelSliderWithDoubleState extends State<WheelSliderWithDouble> {
//   final int _totalCount = 10;
//   final num _initValue = 0.5;
//   num _currentValue = 0.5;
//
//   final int _nTotalCount = 100;
//   final num _nInitValue = 25.5;
//   num _nCurrentValue = 25.5;
//
//   final int _kTotalCount = 1000;
//   final num _kInitValue = 0.1;
//   num _kCurrentValue = 0.1;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           title: const Text(
//             'Wheel Slider',
//             style: TextStyle(
//               fontWeight: FontWeight.w600,
//               fontSize: 20.0,
//             ),
//           ),
//         ),
//         body: Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: SingleChildScrollView(
//                 physics: const BouncingScrollPhysics(),
//                 child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       WheelSlider.number(
//                           horizontal: true,
//                           horizontalListWidth: 300.0,
//                           itemSize: 50,
//                           perspective: 0.01,
//                           totalCount: _nTotalCount,
//                           initValue: _nInitValue,
//                           unSelectedNumberStyle: const TextStyle(
//                               fontSize: 16.0, color: Colors.black54),
//                           selectedNumberStyle: const TextStyle(
//                               fontSize: 20.0,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.redAccent),
//                           currentIndex: _nCurrentValue,
//                           onValueChanged: (val) {
//                             setState(() {
//                               _nCurrentValue = val;
//                             });
//                           },
//                           hapticFeedbackType: HapticFeedbackType.heavyImpact)
//                     ]))));
//   }
// }
//
