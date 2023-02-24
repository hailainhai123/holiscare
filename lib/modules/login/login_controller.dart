import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holiscare/api/api_dio_controller.dart';
import 'package:holiscare/constant/routes.dart';
import 'package:holiscare/model/token_model.dart';
import 'package:holiscare/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constant/constants.dart';
import '../../utils/global_controller.dart';
import '../home/home_controller.dart';

class LoginController extends GetxController {
  final GlobalController globalController = Get.find();

  var user = UserModel().obs;
  var success = false.obs;
  var loading = false.obs;
  var name = ''.obs;
  var sex = ''.obs;
  var authen = AuthenticationResult().obs;


  @override
  void onInit() async {
    // await checkLogin();
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  Future<void> checkLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final signIn = await prefs.getBool(Constants.signedIn) ?? false;
    if (signIn) {
      Get.toNamed(kRouteIndex);
    }
  }

  Future<String> findStudent(String email) async {

    for (int index = 0; index < 5; index++) {
      if (email.toUpperCase() == Constants.listGmailStudent[index].toUpperCase()) {
        name.value = Constants.listNameStudent[index].toUpperCase();
        sex.value = Constants.listSexStudent[index].toUpperCase();
        globalController.index.value =  Constants.listIndexStudent[index];
      }
    }
    return name.value;
  }

  Future<void> onLogin(String email, String password, String fireBaseToken, String deviceId) async {
    try {
      var loginResponse = await ApiDioController.postLogin(email, password, fireBaseToken, deviceId);
      authen.value = loginResponse;
      globalController.tokenType.value = authen.value.tokenType!;
      globalController.token.value = authen.value.token!;
      if (authen.value.bundle!.attributes!.isNotEmpty) {
        globalController.idStudent.value = authen.value.bundle!.attributes![0].value ?? 0;
      }
    } catch (e) {
      print(e);
    }
  }
}
