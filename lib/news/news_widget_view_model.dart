import 'package:flutter/material.dart';
import 'package:newsapp/utils/api_manager.dart';

class NewsWidgetViewModel extends ChangeNotifier {
  //hold data & handle logic
  List<dynamic>? newsList;
  String? errorMessage;
  int selectedIndex = 0;

  void getNewBySourceId(String sourceId) async {
    newsList = null;
    errorMessage = null;
    notifyListeners();
    try {
      var response = await ApiManager.getNewsBySourceId(sourceId);
      if (response?.status == "error") {
        errorMessage = response!.message;
      } else {
        newsList = response!.articles;
      }
      notifyListeners();
    } catch (e) {
      errorMessage = 'error load news List';
    }
  }



}
