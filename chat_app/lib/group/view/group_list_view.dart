import 'package:chat_app/current_user/current_user.dart';
import 'package:chat_app/join_group/view/join_group_page.dart';
import 'package:chat_app/selected_group/selected_group_cubit.dart';
import 'package:chat_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';

class GroupsListView extends StatelessWidget {
  const GroupsListView({super.key});

  @override
  Widget build(BuildContext context) {
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
                BlocBuilder<CurrentUserCubit, User?>(
                  builder: (context, state) {
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        childCount: state?.groups.length ?? 0,
                        (context, index) {
                          final group = state!.groups[index];
                          return RoomDirectButton(
                            text: group.groupName, 
                            onPressed: (){
                              context.read<SelectedGroupCubit>().updateGroup(group);
                            },
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          ElevatedIconButton(icons: Icons.create, text: 'Create Group', onPressed: () {}),
          ElevatedIconButton(
            icons: Icons.add, 
            text: 'Join Group', 
            onPressed: () {
              JoinGroupPage.showDailogView(context);
            },
          ),
        ],
      ),
    );
  }
}
