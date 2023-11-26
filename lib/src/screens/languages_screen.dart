import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  List<Locale> get supportedLocales => AppLocalizations.supportedLocales;

  void _changeLanguage(Locale locale) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.language),
        // title: const Text('Hola'),
      ),
      body: ListView.builder(
        itemCount: supportedLocales.length,
        itemBuilder: (context, index) {
          var locale = supportedLocales[index];
          String languageName = _getLanguageName(
              locale); // Función para obtener el nombre del idioma
          return ListTile(
            title: Text(
              languageName,
              style: const TextStyle(fontSize: 18),
            ),
            onTap: () {
              _changeLanguage(locale);
            },
          );
        },
      ),
    );
  }

  String _getLanguageName(Locale locale) {
    switch (locale.languageCode) {
      case 'en':
        return 'English';
      case 'es':
        return 'Spanish';
      case 'zh':
        return 'Chinese';
      case 'hi':
        return 'Hindi';
      case 'ar':
        return 'Arabic';
      case 'pt':
        return 'Portuguese';
      case 'ru':
        return 'Russian';
      case 'fr':
        return 'French';
      case 'de':
        return 'German';
      case 'ja':
        return 'Japanese';
      default:
        return 'Unknown';
    }
  }
}
