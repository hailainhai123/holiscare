import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holiscare/api/api_dio_controller.dart';
import 'package:holiscare/constant/routes.dart';
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
}
