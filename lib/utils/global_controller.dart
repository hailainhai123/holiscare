
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holiscare/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/routes.dart';
import '../constant/constants.dart';

class GlobalController extends GetxController {

  var userLogin = false.obs;
  var accessToken = "".obs;
  var colorChoose = Colors.black.obs;
  var bookIdFromNotification = '';
  var fontSizeText = [14.0, 16.0, 18.0, 20.0, 22.0, 24.0].obs;
  var fontSize = 14.0.obs;
  var isLogin = false.obs;
  var darkTheme = false.obs;
  var colorBackground = AppColors.lightPrimary.obs;
  var colorBackground500 = AppColors.lightPrimary500.obs;
  var colorText = Colors.black.obs;
  var isTeacher = true.obs;
  var nameStudent = ''.obs;
  var index = ''.obs;

  @override
  void onInit() async {
    await checkLogin();
    super.onInit();
  }


  Future<void> checkLogin() async {
    print('checklogin');
    await Future.delayed(const Duration(seconds: 1));
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final signIn = prefs.getBool(Constants.signedIn) ?? false;
    if (signIn) {
      Get.toNamed(kRouteIndex);
    } else {
      Get.toNamed(kSplash);
    }
  }

}
