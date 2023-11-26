// custom_drawer.dart
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo/src/screens/languages_screen.dart';
import 'package:todo/src/utils/rating_dialog_helper.dart';

class CustomDrawer extends StatelessWidget {
  final Function(int) onItemSelected;

  const CustomDrawer({
    super.key,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Aquí construyes tu Drawer con todos los elementos que necesitas
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          ListTile(
            title: Text(
              AppLocalizations.of(context)!.removeAds,
            ),
            leading: const Icon(Icons.gif),
            onTap: () => onItemSelected(2),
          ),
          ListTile(
            title: Text(
              AppLocalizations.of(context)!.language,
            ),
            leading: const Icon(Icons.language),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LanguageScreen(),
                ),
              );
            },
          ),
          ListTile(
            title: Text(
              AppLocalizations.of(context)!.shareAndWin,
            ),
            leading: const Icon(Icons.card_giftcard),
            onTap: () => onItemSelected(0),
          ),
          ListTile(
            title: Text(
              AppLocalizations.of(context)!.comments,
            ),
            leading: const Icon(Icons.message),
            onTap: () => onItemSelected(0),
          ),
          ListTile(
            title: Text(
              AppLocalizations.of(context)!.rateUs,
            ),
            leading: const Icon(Icons.star),
            onTap: () => RatingDialogHelper.showRatingDialog(context),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: const Column(
              children: [
                Divider(),
                Text('Versión 0.1.0'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
