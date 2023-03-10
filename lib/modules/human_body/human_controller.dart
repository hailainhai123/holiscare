import 'package:get/get.dart';

class HumanController extends GetxController {

  var listDiseases = [].obs;
  var listRoutes = [].obs;
  var imageDiseases = ''.obs;
  var nameDiseases = ''.obs;
  var nameDetailDiseases = ''.obs;
  var imageDetailDiseases = ''.obs;
  var concept = ''.obs;
  var listIndication = [].obs;

  Future<void> getDiseases() async {
    listDiseases.clear();
    // try {
    //   var list = await ApiDioController.getStudent();
    //   listStudent.addAll(list);
    //   print('${listStudent.length}');
    // } catch (e) {
    //   print(e);
    // }
  }

  Future<void> getDetailDiseases() async {
    listIndication.clear();
  }
}