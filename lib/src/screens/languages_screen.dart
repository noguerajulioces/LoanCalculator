import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  List<Locale> get supportedLocales => AppLocalizations.supportedLocales;

  void _changeLanguage(Locale locale) {
    // Aquí implementas la lógica para cambiar el idioma.
    // Esto podría implicar notificar a tu sistema de gestión de estado o reiniciar la aplicación.
  }

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
    // Aquí mapeas los códigos de idioma a nombres legibles
    switch (locale.languageCode) {
      case 'en':
        return 'English';
      case 'es':
        return 'Spanish';
      case 'zh':
        return 'Chinese';
      // Añade más casos según los idiomas que soportes
      default:
        return 'Unknown';
    }
  }
}
