import 'package:get/get.dart';
import 'package:holiscare/model/request_model.dart';
import 'package:holiscare/model/teacher_model.dart';

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
  var teacherId = 0.obs;
  var reason = ''.obs;
  var time = ''.obs;
  var listRequest = <RequestModel>[].obs;
  var listTeacher = <TeacherModel>[].obs;
  var listNameTeacher = <String>[].obs;

  @override
  void onInit() {
    getTeacher();
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> getListRequest({int? studentId, int? classId, int? teacherId, int? status}) async {
    listRequest.clear();
    try {
      var list = await ApiDioController.getRequest(studentId: studentId, classId: classId, teacherId: teacherId, status: status);
      listRequest.addAll(list);
    } catch (e) {
      print(e);
    }
  }

  Future<void> postRequest(String reason, String time, int teacherId) async {
    try {
      await ApiDioController.postRequest(reason, time, teacherId);
    } catch (e) {
      print(e);
    }
  }

  Future<void> acceptRequest(int idRequest) async {
    try {
      await ApiDioController.acceptRequest(idRequest);
    } catch (e) {
      print(e);
    }
  }

  Future<void> declineRequest(int idRequest) async {
    try {
      await ApiDioController.declineRequest(idRequest);
    } catch (e) {
      print(e);
    }
  }

  Future<void> getTeacher() async {
    listTeacher.clear();
    try {
      var list = await ApiDioController.getTeacher();
      listTeacher.addAll(list);
      for (var element in listTeacher) {
        listNameTeacher.add(element.name!);
      }
    } catch (e) {
      print(e);
    }
  }
}
