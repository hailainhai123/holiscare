import 'package:get/get.dart';
import 'package:holiscare/model/health_request.dart';

import '../../api/api_dio_controller.dart';
import '../home/home_controller.dart';

class DataController extends GetxController {
  final HomeController homeController = Get.find();

  var listTimes = ['7', '15', '30'];
  var listNguong = ['Ngưỡng 1', 'Ngưỡng 2', 'Ngưỡng 3'];
  // var time = '7'.obs;
  var nguong = 'Ngưỡng 1'.obs;
  var nguongQuery = ''.obs;
  var showChart = false.obs;
  var id = ''.obs;
  var name = ''.obs;
  var teacher = ''.obs;
  var reason = ''.obs;
  var time = ''.obs;
  var listRequest = <HealthRequestModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> getListRequest() async {
    listRequest.clear();
    try {
      var list = await ApiDioController.getRequest();
      listRequest.addAll(list);
    } catch (e) {
      print(e);
    }
  }

  Future<void> postRequest(String? name, String? teacher, String? reason, String? time) async {
    try {
      await ApiDioController.postRequest(name ?? '', teacher ?? '', reason ?? '', time ?? '');
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteRequest(String id) async {
    try {
      var list = await ApiDioController.deleteRequest(id);
    } catch (e) {
      print(e);
    }
  }
}
