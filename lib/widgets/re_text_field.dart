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

class ChatTextField extends StatelessWidget {
  const ChatTextField({super.key, this.onPressed, this.controller});

  final void Function()? onPressed;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onSubmitted: (value) {
        if(onPressed != null) onPressed!();
      },
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.fromLTRB(10.0, 6.0, 10.0, 0.0),
        suffixIcon: IconButton(
          padding: const EdgeInsets.all(0.0),
          onPressed: onPressed,
          icon: const Icon(Icons.send),
        ),
      ),
    );
  }
}
