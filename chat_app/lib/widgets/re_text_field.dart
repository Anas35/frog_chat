import 'package:flutter/material.dart';

class ReTextField extends StatelessWidget {
  const ReTextField({super.key, required this.labelText, this.onChanged});

  final String labelText;

  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        floatingLabelStyle: const TextStyle(fontSize: 17.0),
        labelText: labelText,
        contentPadding: const EdgeInsets.symmetric(vertical: 2.0),
        labelStyle: const TextStyle(fontWeight: FontWeight.w400),
      ),
    );
  }
}
