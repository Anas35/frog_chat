import 'package:flutter/material.dart';

class ChatBox extends StatelessWidget {
  final bool isSender;

  final Widget child;

  const ChatBox({super.key, required this.isSender, required this.child});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: isSender ? const EdgeInsets.only(left: 20.0) : const EdgeInsets.only(right: 20.0),
        child: Container(
          margin: const EdgeInsets.all(8.0),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: isSender ? Colors.green : Colors.grey,
            borderRadius: const BorderRadius.all(Radius.circular(6.0)),
          ),
          child: child,
        ),
      ),
    );
  }
}
