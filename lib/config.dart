import 'dart:io';

import 'package:bhakti_app/common/session.dart';
import 'package:bhakti_app/services/api_methods.dart';
import 'package:bhakti_app/services/api_service.dart';
import 'package:bhakti_app/utils/helper/navigation_class.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'common/app_fonts.dart';
import 'config.dart';
export 'package:flutter/material.dart';
export '../common/theme/app_css.dart';
export '../routes/index.dart';
export '../common/theme/theme_service.dart';
export 'package:provider/provider.dart';
export '../providers/index.dart';

Session session = Session();
AppFonts appFonts = AppFonts();
NavigationClass route = NavigationClass();
ApiServices apiServices = ApiServices();

// Validation validation = Validation();
AppCss appCss = AppCss();
// ApiServices apiServices = ApiServices();
ApiMethods api = ApiMethods();



ThemeService appColor(context) {
  final themeServices = Provider.of<ThemeService>(context, listen: false);
  return themeServices;
}

showLoading(context) async {
  Provider.of<LoadingProvider>(context, listen: false).showLoading();
}

hideLoading(context) async {
  Provider.of<LoadingProvider>(context, listen: false).hideLoading();
}

Future<bool> isNetworkConnection() async {
  var connectivityResult = await Connectivity()
      .checkConnectivity(); //Check For Wifi or Mobile data is ON/OFF
  if (connectivityResult == ConnectivityResult.none) {
    return false;
  } else {
    final result = await InternetAddress.lookup(
        'google.com'); //Check For Internet Connection
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
