

import '../../home/data/model/news_model.dart';

class SearchStates {}

class SearchInit extends SearchStates {}

class GetSearchLoadingState extends SearchStates {}

class GetSearchSuccessState extends SearchStates {
  late final NewsModel? news;

  GetSearchSuccessState({required this.news});
}

class GetSearchErrorState extends SearchStates {
  final String error;

  GetSearchErrorState({required this.error});
}
