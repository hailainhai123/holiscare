import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response, FormData, MultipartFile;
import 'package:holiscare/model/detail_account.dart';
import 'package:holiscare/model/detail_record_model.dart';
import 'package:holiscare/model/login_model.dart';
import 'package:holiscare/model/medical_record_model.dart';
import 'package:holiscare/model/reason_model.dart';
import 'package:holiscare/model/request_model.dart';
import 'package:holiscare/model/student_model.dart';
import 'package:holiscare/model/teacher_model.dart';

import '../constant/api_url.dart';
import '../model/api_response.dart';
import '../model/paging_model.dart';
import '../model/token_model.dart';
import '../utils/global_controller.dart';
import 'custom_log.dart';

const int kDefaultTimeOut = 60 * 1000;

class ApiDioController {
  static const _baseUrl = 'http://localhost:5155/';

  static BaseOptions options = BaseOptions(
    baseUrl: _baseUrl,
    connectTimeout: kDefaultTimeOut,
    receiveTimeout: kDefaultTimeOut,
  );

  // Contruction to use multiple project
  static Future<T?> getData<T>({
    required String url,
    required Dio dio,
    Map<String, dynamic>? query,
    required Function(dynamic) asModel,
  }) async {
    try {
      print(url);
      dio.options.headers['Authorization'] =
      "${Get.find<GlobalController>().tokenType.value} ${Get.find<GlobalController>().token.value}";
      final response = await dio.get(
        url,
        queryParameters: query,
      );

      print('ApiResponse: $response');
      print('data response: ${response.data}');

      if (response.statusCode == 200) {
        return asModel(response.data);
      }
      return null;
    } on DioError catch (e) {
      CustomLog.log(e);
      return null;
    } catch (e) {
      CustomLog.log(e);
      Get.defaultDialog(
          barrierDismissible: false,
          title: 'Có lỗi xảy ra! Vui lòng thử lại.',
          onConfirm: () {
            Get.back();
          });
      return null;
    }
  }

  static Future<T?> postMethods<T>({
    required String url,
    required Dio dio,
    dynamic body,
    required Function(Map<String, dynamic>) asModel,
  }) async {
    try {
      print('Request body: $body');
      print('Request url: $url');
      dio.options.headers['Authorization'] =
      "${Get.find<GlobalController>().tokenType.value} ${Get.find<GlobalController>().token.value}";
      Response<Map<String, dynamic>> response = await dio.post(
        url,
        data: body,
      );
      print('Response data: ${response.data}');
      if (response.statusCode == 200) {
        return asModel(response.data!);
      }
      return null;
    } on DioError catch (e) {
      CustomLog.log(e);
      Get.snackbar('Lỗi', 'Lỗi hệ thống, xin vui lòng thử lại sau!');
      return null;
    } catch (e) {
      CustomLog.log(e);
      Get.snackbar('Lỗi', 'Lỗi hệ thống, xin vui lòng thử lại sau!');
      return null;
    }
  }

  static Future<T?> putMethods<T>({
    required String url,
    required Dio dio,
    Map<String, dynamic>? query,
    required Function(Map<String, dynamic>) asModel,
  }) async {
    try {
      print('Request url: $url');
      dio.options.headers['Authorization'] =
      "${Get.find<GlobalController>().tokenType.value} ${Get.find<GlobalController>().token.value}";
      Response<Map<String, dynamic>> response = await dio.put(
        url,
        queryParameters: query,
      );
      print('Response data: ${response.data}');
      if (response.statusCode == 200) {
        return asModel(response.data!);
      }
      return null;
    } on DioError catch (e) {
      CustomLog.log(e);
      Get.snackbar('Lỗi', 'Lỗi hệ thống, xin vui lòng thử lại sau!');
      return null;
    } catch (e) {
      CustomLog.log(e);
      Get.snackbar('Lỗi', 'Lỗi hệ thống, xin vui lòng thử lại sau!');
      return null;
    }
  }

  static Future<T?> deleteMethod<T>({
    required String url,
    required Dio dio,
    Map<String, dynamic>? body,
  }) async {
    try {
      Response<String> response = await dio.delete(
        url,
        data: body,
      );
    } on DioError catch (e) {
      CustomLog.log(e);
      return null;
    } catch (e) {
      CustomLog.log(e);
      return null;
    }
  }

