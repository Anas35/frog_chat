import 'package:chat_app/group_details/group_details.dart';
import 'package:chat_app/groups_creation/cubits/group_list_cubit/group_list_cubit.dart';
import 'package:chat_app/page/create_group.dart';
import 'package:chat_app/page/join_group.dart';
import 'package:chat_app/widgets/re_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.userId});

  final String userId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GroupListCubit()..getGroupList(userId)),
      ],
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: const Text('Groups'),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(54.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ReButton(
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const CreateGroupPage()),
                        );
                        if (context.mounted) {
                          await context.read<GroupListCubit>().getGroupList(userId);
                        }
                      },
                      text: 'Create group',
                    ),
                    const SizedBox(height: 30),
                    ReButton(
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const JoinGroupPage()),
                        );
                        if (context.mounted) {
                          await context.read<GroupListCubit>().getGroupList(userId);
                        }
                      },
                      text: 'Join group',
                    ),
                  ],
                ),
              ),
            ),
            BlocBuilder<GroupListCubit, GroupListState>(
              builder: (context, state) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final groupId = state.groupList[index];
                      return GroupDetailsView(groupId: groupId);
                    },
                    childCount: state.groupList.length,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

extension Nav on BuildContext {
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snackBar(String message) {
    return ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(message),
      ),
    );
  }
}
