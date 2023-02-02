import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holiscare/model/user_model.dart';
import '../../api/api_dio_controller.dart';
import '../bottom_app_bar/navigation_controller.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  final RxDouble opacity = 0.0.obs;
  final RxDouble bgHeight = kBgHeight.obs;
  late ScrollController scrollController;
  late TabController tabController;
  int currentIndex = 0;
  late Timer timer;
  var listIdStation = <String>[].obs;

  var listIdDevice = <String>[].obs;
  var idStation = ''.obs;
  var idDevice = ''.obs;
  var nameDevice = ''.obs;
  var nameStation = ''.obs;
  var color = Colors.black.obs;
  var userModel = UserModel().obs;
  var isOzone = true.obs;
  var title = ''.obs;
  var index = ''.obs;


  @override
  void onInit() {
    scrollController = ScrollController();
    initData();
    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (currentIndex < tabController.length - 1) {
        currentIndex++;
      } else {
        currentIndex = 0;
      }
      tabController.animateTo(
        currentIndex,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    bgHeight.value = 200.0;
    scrollController.addListener(onScrolling);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
    scrollController.dispose();
  }

  refreshController() {
    bgHeight.value = 200.0;
    scrollController.dispose();
    scrollController = ScrollController();
    scrollController.addListener(onScrolling);
  }

  Future<void> initData() async {
    tabController = TabController(length: 4, vsync: this);
    // await getListStation();
    // await getListDeviceForIdStation(idStation.value);
  }

  onScrolling() {
    calculateBgHeight();
    calculateAppbarOpacity();
  }

  calculateAppbarOpacity() {
    double opa = (1 - 0.006 * scrollController.offset).clamp(0.0, 1.0);
    opacity.value = 1 - opa;
  }

  calculateBgHeight() {
    bgHeight.value =
        (kBgHeight - scrollController.offset).clamp(0.0, kBgHeight);
  }

}
