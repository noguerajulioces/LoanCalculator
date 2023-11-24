import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';

class LanguageScreen extends StatefulWidget {
  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  List<Locale> get supportedLocales => AppLocalizations.supportedLocales;

  void _changeLanguage(Locale locale) {
    // Implementa la lógica para cambiar el idioma aquí
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            AppLocalizations.of(context)?.selectLanguage ?? 'Select Language'),
      ),
      body: ListView.builder(
        itemCount: supportedLocales.length,
        itemBuilder: (context, index) {
          var locale = supportedLocales[index];
          return ListTile(
            title: Text(
              "Defecto", // Valor por defecto si es null
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              _changeLanguage(locale);
            },
          );
        },
      ),
    );
  }
}
