import 'package:frog_chat/selected_group/selected_group_cubit.dart';
import 'package:frog_chat/user/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:frog_chat/chat/bloc/bloc.dart';
import 'package:frog_chat/chat/widgets/chat_body.dart';
import 'package:models/models.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  /// The static route for ChatPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const ChatView());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedGroupCubit, Group?>(
      builder: (context, state) {
        final user = context.read<UserCubit>().state;
        context.read<ChatBloc>().add(PreMessagesEvent(groupId: state!.groupId, token: user.token));
        return const ChatStateView();
      },
    );
  }
}

class ChatStateView extends StatelessWidget {
  const ChatStateView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        switch (state.chatStatus) {
          case ChatStatus.initial:
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
