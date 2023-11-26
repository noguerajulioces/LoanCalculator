import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final VoidCallback? onMenuPressed;
  final VoidCallback? onLeadingPressed;
  final IconData leadingIcon;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.actions,
    this.onMenuPressed,
    this.onLeadingPressed,
    this.leadingIcon = Icons.delete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blueAccent,
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: IconButton(
        icon: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        onPressed: onMenuPressed ??
            () => Scaffold.of(context)
                .openDrawer(), // Esta es la acción correcta para abrir el Drawer.
      ),
      actions: actions ??
          [
            IconButton(
              onPressed: onLeadingPressed,
              icon: Icon(
                leadingIcon,
                color: Colors.white,
              ),
            ),
          ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
