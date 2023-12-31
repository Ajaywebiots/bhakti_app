import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/services.dart';
import 'package:bhakti_app/config.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;
import 'package:bhakti_app/models/user_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bhakti_app/screens/home_screen/common_bottom_bar/common_bottom_bar.dart';

class SetUpProfileProvider extends ChangeNotifier {
  final TextEditingController name = TextEditingController();
  final TextEditingController dob = TextEditingController();
  final TextEditingController emailId = TextEditingController();
  final TextEditingController phoneNum = TextEditingController();
  final TextEditingController state = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController initiatedName = TextEditingController();
  final TextEditingController yatraName = TextEditingController();
  final TextEditingController initiatedDate = TextEditingController();
  final ImagePicker picker = ImagePicker();

  bool onChange = false;
  bool onChange1 = false;
  bool imgStatus = false;
  FirebaseStorage storage = FirebaseStorage.instance;

  XFile? image;
  int? selectedGender;
  int? selectedMarital;
  CountryCode? countryCode;
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

  List<String> masterItems = ['Gurunanak', 'Demo 2', 'Demo 3'];
  final formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
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

  onPersonalInfoExpansionChanged() {
    notifyListeners();
    onChange = !onChange;
  }

  onContactInfoExpansionChanged() {
    onChange1 = !onChange1;
  }

  cityValidator(value) {
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

  maleGender(value) {
    selectedGender = value!;
    notifyListeners();
  }

  femaleGender(value) {
    selectedGender = value!;
    notifyListeners();
  }

  initiatedNameValidator(value) {
    if (value!.isNotEmpty) {
      initiatedNameValid = null;
      notifyListeners();
      return null;
    }
  }

  nameValidator(value) {
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

  phoneNumValidator(value) {
    if (value!.isNotEmpty) {
      phoneNumberValid = null;
      notifyListeners();
      return null;
    }
    return null;
  }

  phoneOnChanged(value) {
    log("coudhsfjsdhf$value");
    countryCode = value;
    notifyListeners();
  }

  profilePicture(context) {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(children: [
            ListTile(
                onTap: () async {
                  Navigator.pop(context);
                  XFile? photo =
                      await picker.pickImage(source: ImageSource.camera);
                  imagePath = photo!.path;
                  imgStatus = true;
                  notifyListeners();
                },
                title: Text(appFonts.camera,style: appCss.dmDenseRegular14.textColor(appColor(context).appTheme.black)),
                leading: const Icon(Icons.camera_alt,color: Colors.black)),
            ListTile(
                onTap: () async {
                  Navigator.pop(context);
                  image = await picker.pickImage(source: ImageSource.gallery);
                  imagePath = image!.path;
                  imgStatus = true;
                  notifyListeners();
                },
                title: Text(appFonts.gallery,style: appCss.dmDenseRegular14.textColor(appColor(context).appTheme.black)),
                leading: const Icon(Icons.image,color: Colors.black))
          ]);
        });
  }

  stateValidator(value) {
    if (value!.isNotEmpty) {
      stateValid = null;
      notifyListeners();
      return null;
    }
  }

  countryOnChanged(value) {
    log("value :$value");
    countrySelected = value;
    notifyListeners();
  }

  Future<String> resizeAndEncodeImage(File imageFile) async {
    List<int> imageBytes = await imageFile.readAsBytes();
    img.Image image = img.decodeImage(Uint8List.fromList(imageBytes))!;
    img.Image resizedImage = img.copyResize(image, width: 512, height: 512);
    List<int> resizedImageBytes = img.encodePng(resizedImage);
    return base64Encode(resizedImageBytes);
  }

  // Future<void> getImageDimensions(File imageFile) async {
  //   Uint8List bytes = await imageFile.readAsBytes();
  //   ui.Codec codec = await ui.instantiateImageCodec(bytes);
  //
  //   ui.FrameInfo frameInfo = await codec.getNextFrame();
  //   int width = frameInfo.image.width;
  //   int height = frameInfo.image.height;
  //
  //   print("Image Width: $width");
  //   print("Image Height: $height");
  // }

  Future<void> saveData(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (formKey.currentState!.validate()) {
      showLoading(context);
      notifyListeners();
      try {
        String newUrl = "";
        if (image != null) {
          // await getImageDimensions(File(image!.path));
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
          "mobile_number":
              phoneNum.text.isNotEmpty ? "$countryCode-${phoneNum.text}" : "",
          "country": countrySelected['code'],
          "state": state.text,
          "city": city.text,
          "yatra_name": yatraName.text,
          "initiated": value,
          "initiated_name": initiatedName.text,
          "spiritual_master": selectedItems,
          "intitiation_date": initiatedDate.text,
          "marital_status": selectedMarital != null
              ? selectedMarital == 1
                  ? "married"
                  : "unmarried"
              : "",
          "profile_picture_url": newUrl == "" ? downloadUrl : newUrl
        };

        log("bodybody $body");
        log("dssf $downloadUrl");
        await apiServices
            .postApi(api.profileUpdate, body, isToken: true)
            .then((value) async {
          hideLoading(context);
          notifyListeners();
          if (value.isSuccess!) {
            pref.setString(session.user,
                json.encode(UserModel.fromJson(value.data['data'])));
            userModel = UserModel.fromJson(value.data['data']);
            newUrl = "";
            image = null;
            Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) {
                return const CommonBottomNavigationBar();
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
    await Future.delayed(DurationsClass.s1);
    userModel =
        UserModel.fromJson(json.decode(preferences!.getString(session.user)!));

    name.text = userModel!.name ?? "";
    initiatedName.text = userModel!.initiatedName ?? "";
    emailId.text = userModel!.email ?? "";
    dob.text = userModel!.dateOfBirth ?? "";
    selectedGender = userModel!.gender != null
        ? userModel!.gender == "male"
            ? 1
            : 2
        : 1;
    phoneNum.text = userModel!.mobileNumber ?? "";

    int index = countryItems.indexWhere((element) {
      return element['code'] == userModel!.country;
    });
    countrySelected =
        userModel!.country != null ? countryItems[index] : countryItems[0];
    state.text = userModel!.state ?? "";
    city.text = userModel!.city ?? "";
    yatraName.text = userModel!.yatraName ?? "Mathura";
    downloadUrl = userModel!.profilePictureUrl ?? "";
    selectedMarital = userModel!.maritalStatus != null
        ? userModel!.maritalStatus == "married"
            ? 1
            : 2
        : 1;
    selectedItems = userModel!.spiritualMaster ?? "Gurunanak";

    log(" asdasd:${name.text}");

    notifyListeners();
  }

  void pickUploadProfilePic() async {
    final image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxHeight: 512,
      maxWidth: 512,
      imageQuality: 90,
    );

    Reference ref = FirebaseStorage.instance.ref().child(image!.name);

    await ref.putFile(File(image.path));

    ref.getDownloadURL().then((value) async {
      notifyListeners();
      downloadUrl = value;
    });
  }

  Future<String> uploadImageToStorage(String childName) async {
    Reference ref = storage.ref().child(childName);
    UploadTask uploadTask = ref.putFile(File(image!.path));
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> saveImageData(context) async {
    String resp = "Some Error Occurred";
    try {
      String imageUrl = await uploadImageToStorage("ProfileImage");
      downloadUrl = imageUrl;
      notifyListeners();
      saveData(context);
    } catch (error) {
      resp = error.toString();
    }
    return resp;
  }
}
