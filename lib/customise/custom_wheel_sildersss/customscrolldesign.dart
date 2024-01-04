import 'package:flutter/material.dart';
import 'package:bhakti_app/config.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State createState() => _MyHomePageState();
}

enum ScrollingList {
  none,
  left,
  right,
}

class _MyHomePageState extends State<MyHomePage> {
  late final ScrollController _controllerLeft;
  late final ScrollController _controllerRight;
  var scrollingList = ScrollingList.none;

  @override
  void initState() {
    super.initState();
    _controllerLeft = ScrollController();
    _controllerRight = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Container(height: 100,width:double.infinity,
        //   child: ListView(
        //     scrollDirection: Axis.horizontal,
        //     children: [
        //       Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           Container(color: Colors.black,height: 50,width: 3,),
        //           HSpace(Insets.i8),
        //           Container(color: Colors.black,height: 25,width: 3,),
        //           HSpace(Insets.i8),
        //           Container(color: Colors.black,height: 25,width: 3,),
        //           HSpace(Insets.i8),
        //           Container(color: Colors.black,height: 25,width: 3,),
        //           HSpace(Insets.i8),
        //           Container(color: Colors.black,height: 25,width: 3,),
        //           HSpace(Insets.i8),
        //           Container(color: Colors.black,height: 50,width: 3,),
        //           HSpace(Insets.i8),
        //           Container(color: Colors.black,height: 25,width: 3,),
        //           HSpace(Insets.i8),
        //           Container(color: Colors.black,height: 25,width: 3,),
        //           HSpace(Insets.i8),
        //           Container(color: Colors.black,height: 25,width: 3,),
        //           HSpace(Insets.i8),
        //           Container(color: Colors.black,height: 25,width: 3,),
        //           HSpace(Insets.i8),
        //           Container(color: Colors.black,height: 50,width: 3,),
        //           HSpace(Insets.i8),
        //           Container(color: Colors.black,height: 25,width: 3,),
        //           HSpace(Insets.i8),
        //           Container(color: Colors.black,height: 25,width: 3,),
        //           HSpace(Insets.i8),
        //           Container(color: Colors.black,height: 25,width: 3,),
        //           HSpace(Insets.i8),
        //           Container(color: Colors.black,height: 25,width: 3,),
        //           HSpace(Insets.i8),
        //           Container(color: Colors.black,height: 50,width: 3,),
        //           HSpace(Insets.i8),
        //           Container(color: Colors.black,height: 25,width: 3,),
        //           HSpace(Insets.i8),
        //           Container(color: Colors.black,height: 25,width: 3,),
        //           HSpace(Insets.i8),
        //           Container(color: Colors.black,height: 25,width: 3,),
        //           HSpace(Insets.i8),
        //           Container(color: Colors.black,height: 25,width: 3,),
        //           HSpace(Insets.i8),
        //           Container(color: Colors.black,height: 50,width: 3,),
        //           HSpace(Insets.i8),
        //           Container(color: Colors.black,height: 25,width: 3,),
        //           HSpace(Insets.i8),
        //           Container(color: Colors.black,height: 25,width: 3,),
        //           HSpace(Insets.i8),
        //           Container(color: Colors.black,height: 25,width: 3,),
        //           HSpace(Insets.i8),
        //           Container(color: Colors.black,height: 25,width: 3,),
        //           HSpace(Insets.i8),
        //           Container(color: Colors.black,height: 50,width: 3,),
        //           HSpace(Insets.i8),
        //           Container(color: Colors.black,height: 25,width: 3,),
        //           HSpace(Insets.i8),
        //           Container(color: Colors.black,height: 25,width: 3,),
        //           HSpace(Insets.i8),
        //           Container(color: Colors.black,height: 25,width: 3,),
        //           HSpace(Insets.i8),
        //           Container(color: Colors.black,height: 25,width: 3,),
        //           HSpace(Insets.i8),
        //           Container(color: Colors.black,height: 50,width: 3,),
        //           HSpace(Insets.i8),
        //           Container(color: Colors.black,height: 25,width: 3,),
        //           HSpace(Insets.i8),
        //           Container(color: Colors.black,height: 25,width: 3,),
        //           HSpace(Insets.i8),
        //           Container(color: Colors.black,height: 25,width: 3,),
        //           HSpace(Insets.i8),
        //           Container(color: Colors.black,height: 25,width: 3,),
        //           HSpace(Insets.i8),
        //           Container(color: Colors.black,height: 50,width: 3,),
        //           HSpace(Insets.i8),
        //           Container(color: Colors.black,height: 25,width: 3,),
        //           HSpace(Insets.i8),
        //           Container(color: Colors.black,height: 25,width: 3,),
        //           HSpace(Insets.i8),
        //           Container(color: Colors.black,height: 25,width: 3,),
        //           HSpace(Insets.i8),
        //           Container(color: Colors.black,height: 25,width: 3,),
        //           HSpace(Insets.i8),
        //           Container(color: Colors.black,height: 50,width: 3,),
        //           HSpace(Insets.i8),
        //           Container(color: Colors.black,height: 25,width: 3,),
        //           HSpace(Insets.i8),
        //           Container(color: Colors.black,height: 25,width: 3,),
        //           HSpace(Insets.i8),
        //           Container(color: Colors.black,height: 25,width: 3,),
        //           HSpace(Insets.i8),
        //           Container(color: Colors.black,height: 25,width: 3,),
        //           HSpace(Insets.i8),
        //           Container(color: Colors.black,height: 50,width: 3,),
        //           HSpace(Insets.i8),
        //           Container(color: Colors.black,height: 25,width: 3,),
        //           HSpace(Insets.i8),
        //           Container(color: Colors.black,height: 25,width: 3,),
        //           HSpace(Insets.i8),
        //           Container(color: Colors.black,height: 25,width: 3,),
        //           HSpace(Insets.i8),
        //           Container(color: Colors.black,height: 25,width: 3,),
        //           HSpace(Insets.i8),
        //           Container(color: Colors.black,height: 50,width: 3,),
        //           HSpace(Insets.i8),
        //           Container(color: Colors.black,height: 25,width: 3,),
        //           HSpace(Insets.i8),
        //           Container(color: Colors.black,height: 25,width: 3,),
        //           HSpace(Insets.i8),
        //           Container(color: Colors.black,height: 25,width: 3,),
        //           HSpace(Insets.i8),
        //           Container(color: Colors.black,height: 25,width: 3,),
        //           HSpace(Insets.i8),
        //           Container(color: Colors.black,height: 50,width: 3,),
        //         ],
        //       )
        //     ],
        //   ),
        // ),

        Row(
          children: [
            Container(width: 50, child: const Text("1")),
            Container(width: 50, child: const Text("1")),
            Container(width: 50, child: const Text("1")),
            Container(width: 50, child: const Text("1")),
            Container(width: 50, child: const Text("1")),
          ],
        ),
        Container(
            height: 100,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(color: Colors.black, height: 50, width: 3),
                        const HSpace(Insets.i8),
                        Container(color: Colors.black, height: 25, width: 3),
                        const HSpace(Insets.i8),
                        Container(color: Colors.black, height: 25, width: 3),
                        const HSpace(Insets.i8),
                        Container(color: Colors.black, height: 25, width: 3),
                        const HSpace(Insets.i8),
                        Container(color: Colors.black, height: 25, width: 3),
                        const HSpace(Insets.i8)
                      ]);
                })),


        /*   Container(
          height: 20.0,
          child: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification is ScrollStartNotification) {
                if (scrollingList == ScrollingList.none) {
                  scrollingList = ScrollingList.left;
                }
              } else if (notification is ScrollEndNotification) {
                if (scrollingList == ScrollingList.left) {
                  scrollingList = ScrollingList.none;
                }
              }
              if (scrollingList == ScrollingList.left) {
                _controllerRight.jumpTo(_controllerLeft.offset);
              }
              return true;
            },
            child: ListView.builder(
              itemCount: null,
              controller: _controllerLeft,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                int actualIndex = index % 50;
                double lineHeight = actualIndex % 5 == 0
                    ? 50
                    : 12; // Set count to 12 for big line length
                String paddedIndex =
                    (actualIndex ~/ 5 + 1).toString().padLeft(2, '0');
                return lineHeight == 50
                    ? Container(
                            width: 60,
                            color: Colors.black,
                            child: Text('$paddedIndex',
                                style: appCss.dmDenseMedium12.textColor(
                                    appColor(context).appTheme.whiteColor)))
                        .marginOnly(right: 2)
                    : Container();
              },
            ),
          ),
        ),

        Container(
          height: 70.0,
          child: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification is ScrollStartNotification) {
                if (scrollingList == ScrollingList.none) {
                  scrollingList = ScrollingList.right;
                }
              } else if (notification is ScrollEndNotification) {
                if (scrollingList == ScrollingList.right) {
                  scrollingList = ScrollingList.none;
                }
              }
              if (scrollingList == ScrollingList.right) {
                _controllerLeft.jumpTo(_controllerRight.offset);
              }
              return true;
            },
            child: ListView.builder(
              itemCount: null,
              controller: _controllerRight,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                int actualIndex = index % 50;
                double lineHeight = actualIndex % 5 == 0 ? 50 : 25;
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: Center(
                    child: lineHeight == 50
                        ? Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(5),
                              ),
                              color: appColor(context).appTheme.primary,
                            ),
                            height: lineHeight,
                            width: 3,
                          )
                        : Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(5),
                              ),
                              color: appColor(context).appTheme.primary,
                            ),
                            height: lineHeight,
                            width: 3,
                          ),
                  ),
                );
              },
            ),
          ),

        ),*/
      ],
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:numberpicker/numberpicker.dart';
//
// class NumberPage extends StatefulWidget {
//   const NumberPage({super.key});
//
//   @override
//   State<NumberPage> createState() => _NumberPageState();
// }
//
// class _NumberPageState extends State<NumberPage> {
//   var hour = 0;
//   var minute = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           // Text(
//           //     "Pick Your Time! ${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, "0")}",
//           //     style:
//           //         const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
//
//           Container(
//             height: 200,
//             width: double.infinity,
//             decoration: BoxDecoration(
//                 color: Colors.black87, borderRadius: BorderRadius.circular(10)),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Column(
//                   children: [
//                     const Text("Count of Rounds",
//                         style: TextStyle(color: Colors.white)),
//                     NumberPicker(
//                       itemCount: 5,
//                       minValue: 0,
//                       maxValue: 100,
//                       value: hour,
//                       axis: Axis.horizontal,
//                       // zeroPad: true,
//                       infiniteLoop: true,
//                       itemWidth: 90,
//                       itemHeight: 80,
//                       onChanged: (value) {
//                         setState(() {
//                           hour = value;
//                         });
//                       },
//                       textStyle:
//                           const TextStyle(color: Colors.grey, fontSize: 20),
//                       selectedTextStyle:
//                           const TextStyle(color: Colors.white, fontSize: 30),
//                     ),
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     const Text("Chanting Quality Rating",
//                         style: TextStyle(color: Colors.white)),
//                     NumberPicker(
//                       itemCount: 5,
//                       axis: Axis.horizontal,
//                       minValue: 0,
//                       maxValue: 100,
//                       value: minute,
//                       // zeroPad: true,
//                       infiniteLoop: true,
//                       itemWidth: 80,
//                       itemHeight: 80,
//                       onChanged: (value) {
//                         setState(() {
//                           minute = value;
//                         });
//                       },
//                       textStyle:
//                           const TextStyle(color: Colors.grey, fontSize: 20),
//                       selectedTextStyle:
//                           const TextStyle(color: Colors.white, fontSize: 30),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
