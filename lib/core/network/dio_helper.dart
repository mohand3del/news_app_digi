import 'package:dio/dio.dart';
import 'package:news_app_digi/core/constant/api_const.dart';

class DioHelper {
  static Dio? dio;

  static void init() {
    dio ??= Dio(
      BaseOptions(
        baseUrl: ApiConst.baseUrl,
        connectTimeout: Duration(seconds: 5),
        receiveTimeout: Duration(milliseconds: 3000),
        receiveDataWhenStatusError: true,
      ),
    );

  

 
  }

   static getRequest(String endPoint, {Map<String, dynamic>? query}) async {
    try {
      Response response = await dio!.get(endPoint, queryParameters: query);
      return response.data;
    } catch (e) {
      print(e.toString());
    }
  }
  
  static post(String endPoint, {Map<String, dynamic>? data}) async {
    try {
      Response response = await dio!.post(endPoint, data: data);
      return response.data;
    } catch (e) {
      print(e.toString());
    }
  }
}
