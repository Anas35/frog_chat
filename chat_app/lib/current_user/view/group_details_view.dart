import 'package:chat_app/chat/chat.dart';
import 'package:flutter/material.dart';
import 'package:models/models.dart';

class GroupDetailsView extends StatelessWidget {
  const GroupDetailsView({super.key, required this.group});

  final Group group;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, ChatPage.route(group));
      },
      child: Container(
        height: 50,
        padding: const EdgeInsets.all(12.0),
        child: Text('${group.groupId}: ${group.groupName}'),
      ),
    );
  }
}
