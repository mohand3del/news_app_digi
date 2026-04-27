import 'package:news_app_digi/core/constant/api_const.dart';
import 'package:news_app_digi/core/network/dio_helper.dart';

class Services {
  
  topHeadlines() async {
    {
      final response = await DioHelper.getRequest(
        ApiConst.topHeadlinesEndpoint,
        query: {'apiKey': ApiConst.apiKey, 'country': 'eg'},


      );
      return response;
    }
  }
}
