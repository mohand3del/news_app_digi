import 'package:dio/dio.dart';
import 'package:news_app_digi/core/constant/api_const.dart';

class DioHelper {
  static Dio? dio;

  static void init() {
    dio ??= Dio(
      BaseOptions(
        baseUrl: ApiConst.baseUrl,
        connectTimeout: Duration(seconds: 30),
        receiveTimeout: Duration(milliseconds: 3000),
        receiveDataWhenStatusError: true,
      ),
    );

  

 
  }

  static Future<Response<dynamic>> getRequest(
    String endPoint, {
    Map<String, dynamic>? query,
  }) async {
    if (dio == null) {
      init();
    }

    try {
      return await dio!.get(endPoint, queryParameters: query);
    } catch (e) {
      throw Exception('GET $endPoint failed: $e');
    }
  }

  static Future<Response<dynamic>> post(
    String endPoint, {
    Map<String, dynamic>? data,
  }) async {
    if (dio == null) {
      init();
    }

    try {
      return await dio!.post(endPoint, data: data);
    } catch (e) {
      throw Exception('POST $endPoint failed: $e');
    }
  }
}
