
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/api_services.dart';
import 'search_states.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInit());

  void getSearch(String search) {
    emit(GetSearchLoadingState());

    try {
      ApiServices().searchNews(search: search).then((value) {
        emit(GetSearchSuccessState(news: value));
      });
    } catch (e) {
      emit(GetSearchErrorState(error: e.toString()));
    }
  }
}
