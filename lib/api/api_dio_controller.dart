import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response, FormData, MultipartFile;
import 'package:holiscare/model/detail_record_model.dart';
import 'package:holiscare/model/health_request.dart';
import 'package:holiscare/model/medical_record_model.dart';
import 'package:holiscare/model/student_model.dart';

import '../constant/api_url.dart';
import '../model/api_response.dart';
import '../model/paging_model.dart';
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
      // dio.options.headers['Authorization'] =
      // "Bearer ${Get.find<GlobalController>().accessToken.value}";
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
      // dio.options.headers['Authorization'] =
      // "Bearer ${Get.find<GlobalController>().accessToken.value}";
      Response<Map<String, dynamic>> response = await dio.post(
        url,
        data: body,
      );

      print('Response data: ${response.data}');

      CustomLog.log(response);
      if (response.statusCode == 200) {
        if (response.data!['message'] == "success") {
          return asModel(response.data!);
        }
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

  static Future<List<HealthRequestModel>> getRequest() async {
    Dio dio = Dio(options);

    List<HealthRequestModel> listRequest = [];
    print('1');
    await getData<List<HealthRequestModel>>(
      url: ApiURL.getRequest,
      dio: dio,
      asModel: (map) {
        final responseList = map as List;
        listRequest =
            responseList.map((e) => HealthRequestModel.fromJson(e)).toList();
      },
    );
    return listRequest;
  }

  static Future<void> postRequest(
      String name, String teacher, String reason, String time) async {
    Dio dio = Dio(options);

    await postMethods(
      url: ApiURL.getRequest,
      dio: dio,
      body: {
        "name": name,
        "teacher": teacher,
        'reason': reason,
        'time': time,
      },
      asModel: (map) {
        if (map['data'] != null) {
          final responseList = map['data'] as List;
        }
      },
    );
  }

  static Future<void> deleteRequest(String id) async {
    Dio dio = Dio(options);

    List<HealthRequestModel> listRequest = [];
    print('1');
    await deleteMethod<List<HealthRequestModel>>(
      url: '${ApiURL.getRequest}/$id',
      dio: dio,
    );
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
      query: {"studentId" : idStudent},
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
      url: '${ApiURL.getDetailRecord}$idRecord' ,
      dio: dio,
      asModel: (map) {
        var dataResponse = ApiResponse.fromJson(map);
        detailRecordModel = DetailRecordModel.fromJson(dataResponse.data);
      },
    );
    return detailRecordModel;
  }
}
