import 'package:get/get.dart';
import 'package:holiscare/modules/data/pages/detail_request.dart';
import 'package:holiscare/modules/data/pages/nurse_room.dart';
import 'package:holiscare/modules/data/students/health_data.dart';
import 'package:holiscare/modules/home/widget/detail_classroom.dart';
import 'package:holiscare/modules/home/widget/detail_record.dart';
import 'package:holiscare/modules/home/widget/health_record.dart';
import 'package:holiscare/modules/home/widget/medical_history.dart';
import 'package:holiscare/modules/user/pages/profile_page.dart';
import 'package:holiscare/modules/user/user_page.dart';
import 'package:holiscare/modules/web_health/web_health.dart';
import 'package:holiscare/nurse_room/nurse_room_student.dart';
import 'package:holiscare/widget_custom/comming_soon_page.dart';

import '../binding/app_binding.dart';
import '../modules/authentication/divide_authentication.dart';
import '../modules/bottom_app_bar/main_page.dart';
import '../modules/choose_language/language_page.dart';
import '../modules/human_body/human_page.dart';
import '../modules/home/home_page.dart';
import '../modules/login/login_page.dart';
import '../modules/data/data_page.dart';
import '../modules/splash/splash.dart';

const kSplash = "/splash";
const kAuth = "/authentication";
const kChooseLanguage = "/language";
const kRouteIndex = "/";
const kHomePage = '/home';
const kDetailClassroomPage = '/detail_classroom';
const kHealthRecord = '/health_record';
const kDetailRecord = '/detail_record';
const kMedicalHistory = '/medical_history';
const kNurseRoom = '/nurse_room';
const kNurseRoomStudent = '/nurse_room_student';
const kDetailRequest = '/detail_request';
const kStationPage = '/holiscaree_station_page';
const kAddDevicePage = '/add_device_page';
const kDataPage = '/data_page';
const kHealthDataPage = '/health_data_page';
const kHealthWebview = '/health_webview';
const kCustomTablePage = '/custom_table_page';
const kChartPage = '/chart_page';
const kUserPage = '/user_page';
const kInforPage = '/infor_page';
const kContactPage = '/contact_page';
const kDevicePage = '/device_page';
const kDeviceDetailPage = '/device_detail_page';
const kEditDevicePage = '/edit_device_page';
const kLoginPage = '/login';
const kRegisterPage = '/register';
const kCommingSoonPage = '/commingSoon';

final splashPage = GetPage(name: kSplash, page: () => SplashPage(), bindings: []);

final authPage = GetPage(name: kAuth, page: () => DivideAuth(), bindings: []);

final languagePage = GetPage(name: kChooseLanguage, page: () => LanguagePage(), bindings: []);

final indexPage = GetPage(
    name: kRouteIndex,
    page: () => MainPage(),
    bindings: [GlobalBinding(), HomeBinding()]);

final homePage = GetPage(name: kHomePage, page: () => HomePage(), bindings: [HomeBinding()]);

final detailClassroom = GetPage(name: kDetailClassroomPage, page: () => DetailClassroom(), bindings: []);

final healthRecord = GetPage(name: kHealthRecord, page: () => HealThRecord(), bindings: []);

final detailRecord = GetPage(name: kDetailRecord, page: () => DetailRecord(), bindings: []);

final medicalHistory = GetPage(name: kMedicalHistory, page: () => MedicalHistory(), bindings: []);

final nurseRoom = GetPage(name: kNurseRoom, page: () => NurseRoom(), bindings: []);

final nurseRoomStudent = GetPage(name: kNurseRoomStudent, page: () => NurseRoomStudent(), bindings: []);

final detailRequest = GetPage(name: kDetailRequest, page: () => DetailRequest(), bindings: []);

final dataPage = GetPage(name: kDataPage, page: () => DataPage(), bindings: []);

final healthDataPage = GetPage(name: kHealthDataPage, page: () => HealthData(), bindings: []);

final healthWebview = GetPage(name: kHealthWebview, page: () => WebViewExample(), bindings: []);

final userPage = GetPage(name: kUserPage, page: () => UserPage(), bindings: []);

final inforPage = GetPage(name: kInforPage, page: () => ProfilePage(), bindings: []);

final contactPage = GetPage(name: kContactPage, page: () => Human3DPage(), bindings: []);

final loginPage = GetPage(
    name: kLoginPage, page: () => const LoginPage(), binding: LoginBinding());

final commingSoon = GetPage(name: kCommingSoonPage, page: () => ComingSoonPage(), bindings: []);


final List<GetPage> pages = [
  splashPage,
  authPage,
  languagePage,
  indexPage,
  homePage,
  detailClassroom,
  healthRecord,
  detailRecord,
  medicalHistory,
  nurseRoom,
  nurseRoomStudent,
  detailRequest,
  dataPage,
  healthDataPage,
  healthWebview,
  userPage,
  inforPage,
  contactPage,
  loginPage,
  commingSoon,
];
