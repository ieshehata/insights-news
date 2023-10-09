
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/api_services.dart';
import 'news_states.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInit());

  void getNews(String category) {
    emit(GetNewsLoadingState());

    try {
      ApiServices().getNews(category: category).then((value) {
        emit(GetNewsSuccessState(news: value));
      });
    } catch (e) {
      emit(GetNewsErrorState(error: e.toString()));
    }
  }
}
