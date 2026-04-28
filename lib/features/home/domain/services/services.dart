import 'package:news_app_digi/core/constant/api_const.dart';
import 'package:news_app_digi/core/network/dio_helper.dart';
import 'package:news_app_digi/features/home/data/model/top_headlines_model.dart';

class Services {
  Future<TopHeadlinesModel> topHeadlines() async {
    try {
      final response = await DioHelper.getRequest(
        ApiConst.topHeadlinesEndpoint,
        query: {'apiKey': ApiConst.apiKey, 'country': 'us'},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return TopHeadlinesModel.fromJson(response.data as Map<String, dynamic>);
      }

      throw Exception(
        'Unexpected response code: ${response.statusCode}',
      );
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
