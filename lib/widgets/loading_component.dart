

import '../config.dart';


class LoadingComponent extends StatelessWidget {
  final Widget child;
  const LoadingComponent({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        child,
        Consumer<LoadingProvider>(builder: (context, ctrl, child) {
          return ctrl.isLoading == true
              ? Container(
            width: screenWidth,
            height: screenHeight,
            color: appColor(context).appTheme.darkText.withOpacity(0.2),
            child: const Center(
                child: CircularProgressIndicator()
            ),
          )
              : Container();
        },)
      ],
    );
  }
}