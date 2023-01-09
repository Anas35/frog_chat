import 'package:chat_app/chat_room/cubit/chat_room_cubit.dart';
import 'package:chat_app/current_user/cubit/current_user_cubit.dart';
import 'package:chat_app/user_details/view/user_details_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.groupId});

  final String groupId;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late final ScrollController scrollController;
  late final TextEditingController textEditingController;
  late final ChatRoomCubit chatRoomCubit;

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

    if (mounted) {
      chatRoomCubit = BlocProvider.of(context);
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    textEditingController.dispose();
    chatRoomCubit.closeChat();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatRoomCubit, List<Message>>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Center(
                child: SizedBox(
                  width: 250,
                  child: Column(
                    children: [
                      Expanded(
                        child: CustomScrollView(
                          controller: scrollController,
                          scrollBehavior: const CustomScrollBehaviour(),
                          slivers: [
                            SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (context, index) {
                                  final message = state[index];
                                  return UserDetailsView(
                                    userId: message.userId,
                                    message: message.message,
                                  );
                                },
                                childCount: state.length,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: TextField(
                          controller: textEditingController,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            prefixIcon: IconButton(
                              onPressed: () {
                                final userId = context.read<CurrentUserCubit>().state!.id;
                                final message = Message(groupId: widget.groupId, userId: userId, message: textEditingController.text);

                                context.read<ChatRoomCubit>().sendMessage(message);
                              },
                              icon: const Icon(Icons.send),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
        );
            },
    );
  }
}

class CustomScrollBehaviour extends MaterialScrollBehavior {
  const CustomScrollBehaviour();

  @override
  Widget buildScrollbar(BuildContext context, Widget child, ScrollableDetails details) {
    switch (axisDirectionToAxis(details.direction)) {
      case Axis.horizontal:
        return child;
      case Axis.vertical:
        switch (getPlatform(context)) {
          case TargetPlatform.linux:
          case TargetPlatform.macOS:
          case TargetPlatform.windows:
            return Scrollbar(
              radius: Radius.zero,
              thickness: 10.0,
              controller: details.controller,
              child: child,
            );
          case TargetPlatform.android:
          case TargetPlatform.fuchsia:
          case TargetPlatform.iOS:
            return child;
        }
    }
  }

  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.mouse,
        ...super.dragDevices,
      };
}
