import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holiscare/constant/routes.dart';
import 'package:holiscare/utils/colors.dart';

import '../../utils/global_controller.dart';
import '../../widget_custom/app_button.dart';

class DivideAuth extends StatefulWidget {
  const DivideAuth({Key? key}) : super(key: key);

  @override
  State<DivideAuth> createState() => _DivideAuthState();
}

class _DivideAuthState extends State<DivideAuth> {
  final GlobalController globalController = Get.find();
  bool checkColor1 = false;
  bool checkColor2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.lightPrimary,
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Spacer(),
            Image.asset("assets/images/icon_holiscare.png"),
            const SizedBox(
              height: 32,
            ),
            Text(
              'Bạn là giáo viên hay học sinh?'.toUpperCase(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18,),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () async {
                    setState(() {
                      checkColor1 = !checkColor1;
                    });
                  },
                  child: Container(
                    height: 180,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20.0)),
                        color: !checkColor1
                            ? AppColors.lightPrimary
                            : AppColors.lightPrimary500,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withAlpha(100),
                              blurRadius: 10.0),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              width: 100,
                              height: 100,
                              child: Image.asset(
                                "assets/images/icon_teacher.png",
                                fit: BoxFit.cover,
                              )),
                          const Text('Giáo viên'),
                          // const Icon(Icons.arrow_forward, color: AppColors.arrowBtn,)
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    setState(() {
                      checkColor2 = !checkColor2;
                    });
                  },
                  child: Container(
                    height: 180,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20.0)),
                        color: !checkColor2
                            ? AppColors.lightPrimary
                            : AppColors.lightPrimary500,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withAlpha(100),
                              blurRadius: 10.0),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              width: 100,
                              height: 100,
                              child: Image.asset(
                                "assets/images/icon_student.png",
                                fit: BoxFit.contain,
                              )),
                          const Text('Học sinh'),
                          // const Icon(Icons.arrow_forward, color: AppColors.arrowBtn,)
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Expanded(
              child: Row(
                children: [
                  const Spacer(),
                  Expanded(
                      child: AppButton(
                    title: 'Tiếp tục',
                    onPressed: () {
                      if (!checkColor1) {
                        globalController.isTeacher.value = false;
                      } else {
                        globalController.isTeacher.value = true;
                      }
                      if (checkColor1 != checkColor2) {
                        Get.toNamed(kLoginPage);
                      } else if (checkColor1 == false && checkColor2 == false){
                        Get.snackbar("Lỗi hệ thống", 'Vui lòng chọn vai trò sử dụng',
                            backgroundColor: Colors.white, colorText: Colors.black);
                      } else if (checkColor1 == true && checkColor2 == true) {
                        Get.snackbar("Lỗi hệ thống", 'Vui lòng chọn một vai trò sử dụng',
                            backgroundColor: Colors.white, colorText: Colors.black);
                      }
                    },
                  )),
                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
