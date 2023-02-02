import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../api/api_dio_controller.dart';
import '../../model/user_model.dart';

class UserController extends GetxController {
  var ten = '';
  var userName = '';
  var password = '';
  var lop = '';
  var gioiTinh = '';
  var light = false.obs;

  @override
  void onInit() async {
    super.onInit();
  }

  Future<void> getInfoUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userPref = prefs.getString('user') ?? '';
    Map<String, dynamic> userMap = jsonDecode(userPref) as Map<String, dynamic>;
    ten = UserModel.fromJson(userMap).ten ?? '';
    userName = UserModel.fromJson(userMap).taiKhoan ?? '';
    lop = UserModel.fromJson(userMap).lop ?? '';
    gioiTinh = UserModel.fromJson(userMap).gioiTinh ?? '';
  }
}
