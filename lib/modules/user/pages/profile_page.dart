import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holiscare/model/user_model.dart';
import 'package:holiscare/modules/user/pages/tf_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constant/routes.dart';
import '../../../constant/constants.dart';
import '../../../utils/colors.dart';
import '../../../utils/global_controller.dart';
import '../../../widget_custom/app_bar.dart';
import '../../../widget_custom/touchable_opacity.dart';
import '../user_controller.dart';

class ProfilePage extends GetView<UserController> {
  ProfilePage({Key? key}) : super(key: key);
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final GlobalController globalController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Thông tin cá nhân',
        isBack: true,
      ),
      body: Container(
        color: AppColors.primary,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Container(
            width: Get.width,
            padding:
            const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Obx(() {
              return Column(
                children: <Widget>[
                  const SizedBox(
                    height: 15,
                  ),
                  CircleAvatar(
                      backgroundColor: AppColors.primary500,
                      minRadius: 40,
                      child: Text(
                        controller.ten[0].toUpperCase(),
                        style: TextStyle(
                          color: globalController.colorText.value,
                            fontSize: 30, fontWeight: FontWeight.bold),
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    width: Get.width,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            offset: const Offset(1, 2),
                            spreadRadius: 1,
                            blurRadius: 5)
                      ],
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.primary500,
                    ),
                    child: Column(
                      children: [
                        ProfileTextField(
                          // icon: Icon(Icons.person, color: Colors.black.withOpacity(0.4)),
                          labelText: "Họ và tên",
                          initValue: controller.ten,
                        ),
                        ProfileTextField(
                          labelText: "Tên đăng nhập",
                          initValue: controller.userName,
                        ),
                        ProfileTextField(
                          labelText: "Lớp",
                          initValue: controller.lop,
                        ),
                        ProfileTextField(
                          labelText: "Giới tính",
                          initValue: controller.gioiTinh,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
