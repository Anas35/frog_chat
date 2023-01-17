import 'package:flutter/material.dart';
import 'package:models/models.dart';

class ChatBox extends StatelessWidget {
  const ChatBox({super.key, required this.messageDetails});

  final MessageDetails messageDetails;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: Column(
        children: [
          Text(messageDetails.user.name),
          Text(messageDetails.message),
        ],
      ),
    );
  }
}
