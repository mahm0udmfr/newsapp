import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/category/cubit/source_state.dart';
import 'package:newsapp/utils/api_manager.dart';

class SourceViewModel extends Cubit<SourceState> {
  SourceViewModel() : super(SourceLoadingState());

  void getSources(String catId) async {
    try {
      emit(SourceLoadingState());
      var response = await ApiManager.getSources(catId);
      if (response!.status == 'error') {
        emit(SourceErrorState(errorMessage: response.message!));
        return;
      }

      if (response.status == 'ok') {
        emit(SourceSuccessState(sourcesList: response.sources!));
        return;
      }
    } catch (e) {
      emit(SourceErrorState(errorMessage: e.toString()));
    }
  }

  void changeSourceId(int newSelectedIndex) {
    emit(SourceSelectedIndexState(selectedIndex: newSelectedIndex));
  }
}
