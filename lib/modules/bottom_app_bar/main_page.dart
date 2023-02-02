import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holiscare/modules/user/user_page.dart';
import 'package:holiscare/utils/global_controller.dart';
import '../data/students/health_data.dart';
import '../human_body/human_page.dart';
import '../home/home_page.dart';
import '../data/data_page.dart';
import 'navigation_bar.dart';
import 'navigation_controller.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);
  final navController = Get.find<NavController>();
  final globalController = Get.find<GlobalController>();
  final pagesTeacher = [
    HomePage(),
    DataPage(),
    Human3DPage(),
    UserPage(),
  ];

  final pagesStudent = [
    HealthData(),
    Human3DPage(),
    UserPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Obx(() {
        return globalController.isTeacher.value
            ? pagesTeacher[navController.currentIndex.value]
            : pagesStudent[navController.currentIndex2.value];
      }),
      bottomNavigationBar: NavigationBottomBar(),
    );
  }
}
