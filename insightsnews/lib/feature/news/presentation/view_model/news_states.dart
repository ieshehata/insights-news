
import '../../../home/data/model/news_model.dart';

class NewsStates {}

class NewsInit extends NewsStates {}

class GetNewsLoadingState extends NewsStates {}

class GetNewsSuccessState extends NewsStates {
  final NewsModel? news;

  GetNewsSuccessState({required this.news});
}

class GetNewsErrorState extends NewsStates {
  final String error;

  GetNewsErrorState({required this.error});
}
