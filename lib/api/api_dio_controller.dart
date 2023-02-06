import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response, FormData, MultipartFile;
import 'package:holiscare/model/health_request.dart';
import 'package:holiscare/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/api_url.dart';
import '../constant/routes.dart';
import '../constant/constants.dart';
import 'custom_log.dart';

const int kDefaultTimeOut = 60 * 1000;

class ApiDioController {
  static const _baseUrl = 'http://localhost:5143';

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
      Response<List<dynamic>> response = await dio.get(
        url,
        queryParameters: query,
      );

      print('ApiResponse: $response');

      if (response.statusCode == 200) {
        return asModel(response.data!);
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

  static Future<T?> putMethods<T>({
    required String url,
    required Dio dio,
    dynamic body,
    required Function(Map<String, dynamic>) asModel,
  }) async {
    try {
      // dio.options.headers['x-access-token'] =
      //     Get.find<GlobalController>().accessToken.value;

      Response<Map<String, dynamic>> response = await dio.put(url, data: body);
      CustomLog.log(response.data);

      if (response.statusCode == 200) {
        if (response.data!['message'] == 'success') {
          return asModel(response.data!);
        }
      } else if (response.statusCode == 403) {
        return null;
      }

      return null;
    } on DioError catch (e) {
      CustomLog.log(e);
      return null;
    } catch (e) {
      CustomLog.log(e);
      return null;
    }
  }

  static Future<T?> pathMethods<T>({
    required String url,
    required Dio dio,
    dynamic body,
    required Function(Map<String, dynamic>) asModel,
  }) async {
    try {
      // dio.options.headers['x-access-token'] =
      //     Get.find<GlobalController>().accessToken.value;

      Response<Map<String, dynamic>> response =
      await dio.patch(url, data: body);

      CustomLog.log(response);

      if (response.statusCode == 200) {
        if (response.data!['message'] == "success") {
          return asModel(response.data!);
        }
      } else if (response.statusCode == 403) {
        // Get.find<GlobalController>().refreshToken();
        return null;
      }

      return null;
    } on DioError catch (e) {
      CustomLog.log(e);
      return null;
    } catch (e) {
      CustomLog.log(e);
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
        listRequest = responseList.map((e) => HealthRequestModel.fromJson(e)).toList();
      },
    );
    return listRequest;
  }

  static Future<void> postRequest(String name, String teacher, String reason, String time) async {
    Dio dio = Dio(options);

    await postMethods(
      url: ApiURL.getRequest,
      dio: dio,
      body: {"name" : name, "teacher" : teacher, 'reason' : reason, 'time' : time,},
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
  //
  // static Future<List<DeviceModel>> getDeviceForIdStation(String idStation) async {
  //   Dio dio = Dio(options);
  //
  //   List<DeviceModel> listDevice = [];
  //   await postMethods(
  //     url: ApiURL.getDeviceForIdStation,
  //     dio: dio,
  //     body: {"stationId" : idStation},
  //     asModel: (map) {
  //       if (map['data'] != null) {
  //         final responseList = map['data'] as List;
  //         listDevice = responseList.map((e) => DeviceModel.fromJson(e)).toList();
  //       }
  //     },
  //   );
  //   return listDevice;
  // }
}
