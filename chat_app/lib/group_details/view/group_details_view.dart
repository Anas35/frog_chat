import 'package:chat_app/group_details/group_details.dart';
import 'package:chat_app/groups_creation/group_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GroupDetailsView extends StatelessWidget {
  const GroupDetailsView({super.key, required this.groupId});

  final String groupId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupDetailsCubit, GroupDetailsState>(
      bloc: GroupDetailsCubit()..fetchGroup(groupId),
      builder: (context, state) {
        if (state.status == Status.loading) {
          return const SizedBox(
            height: 50,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state.status == Status.success) {
          return Container(
            height: 60,
            padding: const EdgeInsets.all(12.0),
            child: Text('${state.group?.groupId}: ${state.group?.groupName}'),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
