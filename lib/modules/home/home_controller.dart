import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holiscare/model/detail_record_model.dart';
import 'package:holiscare/model/medical_record_model.dart';
import 'package:holiscare/model/student_model.dart';
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
  var color = Colors.black.obs;
  var userModel = UserModel().obs;
  var title = ''.obs;
  var index = ''.obs;
  var idRecord = ''.obs;
  var listRecord = <MedicalRecordModel>[].obs;
  var listStudent = <StudentModel>[].obs;
  var detailRecord = DetailRecordModel().obs;
  var chiSoBMI = ''.obs;

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
    await getStudent();
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

  Future<void> getStudent() async {
    listStudent.clear();
    try {
      var list = await ApiDioController.getStudent();
      listStudent.addAll(list);
      print('${listStudent.length}');
    } catch (e) {
      print(e);
    }
  }

  Future<void> getMedicalRecord(int idStudent) async {
    listRecord.clear();
    try {
      var list = await ApiDioController.getRecord(idStudent);
      listRecord.addAll(list);
      print('haiabc ${listRecord.length}');
    } catch (e) {
      print(e);
    }
  }

  Future<void> getDetailRecord(int idRecord) async {
    try {
      var detailRecordResponse = await ApiDioController.getDetailRecord(idRecord);
      detailRecord.value = detailRecordResponse;
      print('haiabc ${detailRecord.value.studentName}');
    } catch (e) {
      print(e);
    }
  }

}
