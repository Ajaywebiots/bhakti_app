import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/screens/home_screen/ruler_picker/ruler_picker_bn.dart';

class CommonRulerPicker extends StatelessWidget {
  final ValueSetter<int> onChange;
  final int startValue;
  final int maxValue;
  const CommonRulerPicker({super.key, required this.onChange, required this.startValue, required this.maxValue});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 80,
        child: RulerPicker(
            onChange: onChange,
            background:
            Colors.white,
            lineColor:
            appColor(context)
                .appTheme
                .primary,
            direction:
            Axis.horizontal,
            startValue: startValue,
            maxValue: maxValue));
  }
}
