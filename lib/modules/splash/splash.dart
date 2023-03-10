import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holiscare/constant/routes.dart';
import 'package:holiscare/utils/colors.dart';
import 'package:holiscare/widget_custom/app_button.dart';
import '../../utils/global_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final globalController = Get.put(GlobalController(), permanent: true);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.lightPrimary,
        padding: const EdgeInsets.symmetric(vertical: 64.0),
        child: Column(
          children: [
            SizedBox(
              height: Get.height / 4,
            ),
            Expanded(
                child: Column(
              children: [
                Image.asset("assets/images/bg_image.png"),
              ],
            )),
            const SizedBox(
              height: 16.0,
            ),
            Row(
              children: [
                const Spacer(),
                Expanded(
                    child: AppButton(
                        title: 'Bắt đầu',
                        onPressed: () {
                          Future.delayed(const Duration(seconds: 0), () {
                            // Get.toNamed(kRouteIndex);
                            Get.toNamed(kAuth);
                          });
                        })),
                const Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
