import 'dart:convert';
import 'dart:developer';
import 'package:bhakti_app/models/user_model.dart';
import 'package:bhakti_app/screens/home_screen/home_screen.dart';
import 'package:flutter/services.dart';
import 'package:bhakti_app/config.dart';
import 'package:image_picker/image_picker.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SetUpProfileProvider extends ChangeNotifier {
  bool imgStatus = false;
  TextEditingController name = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController emailId = TextEditingController();
  TextEditingController phoneNum = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController initiatedName = TextEditingController();
  TextEditingController initiatedDate = TextEditingController();
  final ImagePicker picker = ImagePicker();
  int? selectedGender;
  int? selectedMarital;
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

  String selectedItems = "Gurunanak";
  List<String> items = [
    'Gurunanak',
    'Demo 2',
    'Demo 3',
  ];
  final formKey = GlobalKey<FormState>();

  List countryItems = [];
  dynamic countrySelected;
  SharedPreferences? preferences;
  UserModel? userModel;

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/countries.json');
    final data = await json.decode(response);
    countryItems = data;
    countrySelected = countryItems[0];

    log("message :$countrySelected");
    notifyListeners();
  }

  onInit() {
    readJson();

    dob.text = "";
    notifyListeners();
  }

  Future<void> saveData(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (formKey.currentState!.validate()) {
      showLoading(context);
      notifyListeners();
      log("dob.text L ${dob.text}");
      try {
        Map<String, dynamic> body = {
          "name": name.text,
          "date_of_birth": dob.text,
          "gender": selectedGender != null
              ? selectedGender == 1
                  ? "male"
                  : "female"
              : "",
          "email": emailId.text,
          "mobile_number": phoneNum.text,
          "country": countrySelected['code'],
          "state": state.text,
          "city": city.text,
          "yatra_name": "yatraName.text",
          "initiated": value,
          "initiated_name": initiatedName.text,
          "spiritual_master": selectedItems,
          "intitiation_date": null,
          "marital_status": selectedMarital != null
              ? selectedMarital == 1
                  ? "married"
                  : "unmarried"
              : "",
          "profile_picture_url": "https://firebase_file_upload_url"
        };
        log("dssf $body");

        await apiServices
            .postApi(api.profileUpdate, body, isToken: true)
            .then((value) async {
          hideLoading(context);

          notifyListeners();
          if (value.isSuccess!) {
            pref.setString(
                session.user, json.encode(UserModel.fromJson(value.data['data'])));
            Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) {
                return const HomeScreen();
              },
            ));
          } else {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(value.message)));
          }
        });

      } catch (e) {
        hideLoading(context);
        notifyListeners();
        log("CATCH : $e");
      }
    }
  }

  onReady(context) async {
    readJson();
    notifyListeners();
    preferences = await SharedPreferences.getInstance();

//Map user = json.decode(preferences!.getString(session.user)!);
    await Future.delayed(Durations.s1);
    userModel =
        UserModel.fromJson(json.decode(preferences!.getString(session.user)!));
    log(" asdasd:${userModel!.email}");
    name.text = userModel!.name ?? "";
    initiatedName.text = userModel!.initiatedName ?? "";
    emailId.text = userModel!.email ?? "";
    dob.text = userModel!.dateOfBirth ?? "";
    selectedGender = userModel!.gender != null
        ? userModel!.gender == "male"
            ? 1
            : 2
        : 1;
    city.text = userModel!.mobileNumber ?? "";
log("countryItems : $countryItems");
      int index= countryItems.indexWhere((element){
        log("df : $element");
        return element['code'] == userModel!.country;
      });
    countrySelected = userModel!.country != null ? countryItems[index] : countryItems[0];
    state.text = userModel!.state ?? "";
    city.text = userModel!.city ?? "";

    notifyListeners();
  }
}
