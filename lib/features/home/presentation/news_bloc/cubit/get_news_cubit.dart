import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app_digi/features/home/data/model/top_headlines_model.dart';
import 'package:news_app_digi/features/home/domain/services/services.dart';

part 'get_news_state.dart';

class GetNewsCubit extends Cubit<GetNewsState> {
  GetNewsCubit() : super(GetNewsInitial());
  final Services service = Services();

  Future<void> getTopHeadlines() async {
    try {
      emit(GetNewsLoading());
      final articles = await service.topHeadlines();
      emit(GetNewsSuccess(articles));
    } catch (e) {
      log("Error fetching articles: $e");
      emit(GetNewsError(e.toString()));
    }
  }
}
