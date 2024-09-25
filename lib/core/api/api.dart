import 'dart:convert';

import 'package:dio/dio.dart';
import 'dart:developer';

import 'api_const.dart';

class Api {
  static final Dio _dio = Dio(BaseOptions(
    baseUrl: ApiConstants.baseUrl,
    headers: ApiConstants.headers,
    connectTimeout: ApiConstants.duration,
    receiveTimeout: ApiConstants.duration,
    sendTimeout: ApiConstants.duration,
    contentType: ApiConstants.contentType,
    validateStatus: ApiConstants.validate,
  ));

  static Future<String?> getData(String api, Map<String, String> params) async {
    try {
      final Response response = await _dio.get(api, queryParameters: params);
      log("response status code = ${response.statusCode}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        log("api response == ${response.data}");
        log("respone data ketti");
        return jsonEncode(response.data);
      }
    } on DioException catch (e) {
      log("DioException: Error at ${e.requestOptions.uri}. Because of ${e.type.name}");
      // Future.delayed(Duration.zero).then((value) {
      //   Utils.fireSnackBar("DioException: Error at ${e.requestOptions.uri}. Because of ${e.type.name}", context);
      // });
    } catch (e) {
      log("Unexpected error: $e");
    }
    return null;
  }

  static Future<String?> postData(String api, Map<String, dynamic> body) async {
    try {
      final Response response = await _dio.post(api, data: body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data.toString();
      }
    } on DioException catch (e) {
      log("DioException: Error at ${e.requestOptions.uri}. Because of ${e.type.name}");
      // Future.delayed(Duration.zero).then((value) {
      //   Utils.fireSnackBar("DioException: Error at ${e.requestOptions.uri}. Because of ${e.type.name}", context);
      // });
    } catch (e) {
      log("Unexpected error: $e");
    }
    return null;
  }

  static Future<String?> putData(String api, Map<String, dynamic> body, Map<String, dynamic> params) async {
    try {
      final Response response = await _dio.put(api, queryParameters: params, data: body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data.toString();
      }
    } on DioException catch (e) {
      log("DioException: Error at ${e.requestOptions.uri}. Because of ${e.type.name}");
      // Future.delayed(Duration.zero).then((value) {
      //   Utils.fireSnackBar("DioException: Error at ${e.requestOptions.uri}. Because of ${e.type.name}", context);
      // });
    } catch (e) {
      log("Unexpected error: $e");
    }
    return null;
  }

  static Future<String?> deleteData(String api, Map<String, String> params) async {
    try {
      final Response response = await _dio.delete(api, queryParameters: params);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data.toString();
      }
    } on DioException catch (e) {
      log("DioException: Error at ${e.requestOptions.uri}. Because of ${e.type.name}");
      // Future.delayed(Duration.zero).then((value) {
      //   Utils.fireSnackBar("DioException: Error at ${e.requestOptions.uri}. Because of ${e.type.name}", context);
      // });
    } catch (e) {
      log("Unexpected error: $e");
    }
    return null;
  }

  static Future<String?> multiPart(String api, String filePath, Map<String, String> body) async {
    try {
      final FormData formData = FormData.fromMap({
        ...body,
        'file': await MultipartFile.fromFile(filePath, filename: 'upload.png'),
      });
      final Response response = await _dio.post(api, data: formData);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data.toString();
      }
    } on DioException catch (e) {
      log("DioException: Error at ${e.requestOptions.uri}. Because of ${e.type.name}");
      // Future.delayed(Duration.zero).then((value) {
      //   Utils.fireSnackBar("DioException: Error at ${e.requestOptions.uri}. Because of ${e.type.name}", context);
      // });
    } catch (e) {
      log("Unexpected error: $e");
    }
    return null;
  }

  static Future<String?> patchData(String api, Map<String, String> params, Map<String, dynamic> body) async {
    try {
      final Response response = await _dio.patch(api, queryParameters: params, data: body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data.toString();
      }
    } on DioException catch (e) {
      log("DioException: Error at ${e.requestOptions.uri}. Because of ${e.type.name}");
      // Future.delayed(Duration.zero).then((value) {
      //   Utils.fireSnackBar("DioException: Error at ${e.requestOptions.uri}. Because of ${e.type.name}", context);
      // });
    } catch (e) {
      log("Unexpected error: $e");
    }
    return null;
  }
}
