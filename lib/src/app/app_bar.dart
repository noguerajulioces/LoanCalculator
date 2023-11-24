import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final VoidCallback? onMenuPressed;
  final VoidCallback? onLeadingPressed;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.actions,
    this.onMenuPressed,
    this.onLeadingPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black12,
      title: const Text('Calculadora de préstamos'),
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {
          // Acción para el botón de menú
        },
      ),
      actions: [
        IconButton(
          onPressed: () {
            // Acción para el botón de borrar
          },
          icon: const Icon(Icons.delete),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