  static Future<List<StudentModel>> getStudent() async {
    Dio dio = Dio(options);

    List<StudentModel> listStudent = [];
    await getData<List<StudentModel>>(
      url: ApiURL.getStudent,
      dio: dio,
      asModel: (map) {
        var dataResponse = ApiResponse.fromJson(map);
        listStudent = Paging<StudentModel>.fromJson(
          dataResponse.data,
              (item) {
            return StudentModel.fromJson(item);
          },
        ).items!;
      },
    );
    return listStudent;
  }

  static Future<List<MedicalRecordModel>> getRecord(int idStudent) async {
    Dio dio = Dio(options);

    List<MedicalRecordModel> listRecord = [];
    await getData<List<MedicalRecordModel>>(
      url: ApiURL.getRecord,
      query: {"studentId": idStudent},
      dio: dio,
      asModel: (map) {
        var dataResponse = ApiResponse.fromJson(map);
        listRecord = Paging<MedicalRecordModel>.fromJson(
          dataResponse.data,
              (item) {
            return MedicalRecordModel.fromJson(item);
          },
        ).items!;
      },
    );
    return listRecord;
  }

  static Future<DetailRecordModel> getDetailRecord(int idRecord) async {
    Dio dio = Dio(options);

    DetailRecordModel detailRecordModel = DetailRecordModel();
    await getData<DetailRecordModel>(
      url: '${ApiURL.getDetailRecord}$idRecord',
      dio: dio,
      asModel: (map) {
        var response = ApiResponse.fromJson(map);
        detailRecordModel = DetailRecordModel.fromJson(response.data);
      },
    );
    return detailRecordModel;
  }

  static Future<List<TeacherModel>> getTeacher() async {
    Dio dio = Dio(options);

    List<TeacherModel> listTeacher = [];
    await getData<List<TeacherModel>>(
      url: ApiURL.getTeacher,
      dio: dio,
      asModel: (map) {
        // var dataResponse = ApiResponse.fromJson(map);
        listTeacher = Paging<TeacherModel>.fromJson(
          map,
              (item) {
            return TeacherModel.fromJson(item);
          },
        ).items!;
      },
    );
    return listTeacher;
  }

  static Future<AuthenticationResult> postLogin(String email, String password, String fireBaseToken, String deviceId) async {
    Dio dio = Dio(options);

    AuthenticationResult authenticationResult = AuthenticationResult();
    await postMethods(
      url: ApiURL.postLogin,
      dio: dio,
      body: LoginModel(username: email, password: password, fireBaseToken: fireBaseToken, deviceId: deviceId).toRawJson(),
      asModel: (map) {
        var response = ApiResponse.fromJson(map);
        authenticationResult = AuthenticationResult.fromJson(response.data);
      },
    );
    return authenticationResult;
  }

  static Future<DetailAccount> getDetailAccount() async {
    Dio dio = Dio(options);

    DetailAccount detailAccount = DetailAccount();
    await getData<DetailAccount>(
      url: ApiURL.detailAccount,
      dio: dio,
      asModel: (map) {
        var response = ApiResponse.fromJson(map);
        detailAccount = DetailAccount.fromJson(response.data);
      },
    );
    return detailAccount;
  }

  static Future<void> postRequest(String reason, String time, int teacherId,) async {
    Dio dio = Dio(options);

    await postMethods(
      url: ApiURL.postRequest,
      dio: dio,
      body: ReasonModel(reason: reason, time: time, teacherId: teacherId).toJson(),
      asModel: (map) {
      },
    );
  }

  static Future<List<RequestModel>> getRequest({int? studentId, int? classId, int? teacherId, int? status}) async {
    Dio dio = Dio(options);

    List<RequestModel> listRequest = [];
    await getData<List<RequestModel>>(
      url: ApiURL.getRequest,
      query: {
        "StudentId" : studentId,
        "ClassId" : classId,
        "TeacherId" : teacherId,
        "Status" : status,
      },
      dio: dio,
      asModel: (map) {
        var dataResponse = ApiResponse.fromJson(map);
        listRequest = Paging<RequestModel>.fromJson(
          dataResponse.data,
              (item) {
            return RequestModel.fromJson(item);
          },
        ).items!;
      },
    );
    return listRequest;
  }

  static Future<void> acceptRequest(int id) async {
    Dio dio = Dio(options);

    await putMethods(
      url: '${ApiURL.acceptRequest}$id',
      dio: dio,
      asModel: (map) {
      },
    );
  }

  static Future<void> declineRequest(int id) async {
    Dio dio = Dio(options);

    await putMethods(
      url: '${ApiURL.declineRequest}$id',
      dio: dio,
      asModel: (map) {
      },
    );
  }

}
