import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemSelected;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      style: TabStyle.reactCircle, // o el estilo que prefieras
      items: [
        TabItem(icon: Icons.home, title: AppLocalizations.of(context)!.home),
        TabItem(
            icon: Icons.monetization_on,
            title: AppLocalizations.of(context)!.myLoans),
        TabItem(
            icon: Icons.favorite, title: AppLocalizations.of(context)!.donate),
      ],
      initialActiveIndex: currentIndex, // página inicial
      onTap: onItemSelected,
    );
  }
}
