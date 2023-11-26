import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> saveLanguage(String languageCode) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('selectedLanguage', languageCode);
}

Future<String> getSavedLanguage() async {
  final prefs = await SharedPreferences.getInstance();
  String? savedLanguageCode = prefs.getString('selectedLanguage');

  if (savedLanguageCode != null) {
    return savedLanguageCode;
  }

  String systemLanguageCode =
      WidgetsBinding.instance!.window.locale.languageCode;

  List<String> supportedLanguages = AppLocalizations.supportedLocales
      .map((locale) => locale.languageCode)
      .toList();

  if (supportedLanguages.contains(systemLanguageCode)) {
    return systemLanguageCode;
  }

  return 'en';
}
