import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:bhakti_app/config.dart';
import 'package:image_picker/image_picker.dart';
import 'package:bhakti_app/screens/home_screen/home_screen.dart';
import 'package:bhakti_app/common/extension/text_style_extensions.dart';

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

  // Future<void> readJson() async {
  //   final String response =
  //       await rootBundle.loadString('images/json/country.json');
  //
  //   final data = await json.decode(response);
  //
  //   countryItems = data;
  //   notifyListeners();
  // }

  //
  // onInit() {
  //   // readJson();
  //   dob.text = "";
  //   notifyListeners();
  // }

  Future<void> saveData(context) async {
    // final isValid = formKey.currentState!.validate();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const HomeScreen();
    }));
    // if (!isValid) {
    //   formKey.currentState!.save();
    //
    // } else {
    //   isLoading = true;
    //   notifyListeners();
    //   await postData().then((value) {
    //     final response = value;
    //     print("STATUS : ${response['StatusText']}");
    //     if (value != null) {
    //       isLoading = false;
    //       notifyListeners();
    //       showDialog(
    //           context: context,
    //           builder: (context) {
    //             return SimpleDialog(
    //                 title: Text(response['StatusText'],
    //                     style: appCss.dmDenseblack18),
    //                 children: [
    //                   TextButton(
    //                       onPressed: () {
    //                         Navigator.pop(context);
    //                       },
    //                       child: Text("Ok",
    //                           style: appCss.dmDenseblack16.textColor(
    //                               appColor(context).appTheme.primary)))
    //                 ]);
    //           });
    //     } else {
    //       isLoading = false;
    //       notifyListeners();
    //       log("SOMETHING WENT WRONG  :: $value");
    //     }
    //   });
    // }
  }

  // Future<dynamic> postData() async {
  //   String token =
  //       'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2FkaGFuYXNoZWV0LmNvbSIsImF1ZCI6ImNvbS5zYWRoYW5hcnJlY29yZC5iaGFrdGlzdGVwcyIsImlhdCI6MTY5MjQ1Mzc3MywiZXhwIjoxNzg3MDYxNzczLCJ1aWQiOiJ2VTAxRnpmSWFmZGl3bEFkWXVQMjVDeHdmMDMzIiwiYWtpZCI6NX0.7wHbzwQMYyqlglMbBomdEb5x2sVEWHWu6_xqg43BeMU';
  //
  //   Map<String, dynamic> body = {
  //     "name": name.text,
  //     "date_of_birth": dob.text,
  //     "gender": selectedGender == 1 ? "male" : "female",
  //     "email": emailId.text,
  //     "mobile_number": phoneNum.text,
  //     "country": countrySelected,
  //     "state": state.text,
  //     "city": city.text,
  //     "yatra_name": yatraName.text,
  //     "initiated": value,
  //     "initiated_name": initiatedName.text,
  //     "spiritual master": selectedItems,
  //     "intitiation_date": initiatedDate.text,
  //     "marital_status": selectedMarital == 1 ? "married" : "unmarried"
  //   };
  //
  //   print("BODY : $body");
  //   Map<String, String> headers = {
  //     'Content-Type': 'application/json',
  //     'Authorization': 'Bearer $token'
  //   };
  //   final msg = jsonEncode(body);
  //
  //   var response = await http.post(
  //     Uri.parse("https://api.sadhanasheet.com/v1/ProfileUpdate"),
  //     headers: headers,
  //     body: msg,
  //   );
  //
  //   // final response = await post(
  //   //     "https://api.sadhanasheet.com/v1/ProfileUpdate", body,
  //   //     headers: {
  //   //       'Content-Type': 'application/json',
  //   //       'Accept': 'application/json',
  //   //       'Authorization': 'Bearer $token',
  //   //     });
  //
  //   print("STATUS : ${response.statusCode}");
  //   print("BODY STATUS : ${response.body}");
  //   // debugPrint("STATUS : ${response.statusText}");
  //
  //   if (response.statusCode == 200) {
  //     return json.decode(response.body);
  //   } else {
  //     return null;
  //   }
  // }
}
