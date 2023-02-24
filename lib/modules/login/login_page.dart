import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holiscare/constant/constants.dart';
import 'package:holiscare/modules/login/login_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constant/routes.dart';
import '../../utils/colors.dart';
import '../../utils/global_controller.dart';
import '../../utils/icons.dart';
import '../../widget_custom/app_input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _classController = TextEditingController();

  final LoginController controller = Get.find();
  final GlobalController globalController = Get.find();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _classController.dispose();
    super.dispose();
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        AppInput(
          controller: _emailController,
          validator: (phoneNumber) {
            if (phoneNumber == null || phoneNumber.trim().isEmpty) {
              return '';
            }
            return null;
          },
          // autofocus: true,
          enabled: true,
          hintText: 'Email',
          iconLeft: IconEnums.mail,
          onTapIconRight: () async {
            _emailController.clear();
          },
          enableInteractiveSelection: false,
          iconRight: IconEnums.close,
        ),
        const SizedBox(
          height: 16.0,
        ),
        AppInput(
          controller: _passwordController,
          maxLine: 1,
          validator: (password) {
            if (password == null || password.isEmpty) {
              return '';
            }
            return null;
          },
          hintText: 'Mật khẩu',
          iconLeft: IconEnums.lock,
          obscureText: true,
          // onChangeValue: _loginStore.onChangePassword,
        ),
      ],
    );
  }

  Widget _submitButton(
    String buttonText,
  ) {
    return InkWell(
      onTap: () async {
        await controller.onLogin(
            _emailController.text, _passwordController.text, '', "");
        if (controller.authen.value.roles![0] == 'TEACHER') {
          if (globalController.role.value == 'TEACHER') {
            globalController.isTeacher.value = true;
            Get.snackbar('Thông báo', 'Đăng nhập thành công',
                snackPosition: SnackPosition.TOP);
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setBool(Constants.signedIn, true);
            await prefs.setBool(Constants.isTeacher, true);
            await prefs.setString(Constants.tokenType, controller.authen.value.tokenType!);
            await prefs.setString(Constants.token, controller.authen.value.token!);
            await prefs.setInt(Constants.studentId, controller.authen.value.bundle!.attributes![0].value ?? 1);
            Get.toNamed(kRouteIndex);
          } else {
            Get.snackbar('Thông báo', 'Đăng nhập thất bại',
                snackPosition: SnackPosition.TOP);
            return;
          }
        } else if (controller.authen.value.roles![0] == 'STUDENT') {
          if (globalController.role.value == 'STUDENT') {
            globalController.isTeacher.value = false;
            Get.snackbar('Thông báo', 'Đăng nhập thành công',
                snackPosition: SnackPosition.TOP);
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setBool(Constants.signedIn, true);
            await prefs.setBool(Constants.isTeacher, false);
            await prefs.setString(Constants.tokenType, controller.authen.value.tokenType!);
            await prefs.setString(Constants.token, controller.authen.value.token!);
            await prefs.setInt(Constants.studentId, controller.authen.value.bundle!.attributes![0].value ?? 1);
            Get.toNamed(kRouteIndex);
          } else {
            Get.snackbar('Thông báo', 'Đăng nhập thất bại',
                snackPosition: SnackPosition.TOP);
            return;
          }
        } else {
          Get.snackbar('Thông báo', 'Đăng nhập thất bại',
              snackPosition: SnackPosition.TOP);
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: const Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  AppColors.backgroundButton,
                  AppColors.backgroundButton
                ])),
        child: Text(
          buttonText,
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        color: AppColors.lightPrimary,
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 32.0,
              ),
              Image.asset("assets/images/bg_image.png"),
              _emailPasswordWidget(),
              const SizedBox(
                height: 32.0,
              ),
              _submitButton(
                'Đăng nhập',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
