import 'package:flutter/material.dart';

class LocaleProvider extends ChangeNotifier {
   Locale _locale = const Locale('en'); // Declare _locale as late

  Locale get locale => _locale;

  void setLocale(Locale newLocale) {
    _locale = newLocale;
    notifyListeners();
  }
}
