part of 'get_news_cubit.dart';

@immutable
sealed class GetNewsState {}

final class GetNewsInitial extends GetNewsState {}

final class GetNewsLoading extends GetNewsState {}

final class GetNewsSuccess extends GetNewsState {
  final TopHeadlinesModel topHeadlinesModel;

  GetNewsSuccess(this.topHeadlinesModel);
}

final class GetNewsError extends GetNewsState {
  final String errorMessage;

  GetNewsError(this.errorMessage);
}
