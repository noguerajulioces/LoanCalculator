import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveLanguage(String languageCode) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('selectedLanguage', languageCode);
}

Future<String> getSavedLanguage() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('selectedLanguage') ?? 'en';
}
