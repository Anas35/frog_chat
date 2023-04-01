import 'package:frog_chat/create_group/create_group.dart';
import 'package:frog_chat/join_group/join_group.dart';
import 'package:frog_chat/selected_group/selected_group_cubit.dart';
import 'package:frog_chat/user/cubit/user_cubit.dart';
import 'package:frog_chat/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:frog_chat/group_list/cubit/cubit.dart';

class GroupListBody extends StatelessWidget {
  const GroupListBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupListCubit, GroupListState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          child: Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    const SliverAppBar(
                      floating: true,
                      title: Text('Rooms'),
                      centerTitle: true,
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        childCount: state.groups.length,
                        (context, index) {
                          final group = state.groups[index];
                          return RoomDirectButton(
                            text: group.groupName,
                            onPressed: () {
                              context.read<SelectedGroupCubit>().updateGroup(group);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedIconButton(
                icons: Icons.create, 
                text: 'Create Group',
                onPressed: () async {
                  await CreateGroupPage.showDailogView(context);
                  if (context.mounted) {
                    final user = context.read<UserCubit>().state;
                    context.read<GroupListCubit>().getGroups(user.userId, user.token);
                  }
                },
              ),
              ElevatedIconButton(
                icons: Icons.add,
                text: 'Join Group',
                onPressed: () async {
                  await JoinGroupPage.showDailogView(context);
                  if (context.mounted) {
                    final user = context.read<UserCubit>().state;
                    context.read<GroupListCubit>().getGroups(user.userId, user.token);
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
