import 'package:flutter/material.dart';
import 'package:newsapp/services.dart';

class LanguageProvider extends ChangeNotifier {
  String appLanguage = MyServices.getString("language") ?? "en";

  void changeLanguage(String newLanguage) {
    if (appLanguage == newLanguage) {
      return;
    }
    appLanguage = newLanguage;
    MyServices.setString('language', newLanguage);
    notifyListeners();
  }
}
