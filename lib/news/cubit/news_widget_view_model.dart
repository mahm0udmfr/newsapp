import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/news/cubit/news_source_state.dart';
import 'package:newsapp/utils/api_manager.dart';

class NewsWidgetViewModel extends Cubit<NewsSourceState> {
  NewsWidgetViewModel() : super(SourceLoadingState());

  void getNews(String sourceId) async {
    try {
      emit(SourceLoadingState());
      var response = await ApiManager.getNewsBySourceId(sourceId);
      if (response?.status == 'error') {
        emit(SourceErrorState(errorMessage: response!.message!));
        return;
      }
      if (response!.status == 'ok') {
        emit(SourseSuccessState(newsList: response.articles));
        return;
      }
    } catch (e) {
      emit(SourceErrorState(errorMessage: e.toString()));
      return;
    }
  }
}
