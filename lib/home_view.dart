import 'package:frog_chat/chat/chat.dart';
import 'package:frog_chat/config/size_config.dart';
import 'package:frog_chat/group_list/group_list.dart';
import 'package:frog_chat/selected_group/selected_group_cubit.dart';
import 'package:flutter/material.dart';
import 'package:models/models.dart';

import 'group_detail_view.dart';

class HomeView extends StatelessWidget {

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const HomeView());
  }

  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedGroupCubit, Group?>(
      builder: (context, state) {
        return Scaffold(
          body: SizeConfig(
            small: const GroupListView(),
            medium: Row(
              children: [
                const Expanded(
                  child: GroupListView(),
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
                  child: GroupListView(),
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
