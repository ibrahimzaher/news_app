import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  String language = 'en';
  toggleLanguage(String lang) {
    if (language == lang) return;
    language = lang;
    notifyListeners();
  }
}
