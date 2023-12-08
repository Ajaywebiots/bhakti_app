import 'dart:io';
export 'package:bhakti_app/common/assets/index.dart';
export 'package:bhakti_app/common/extension/spacing.dart';
export 'package:bhakti_app/common/extension/text_style_extensions.dart';
export 'package:bhakti_app/common/extension/widget_extension.dart';
export 'package:bhakti_app/widgets/common_trailing_layout.dart';
export '../../../../routes/screen_list.dart';
export 'package:bhakti_app/widgets/common_auth_button.dart';
export '../../../../package_list.dart';
export 'package:bhakti_app/widgets/home_app_bar.dart';
export 'package:bhakti_app/widgets/stateful_wrapper.dart';
import 'package:bhakti_app/common/app_array.dart';
export 'package:intl_phone_field/country_picker_dialog.dart';
export 'package:intl_phone_field/intl_phone_field.dart';
export 'package:bhakti_app/customise/scrollable_positioned_list/scrollable_positioned_list.dart';
export 'package:bhakti_app/widgets/common_container.dart';
import 'package:bhakti_app/common/session.dart';
import 'package:bhakti_app/models/user_model.dart';
import 'package:bhakti_app/services/api_methods.dart';
export 'package:bhakti_app/screens/home_screen/drawer_screen/drawer_screen.dart';
export 'package:flutter/gestures.dart';
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
export '../providers/update_profile_provider.dart';

Session session = Session();
AppFonts appFonts = AppFonts();
NavigationClass route = NavigationClass();
ApiServices apiServices = ApiServices();
AppArray appArray = AppArray();

UserModel? userModel;

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
