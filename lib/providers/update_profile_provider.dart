import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/models/user_model.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  final focusNode = FocusNode();
  CountryCode? countryCode;

  String? code;
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
  List<String> items = ['Gurunanak', 'Demo 2', 'Demo 3'];
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

  Future<String> resizeAndEncodeImage(File imageFile) async {
    List<int> imageBytes = await imageFile.readAsBytes();
    img.Image image = img.decodeImage(Uint8List.fromList(imageBytes))!;
    img.Image resizedImage = img.copyResize(image, width: 512, height: 512);
    List<int> resizedImageBytes = img.encodePng(resizedImage)!;
    return base64Encode(resizedImageBytes);
  }

  List<String>? splitPhoneNum;

  List<String>? myFunction() {
    notifyListeners();
    String phoneNumber = phoneNum.text;
    splitPhoneNum = phoneNumber.split('+91-');
    print("lalala $phoneNumber");
    print("lalala ${splitPhoneNum![1]}");

    return splitPhoneNum;
  }

  Future<void> saveData(context) async {
    var sssss = phoneNum.text.contains("$countryCode-");
    log("asdasdasdad$sssss");
    //   myFunction();
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (formKey.currentState!.validate()) {
      showLoading(context);
      notifyListeners();
      try {
        log("image : $image");
        String newUrl = "";
        if (image != null) {
          String base64Image = await resizeAndEncodeImage(File(image!.path));
          newUrl = base64Image;
          Reference reference =
              FirebaseStorage.instance.ref().child(image!.name);
          var file = File(image!.path);
          UploadTask uploadTask = reference.putFile(file);
          await uploadTask.then((res) async {
            await res.ref.getDownloadURL().then((images) async {
              log("res : $images");
              newUrl = images;
              notifyListeners();
            }, onError: (err) {});
          });
        }

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
          "mobile_number": "${countryCode!.dialCode}-${phoneNum.text}",
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
          "profile_picture_url": newUrl == "" ? downloadUrl : newUrl
        };
        log("country code in map${body!}");
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
            newUrl = "";
            image = null;
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

  cameraButton(context) async {
    Navigator.pop(context);
    XFile? photo = await picker.pickImage(source: ImageSource.camera);
    imagePath = photo!.path;
    imgStatus = true;
    notifyListeners();
  }

  cityTextField(value) {
    if (value!.isNotEmpty) {
      cityValid = null;
      notifyListeners();
      return null;
    }
  }

  dobValidator(value) {
    if (value!.isNotEmpty) {
      dateValid = null;
      notifyListeners();
      return null;
    }
  }

  femaleGender(value) {
    selectedGender = value!;
    notifyListeners();
  }

  initiatedDateValidator(value) {
    if (value!
        .isNotEmpty) /*{
                  initiatedDateValid = 'Enter a Initiated Date!';
                  notifyListeners();
                  return 'Enter a Initiated Date!';
                } else*/
    {
      initiatedDateValid = null;
      notifyListeners();
      return null;
    }
  }

  initiatedNameValidator(value) {
    if (value!.isNotEmpty) {
      initiatedNameValid = null;
      notifyListeners();
      return null;
    }
  }

  yesCheckBox() {
    value = !value;
    if (value = true) {
      valueFirst = false;
    } else {
      valueFirst = true;
    }
    notifyListeners();
  }

  marriedChanged(value) {
    selectedMarital = value!;
    showError = false;
    notifyListeners();
  }

  unMarriedChanged(value) {
    selectedMarital = value!;
    notifyListeners();
  }

  nameTextField(value) {
    if (value!.isEmpty) {
      nameValid = appFonts.enterCorrectName;
      notifyListeners();
      return appFonts.enterCorrectName;
    } else {
      nameValid = null;
      notifyListeners();
      return null;
    }
  }

  phoneNumberValidator(value) {
    if (value!.isNotEmpty) {
      phoneNumberValid = null;
      notifyListeners();
      return null;
    }
    return null;
  }

  countryCodeOnChanged(value) {
    countryCode = value;
    notifyListeners();
  }

  spiritualOnChanged(newValue) {
    spiritualSelectedItems = newValue!;
    notifyListeners();
  }

  selectState(value) {
    if (value!.isNotEmpty) {
      stateValid = null;
      notifyListeners();
      return null;
    }
  }

  yatraNameValidator(value) {
    if (value!.isNotEmpty) {
      /*  profilePvr.yatraNameValid = 'Enter a Yatra Name!';
                  profilePvr.notifyListeners();
                  return 'Enter a Yatra Name!';
                } else {*/
      yatraNameValid = null;
      notifyListeners();
      return null;
    }
  }

  profilePicUpdate(context) {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(children: [
            ListTile(
                onTap: () => cameraButton(context),
                title: Text(appFonts.camera,style: appCss.dmDenseRegular14.textColor(appColor(context).appTheme.black)),
                leading: const Icon(Icons.camera_alt,color: Colors.black)),
            ListTile(
                onTap: () => galleryButton(context),
                title: Text(appFonts.gallery,style: appCss.dmDenseRegular14.textColor(appColor(context).appTheme.black)),
                leading: const Icon(Icons.image,color: Colors.black))
          ]);
        });
  }

  noCheckBox() {
    valueFirst = !valueFirst;
    if (valueFirst = true) {
      value = false;
    } else {
      value = true;
    }
    notifyListeners();
  }

  maleGender(value) {
    selectedGender = value!;
    notifyListeners();
  }

  emailValidator(value) {
    if (value!.isNotEmpty &&
        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) {
      emailValid = appFonts.enterValidEmail;
      notifyListeners();
      return 'Enter a valid email!';
    } /*else {
                  emailValid = null;
                  notifyListeners();
                  return null;
                }*/
  }

  dobTextPicker(context) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1886),
        lastDate: DateTime.now(),
        builder: (context, child) {
          return Theme(
              data: Theme.of(context).copyWith(
                  dialogTheme: DialogTheme(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                  colorScheme: ColorScheme.light(
                      primary: appColor(context).appTheme.primary,
                      onSurface: Colors.black,
                      error: Colors.red),
                  textButtonTheme: TextButtonThemeData(
                      style: TextButton.styleFrom(
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                          primary: appColor(context).appTheme.whiteColor,
                          backgroundColor: appColor(context).appTheme.primary,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))))),
              child: child!);
        });

    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      dob.text = formattedDate;
      notifyListeners();
    } else {}
  }

  selectCountry() {
    log("value :$value");
    countrySelected = value;
    notifyListeners();
  }

  galleryButton(context) async {
    Navigator.pop(context);
    image = await picker.pickImage(source: ImageSource.gallery);
    imagePath = image!.path;
    imgStatus = true;
    notifyListeners();
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
    await Future.delayed(DurationsClass.s1);
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
    String phone = userModel!.mobileNumber ?? "";
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
    countryCode = CountryCode(dialCode: phone.split("-")[0]);
    phoneNum.text = phone.split("-")[1];

    log("DHRUVIIII :${CountryCode(dialCode: phone.split("-")[0])}");
    log("DHRUVIIII :$countryCode");

    notifyListeners();
  }
}
