
import 'package:newsapp/model/news_model.dart';

abstract class NewsSourceState {}

class SourceLoadingState extends NewsSourceState {}

class SourceErrorState extends NewsSourceState {
  String errorMessage;
  SourceErrorState({required this.errorMessage});
}

class SourseSuccessState extends NewsSourceState{
  List<Articles>? newsList;
  SourseSuccessState({required this.newsList});
}
