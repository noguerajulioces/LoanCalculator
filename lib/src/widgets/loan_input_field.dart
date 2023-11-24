import 'package:flutter/material.dart';

class LoanInputField extends StatelessWidget {
  final String label;
  final IconData icon;
  final TextInputType keyboardType;

  const LoanInputField({
    Key? key,
    required this.label,
    required this.icon,
    required this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: const OutlineInputBorder(),
      ),
      keyboardType: keyboardType,
    );
  }
}
