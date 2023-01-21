import 'package:chat_app/chat/widgets/chat_box.dart';
import 'package:chat_app/config/size_config.dart';
import 'package:chat_app/current_user/cubit/current_user_cubit.dart';
import 'package:chat_app/group/view/view.dart';
import 'package:chat_app/selected_group/selected_group_cubit.dart';
import 'package:chat_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/chat/bloc/bloc.dart';
import 'package:models/models.dart';

class ChatBody extends StatefulWidget {
  const ChatBody({super.key});

  @override
  State<ChatBody> createState() => _ChatBodyState();
}

class _ChatBodyState extends State<ChatBody> {
  late final ScrollController scrollController;
  late final TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    textEditingController = TextEditingController();

    Future.delayed(Duration.zero, () {
      if (scrollController.hasClients) {
        scrollController.jumpTo(
          scrollController.position.maxScrollExtent,
        );
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  controller: scrollController,
                  slivers: [
                    const SizedAppBar(),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        childCount: state.messages.length,
                        (context, index) {
                          final messageDetails = state.messages[index];
                          if (index % 2 == 0) {
                            return ChatBox(
                              isSender: false,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(messageDetails.user.name),
                                  Text(messageDetails.message),
                                ],
                              ),
                            );
                          } else {
                            return ChatBox(
                              isSender: true,
                              child: Text(
                                messageDetails.message,
                                textAlign: TextAlign.end,
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              ChatTextField(
                controller: textEditingController,
                onPressed: () {
                  final userId = context.read<CurrentUserCubit>().state!.id;
                  final groupId = context.read<SelectedGroupCubit>().state!.groupId;
                  context.read<ChatBloc>().add(
                      AddMessageEvent(
                        message: textEditingController.text,
                        groupId: groupId,
                        userId: userId,
                      ),
                    );
                    textEditingController.clear();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class SizedAppBar extends StatelessWidget {
  const SizedAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedGroupCubit, Group?>(
      builder: (context, state) {
        return SizeConfig(
          large: SliverAppBar(
            pinned: true,
            title: Text(state!.groupName),
          ),
          medium: SliverAppBar(
            pinned: true,
            title: InkWell(
              onTap: () {
                Navigator.push(context, GroupDetailView.route(state));
              },
              child: Text(state.groupName),
            ),
          ),
          small: SliverAppBar(
            pinned: true,
            title: InkWell(
              onTap: () {
                Navigator.push(context, GroupDetailView.route(state));
              },
              child: Text(state.groupName),
            ),
          ),
        );
      },
    );
  }
}
