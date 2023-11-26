// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/src/providers/localeProvider.dart';
import 'src/app/app.dart';
import 'package:todo/src/services/preferences_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final selectedLanguage = await getSavedLanguage();

  runApp(
    ChangeNotifierProvider(
      create: (context) => LocaleProvider(
        Locale(selectedLanguage),
      ),
      child: MyApp(),
    ),
  );
}
