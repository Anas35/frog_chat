import 'package:flutter/material.dart';

class ReButton extends StatelessWidget {
  const ReButton({super.key, required this.text, this.onPressed});

  final String text;

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(120.0, 40.0),
        textStyle: const TextStyle(fontWeight: FontWeight.w400)
      ),
      child: Text(text),
    );
  }
}
