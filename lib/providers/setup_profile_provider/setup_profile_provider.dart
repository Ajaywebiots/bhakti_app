import 'dart:convert';

import 'package:bhakti_app/config.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class SetUpProfileProvider extends ChangeNotifier {
  bool imgStatus = false;
  TextEditingController name = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController emailId = TextEditingController();
  TextEditingController phoneNum = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController yatraName = TextEditingController();
  TextEditingController initiatedName = TextEditingController();
  TextEditingController initiatedDate = TextEditingController();
  final ImagePicker picker = ImagePicker();
  int selectedGender = 1;
  int selectedMarital = 1;
  String imagePath = "";
  bool showError = false;
  bool validStatus = false;
  bool textError = false;

  bool value = false;
  bool valueFirst = true, isLoading = false;

  String? nameValid,
      dateValid,
      emailValid,
      phoneNumberValid,
      stateValid,
      cityValid,
      yatraNameValid,
      initiatedNameValid,
      initiatedDateValid;

  String countrySelected = "Afghanistan";
  String selectedItems = "Gurunanak";
  List<String> items = [
    'Gurunanak',
    'Demo 2',
    'Demo 3',
  ];
  final formKey = GlobalKey<FormState>();

  List countryItems = [];

  Future<void> readJson() async {
    final String response =
    await rootBundle.loadString('images/json/country.json');

    final data = await json.decode(response);

    countryItems = data;
 notifyListeners();
  }

  // @override
  // void onInit() {
  //   readJson();
  //   dob.text = "";
  //   update();
  //   super.onInit();
  // }

  Future<void> saveData() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      formKey.currentState!.save();
    } else {
      isLoading = true;
      notifyListeners();
      // await MyApiClient().postData().then((value) {
      //   final response = value;
      //   print("STATUS : ${response['StatusText']}");
      //   if (value != null) {
      //     isLoading = false;
      //     update();
      //     showDialog(
      //       context: Get.context!,
      //       builder: (context) {
      //         return SimpleDialog(
      //             title: Text(response['StatusText'],
      //                 style: AppCss1.dmSansblack18),
      //             children: [
      //               TextButton(
      //                   onPressed: () {
      //                     Navigator.pop(context);
      //                   },
      //                   child: Text(
      //                     fonts.ok,
      //                     style: AppCss1.dmSansblack16
      //                         .textColor(appCtrl.appTheme.primary),
      //                   )),
      //             ]);
      //       },
      //     );
      //   } else {
      //     isLoading = false;
      //     update();
      //     log("SOMETHING WENT WRONG  :: $value");
      //   }
      // });
    }
  }
}