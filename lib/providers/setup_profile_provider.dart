import 'dart:convert';
import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:bhakti_app/config.dart';
import 'package:image_picker/image_picker.dart';
import 'package:bhakti_app/models/user_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bhakti_app/screens/home_screen/home_screen.dart';

class SetUpUpdateProfileProvider extends ChangeNotifier {
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
  bool onChange = false;
  bool onChange1 = false;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  FirebaseStorage storage = FirebaseStorage.instance;
  XFile? image;
  int? selectedGender;
  int? selectedMarital;
  String imagePath = "", downloadUrl = "";
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
        List<int> listData = utf8.encode(downloadUrl);
        String base64 = base64Encode(listData);
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
          "profile_picture_url": base64
        };
        log("dssf $body");

        await apiServices
            .postApi(api.profileUpdate, body, isToken: true)
            .then((value) async {
          hideLoading(context);

          notifyListeners();
          if (value.isSuccess!) {
            pref.setString(session.user,
                json.encode(UserModel.fromJson(value.data['data'])));
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
    log("USER MODEL $userModel");
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

    int index = countryItems.indexWhere((element) {
      return element['code'] == userModel!.country;
    });
    countrySelected =
        userModel!.country != null ? countryItems[index] : countryItems[0];
    state.text = userModel!.state ?? "";
    city.text = userModel!.city ?? "";
    downloadUrl = userModel!.profilePictureUrl ?? "";

    notifyListeners();
  }
//
//   Future<String> uploadImageToStorage(String childName) async {
//     Reference ref = storage.ref().child(childName);
//     UploadTask uploadTask = ref.putFile(File(image!.path));
//     TaskSnapshot snapshot = await uploadTask;
//     String downloadUrl = await snapshot.ref.getDownloadURL();
//     return downloadUrl;
//   }
//
//   Future<String> saveImageData(context) async {
//     String resp = "Some Error Occurred";
//     try {
//       String imageUrl = await uploadImageToStorage("ProfileImage");
//       downloadUrl = imageUrl;
//       notifyListeners();
//       saveData(context);
//     } catch (error) {
//       resp = error.toString();
//     }
//     return resp;
//   }
}
