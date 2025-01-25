import 'package:newsapp/model/source_response.dart';

abstract class SourceState {}

class SourceLoadingState extends SourceState {}

class SourceErrorState extends SourceState {
  String errorMessage;
  SourceErrorState({required this.errorMessage});
}
class SourceSelectedIndexState extends SourceState {
  int selectedIndex ;

  SourceSelectedIndexState({required this.selectedIndex});
}
class SourceSuccessState extends SourceState {
  List<Sources> sourcesList;

  SourceSuccessState({required this.sourcesList});
}
