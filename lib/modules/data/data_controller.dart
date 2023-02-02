import 'package:get/get.dart';

import '../home/home_controller.dart';

class DataController extends GetxController {
  final HomeController homeController = Get.find();

  var listTimes = ['7', '15', '30'];
  var listNguong = ['Ngưỡng 1', 'Ngưỡng 2', 'Ngưỡng 3'];
  var time = '7'.obs;
  var nguong = 'Ngưỡng 1'.obs;
  var nguongQuery = ''.obs;
  var showChart = false.obs;
  var name = ''.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
