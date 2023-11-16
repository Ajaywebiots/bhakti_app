import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/models/user_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/home_screen/home_screen.dart';

class UpdateProfileProvider extends ChangeNotifier {
  bool imgStatus = false;
  TextEditingController name = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController emailId = TextEditingController();
  TextEditingController phoneNum = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController yatraName = TextEditingController();
  TextEditingController initiatedName = TextEditingController();
  TextEditingController initiationDate = TextEditingController();
  final ImagePicker picker = ImagePicker();
  int selectedGender = 1;
  int selectedMarital = 1;
  String imagePath = "", downloadUrl = "";
  bool showError = false;
  bool validStatus = false;
  bool textError = false;
  XFile? image;

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

  dynamic countrySelected;
  SharedPreferences? preferences;
  UserModel? userModel;

  String spiritualSelectedItems = "Gurunanak";
  List<String> items = [
    'Gurunanak',
    'Demo 2',
    'Demo 3',
  ];
  final formKey = GlobalKey<FormState>();

  List countryItems = [];

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/countries.json');

    final data = await json.decode(response);

    countryItems = data;
    countrySelected = countryItems[0];
    notifyListeners();
  }

  Future<void> saveData(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (formKey.currentState!.validate()) {
      showLoading(context);
      notifyListeners();
      try {


String newUrl = "";
        Reference reference = FirebaseStorage.instance.ref().child(image!.name);
        var file = File(image!.path);
        UploadTask uploadTask = reference.putFile(file);

       await uploadTask.then((res)async {

         await res.ref.getDownloadURL().then((images) async {
            log("res : $images");
            newUrl = images;
            notifyListeners();
          }, onError: (err) {});
        });

        List<int> listData = utf8.encode(downloadUrl);
        String base64 = base64Encode(listData);

        log("dssf4444 sss $downloadUrl");
        log("dssf4444 $newUrl");
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
          "yatra_name": yatraName.text,
          "initiated": value,
          "initiated_name": initiatedName.text,
          "spiritual_master": spiritualSelectedItems,
          "intitiation_date": null,
          "marital_status": selectedMarital != null
              ? selectedMarital == 1
              ? "married"
              : "unmarried"
              : "",
          "profile_picture_url": newUrl
        };


        await apiServices
            .postApi(api.profileUpdate, body, isToken: true)
            .then((value) async {
          hideLoading(context);

          notifyListeners();
          if (value.isSuccess!) {
            pref.setString(session.user,
                json.encode(UserModel.fromJson(value.data['data'])));
            userModel = UserModel.fromJson(value.data['data']);
            notifyListeners();
            Navigator.pop(context);
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

  // Future<void> saveData(context) async {
  //   final isValid = formKey.currentState!.validate();
  //   if (!isValid) {
  //     formKey.currentState!.save();
  //   } else {
  //     isLoading = true;
  //     notifyListeners();
  //     isLoading = false;
  //   }
  // }

  onReady(context) async {
    readJson();
    // saveData(context);
    notifyListeners();
    preferences = await SharedPreferences.getInstance();
    await Future.delayed(Durations.s1);
    userModel =
        UserModel.fromJson(json.decode(preferences!.getString(session.user)!));
    log("USER MODEL ${userModel!.profilePictureUrl}");
    log(" asdasd:${userModel!.profilePictureUrl}");
    downloadUrl = userModel!.profilePictureUrl ?? "";
    name.text = userModel!.name ?? "";
    dob.text = userModel!.dateOfBirth ?? "";
    selectedGender = userModel!.gender != null
        ? userModel!.gender == "male"
            ? 1
            : 2
        : 1;
    emailId.text = userModel!.email ?? "";
    phoneNum.text = userModel!.mobileNumber ?? "";
    int index = countryItems.indexWhere((element) {
      return element['code'] == userModel!.country;
    });
    countrySelected =
        userModel!.country != null ? countryItems[index] : countryItems[0];
    state.text = userModel!.state ?? "";
    city.text = userModel!.city ?? "";
    yatraName.text = userModel!.yatraName ?? "";
    initiatedName.text = userModel!.initiatedName ?? "";
    value = userModel!.initiated ?? true;
    // spiritualSelectedItems = userModel!.spiritualMaster ?? "";
    initiationDate.text = userModel!.intitiationDate ?? "";
    selectedMarital = userModel!.maritalStatus != null
        ? userModel!.maritalStatus == "married"
            ? 1
            : 2
        : 1;

    notifyListeners();
  }
}
