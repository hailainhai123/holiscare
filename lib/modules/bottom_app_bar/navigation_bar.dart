import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:holiscare/utils/colors.dart';
import 'package:holiscare/utils/global_controller.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../constant/icons_path.dart';
import '../../constant/theme.dart';
import 'navigation_controller.dart';

class BottomNav {
  final String icon;
  final String title;

  BottomNav({required this.icon, required this.title});
}

class NavigationBottomBar extends GetView<NavController> {
  NavigationBottomBar({Key? key}) : super(key: key);
  final GlobalController globalController = Get.find();

  final iconsTeacher = <BottomNav>[
    BottomNav(icon: IconsPath.navClassroomIcon, title: "Lớp học"),
    BottomNav(icon: IconsPath.navDataIcon, title: "Dữ liệu chung"),
    BottomNav(icon: IconsPath.navHumanIcon, title: "Mô hình cơ thể"),
    BottomNav(icon: IconsPath.navSettingsIcon, title: "Tài khoản"),
  ];

  final iconsStudent = <BottomNav>[
    BottomNav(icon: IconsPath.navDataIcon, title: "Dữ liệu chung"),
    BottomNav(icon: IconsPath.navHumanIcon, title: "Mô hình cơ thể"),
    BottomNav(icon: IconsPath.navSettingsIcon, title: "Tài khoản"),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        decoration: BoxDecoration(
          color: globalController.colorBackground.value,
        ),
        child: globalController.isTeacher.value
            ? SalomonBottomBar(
                currentIndex: controller.currentIndex.value,
                onTap: (i) => {controller.currentIndex.value = i},
                items: iconsTeacher
                    .asMap()
                    .map((i, e) => MapEntry(
                    i,
                    SalomonBottomBarItem(
                        title: Text(
                          e.title,
                          style:
                          const TextStyle(color: AppColors.black),
                        ),
                        selectedColor: AppColors.backgroundButton,
                        icon: Image.asset(
                          e.icon,
                          height: 30,
                          width: 30,
                          fit: BoxFit.fill,
                        ))))
                    .values
                    .toList())
            : SalomonBottomBar(
                currentIndex: controller.currentIndex2.value,
                onTap: (i) => {controller.currentIndex2.value = i},
                items: iconsStudent
                    .asMap()
                    .map((i, e) => MapEntry(
                    i,
                    SalomonBottomBarItem(
                        title: Text(
                          e.title,
                          style:
                          const TextStyle(color: AppColors.black),
                        ),
                        selectedColor: AppColors.backgroundButton,
                        icon: Image.asset(
                          e.icon,
                          height: 30,
                          width: 30,
                          fit: BoxFit.fill,
                        ))))
                    .values
                    .toList()),
      );
    });
  }
}
