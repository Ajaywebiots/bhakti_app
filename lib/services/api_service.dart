import 'dart:convert';
import 'package:http/http.dart' as http;
import 'error/exceptions.dart';



class ApiServices {
  // Future<void> loginWithApi(String phoneNumber, String otp) async {
  //   final response = await http.post(
  //     Uri.parse('https://api.sadhanasheet.com/v1/Login'),
  //     body: {
  //       'phoneNumber': phoneNumber,
  //       'otp': otp,
  //     },
  //   );
  //
  //   if (response.statusCode == 200) {
  //
  //   } else {
  //
  //   }
  // }

  // Future<APIDataClass> getApi(String apiName, List params,
  //     {isToken = false}) async {
  //   //default data to class
  //   APIDataClass apiData = APIDataClass(
  //     message: 'No data',
  //     isSuccess: false,
  //     data: '0',
  //   );
  //   //Check For Internet
  //   bool isInternet = await isNetworkConnection();
  //   if (!isInternet) {
  //     apiData.message = "No Internet Access";
  //     apiData.isSuccess = false;
  //     apiData.data = 0;
  //     return apiData;
  //   } else {
  //     log("URL: $apiName");
  //
  //     try {
  //       //dio.options.headers["authtoken"] = authtoken;
  //       SharedPreferences pref = await SharedPreferences.getInstance();
  //       String? token = pref.getString(session.accessToken);
  //       log("token : $token");
  //       var response = await dio.get(
  //         apiName,
  //         data: params,
  //         options: Options(headers: isToken ? headersToken(token) : headers),
  //       );
  //
  //       if (response.statusCode == 200) {
  //         //get response
  //         var responseData = response.data;
  //         log("$apiName Response: ${response.data}");
  //
  //         //set data to class
  //         apiData.message = responseData["message"] ?? "";
  //         apiData.isSuccess = true;
  //         apiData.data = apiName.contains("self")
  //             ? responseData['user']
  //             : responseData["data"];
  //         return apiData;
  //       } else {
  //         apiData.message = "No Internet Access";
  //         apiData.isSuccess = false;
  //         apiData.data = 0;
  //         return apiData;
  //       }
  //     } catch (e) {
  //       String message = e.toString();
  //       if (e.toString().contains("hostname")) message = "Server Error";
  //       apiData.message = message;
  //       apiData.isSuccess = false;
  //       apiData.data = 0;
  //
  //       return apiData;
  //     }
  //   }
  // }

  // Future<APIDataClass> postApi(String apiName, body, {isToken = false}) async {
  //   //default data to class
  //   APIDataClass apiData = APIDataClass(
  //     message: 'No data',
  //     isSuccess: false,
  //     data: '0',
  //   );
  //   //Check For Internet
  //   var connectivityResult = await (Connectivity().checkConnectivity());
  //   if (connectivityResult == ConnectivityResult.none) {
  //     apiData.message = "No Internet Access";
  //     apiData.isSuccess = false;
  //     apiData.data = 0;
  //     return apiData;
  //   } else {
  //     log("URL: $apiName");
  //
  //     //dio.options.headers["authtoken"] = authtoken;
  //     SharedPreferences pref = await SharedPreferences.getInstance();
  //     String? token = pref.getString(session.accessToken);
  //     log("AUTH : $token");
  //     log("AUTH : ${headersToken(token)}");
  //     try {
  //       final response = await dio.post(
  //         apiName,
  //         data: jsonEncode(body),
  //         options: Options(headers: isToken ? headersToken(token) : headers),
  //       );
  //       var responseData = response.data;
  //       log("response : $response");
  //       if (response.statusCode == 200) {
  //         //get response
  //
  //         if (apiName.contains("login") ||
  //             apiName.contains("register") ||
  //             apiName.contains("social/login") ||
  //             apiName.contains("social/verifyOtp")) {
  //           log("RESPONJSE : ${response.data}");
  //           await pref.setString(
  //               session.accessToken, responseData['access_token']);
  //           //set data to class
  //           apiData.message =
  //               apiName.contains("login") || apiName.contains("social/login")
  //                   ? "Login Successfully"
  //                   : "Register Successfully";
  //           apiData.isSuccess = true;
  //           apiData.data = "";
  //           return apiData;
  //         } else {
  //           //set data to class
  //           log("RESPONJSE :2 ${response.data}");
  //           apiData.message = responseData["message"] ?? "";
  //           apiData.isSuccess = true;
  //           apiData.data = responseData["data"];
  //           return apiData;
  //         }
  //       } else {
  //         log("RESPONJSE 1: ${response.data}");
  //         apiData.message = responseData["message"];
  //         apiData.isSuccess = false;
  //         apiData.data = 0;
  //         return apiData;
  //       }
  //     } catch (e) {
  //       if (e is DioException) {
  //         if (e.type == DioExceptionType.badResponse) {
  //           final response = e.response;
  //           if (response != null && response.data != null) {
  //             apiData.message = response.data['message'];
  //             apiData.isSuccess = false;
  //             apiData.data = 0;
  //             return apiData;
  //           } else {
  //             apiData.message = response!.data.toString();
  //             apiData.isSuccess = false;
  //             apiData.data = 0;
  //             return apiData;
  //           }
  //         } else {
  //           final response = e.response;
  //           if (response != null && response.data != null) {
  //             final Map responseData =
  //                 json.decode(response.data as String) as Map;
  //             apiData.message = responseData['message'] as String;
  //             apiData.isSuccess = false;
  //             apiData.data = 0;
  //             return apiData;
  //           } else {
  //             apiData.message = response!.statusCode.toString();
  //             apiData.isSuccess = false;
  //             apiData.data = 0;
  //             return apiData;
  //           }
  //         }
  //       } else {
  //         apiData.message = "";
  //         apiData.isSuccess = false;
  //         apiData.data = 0;
  //         return apiData;
  //       }
  //     }
  //   }
  // }
}

Exception handleErrorResponse(http.Response response) {
  var data = jsonDecode(response.body);

  return RemoteException(
    statusCode: response.statusCode,
    message: data['message'] ?? response.statusCode == 422
        ? 'Validation failed'
        : 'Server exception',
  );
}
