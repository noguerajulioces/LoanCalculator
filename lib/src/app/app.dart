import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/l10n/l10n.dart';
import 'package:todo/src/providers/localeProvider.dart';
import '../../src/screens/main_container_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocaleProvider>(context);

    return MaterialApp(
      title: 'Calculadora de Préstamos',
      supportedLocales: L10n.all,
      locale: provider.locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MainContainerScreen(),
    );
  }
}
