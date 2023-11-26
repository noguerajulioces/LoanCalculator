// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/src/providers/localeProvider.dart';
import 'src/app/app.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => LocaleProvider(Locale('en')),
      child: MyApp(),
    ),
  );
}
