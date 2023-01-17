import 'package:flutter/material.dart';
import 'package:chat_app/chat/bloc/bloc.dart';
import 'package:chat_app/chat/widgets/chat_body.dart';
import 'package:models/models.dart';

class ChatPage extends StatelessWidget {
  
  const ChatPage({super.key, required this.group});

  final Group group;

  /// The static route for ChatPage
  static Route<dynamic> route(Group group) {
    return MaterialPageRoute<dynamic>(builder: (_) => ChatPage(group: group));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatBloc(groupId: group.groupId)..add(PreMessagesEvent()),
      child: const Scaffold(
        body: ChatView(),
      ),
    );
  }    
}

class ChatView extends StatelessWidget {
  
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        switch (state.chatStatus) {
          case ChatStatus.initial:
            context.read<ChatBloc>().add(PreMessagesEvent());
            return const Center(
              child: CircularProgressIndicator(),
            );
          case ChatStatus.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case ChatStatus.loaded:
            return const ChatBody();
          case ChatStatus.failed:
            return Center(child: Text(state.errorMessage));
        }
      },
    );
  }
}
