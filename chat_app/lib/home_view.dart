import 'package:chat_app/chat/chat.dart';
import 'package:chat_app/config/size_config.dart';
import 'package:chat_app/group/group.dart';
import 'package:chat_app/selected_group/selected_group_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';

class HomeView extends StatelessWidget {

  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedGroupCubit, Group?>(
      builder: (context, state) {
        return Scaffold(
          body: SizeConfig(
            small: const GroupsListView(),
            medium: Row(
              children: [
                const Expanded(
                  child: GroupsListView(),
                ),
                Expanded(
                  flex: 2,
                  child: state == null
                      ? const SizedBox(child: Text('Hi'))
                      : const ChatView(),
                ),
              ],
            ),
            large: Row(
              children: [
                const Expanded(
                  child: GroupsListView(),
                ),
                if (state == null) ...{
                  const Expanded(
                    flex: 3,
                    child: Center(child: Text('Hi NO wat')),
                  ),
                } else ...{
                  const Expanded(
                    flex: 2,
                    child: ChatView(),
                  ),
                  const Expanded(
                    child: GroupDetailView(),
                  ),
                }
              ],
            ),
          ),
        );
      },
    );
  }
}
