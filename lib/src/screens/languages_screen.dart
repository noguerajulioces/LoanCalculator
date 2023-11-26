import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo/src/providers/localeProvider.dart';
import 'package:todo/src/services/preferences_service.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  List<Locale> get supportedLocales => AppLocalizations.supportedLocales;

  void _changeLanguage(Locale locale) async {
    final provider = Provider.of<LocaleProvider>(context, listen: false);
    provider.setLocale(locale);

    String languageCode = locale.languageCode;
    await saveLanguage(languageCode);
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocaleProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.language),
      ),
      body: ListView.builder(
        itemCount: supportedLocales.length,
        itemBuilder: (context, index) {
          var locale = supportedLocales[index];
          String languageName = _getLanguageName(locale, context);
          return ListTile(
            title: Text(
              languageName,
              style: const TextStyle(fontSize: 18),
            ),
            trailing:
                provider.locale == locale ? const Icon(Icons.check) : null,
            onTap: () {
              _changeLanguage(locale);
            },
          );
        },
      ),
    );
  }

  String _getLanguageName(Locale locale, BuildContext context) {
    switch (locale.languageCode) {
      case 'en':
        return AppLocalizations.of(context)!.languageEnglish;
      case 'es':
        return AppLocalizations.of(context)!.languageSpanish;
      case 'zh':
        return AppLocalizations.of(context)!.languageChinese;
      case 'hi':
        return AppLocalizations.of(context)!.languageHindi;
      case 'ar':
        return AppLocalizations.of(context)!.languageArabic;
      case 'pt':
        return AppLocalizations.of(context)!.languagePortuguese;
      case 'ru':
        return AppLocalizations.of(context)!.languageRussian;
      case 'fr':
        return AppLocalizations.of(context)!.languageFrench;
      case 'de':
        return AppLocalizations.of(context)!.languageGerman;
      case 'ja':
        return AppLocalizations.of(context)!.languageJapanese;
      default:
        return 'Unknown';
    }
  }
}
