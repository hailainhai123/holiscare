import 'package:get/get.dart';
import 'package:holiscare/modules/user/user_controller.dart';
import '../modules/bottom_app_bar/navigation_controller.dart';
import '../modules/human_body/human_controller.dart';
import '../modules/home/home_controller.dart';
import '../modules/login/login_controller.dart';
import '../modules/data/data_controller.dart';

class GlobalBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(NavController(), permanent: true);
  }
}

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController(), permanent: true);
    Get.put(DataController(), permanent: true);
    Get.put(UserController(), permanent: true);
    Get.put(HumanController(), permanent: true);
  }
}


class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
