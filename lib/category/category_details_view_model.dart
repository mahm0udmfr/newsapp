import 'package:flutter/material.dart';
import 'package:newsapp/model/source_response.dart';
import 'package:newsapp/utils/api_manager.dart';

class CategoryDetailsViewModel extends ChangeNotifier {
  List<Sources>? sourcesList;
  String? errorMessage;
  int selectedIndex = 0;

  Future<void> getSources(String catId) async {
    sourcesList = null;
    errorMessage = null;
    notifyListeners();
    try {
      var response = await ApiManager.getSources(catId);
      if (response?.status == "error") {
        errorMessage = response!.message;
      } else {
        sourcesList = response!.sources!;
      }
    } catch (e) {
      errorMessage = "Error loading sources: $e";
    }
    notifyListeners();
  }

  void changeIndex(int newIndex) {
    selectedIndex = newIndex;
    notifyListeners();
  }
}
