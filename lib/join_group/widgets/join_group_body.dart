import 'package:frog_chat/extension.dart';
import 'package:frog_chat/join_group/join_group.dart';
import 'package:frog_chat/user/user.dart';
import 'package:frog_chat/widgets/widgets.dart';
import 'package:flutter/material.dart';

class JoinGroupBody extends StatelessWidget {
  const JoinGroupBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<JoinGroupCubit, JoinGroupState>(
      listener: (context, state) {
        if (state.status.isFailure) {
          final error = state.groupId.error;
          if (error != null) {
            context.showSnackbar(error.name);
            context.read<JoinGroupCubit>().resetStatus();
          }
        }
      },
      builder: (context, state) {
        return Dialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: SizedBox(
              width: 300,
              child: ListView(
                shrinkWrap: true,
                children: [
                  Center(
                      child: Text(
                    'Join Group',
                    style: Theme.of(context).textTheme.titleLarge,
                  )),
                  const SizedBox(height: 15.0),
                  ReTextField(
                    labelText: 'Group Id',
                    onChanged: context.read<JoinGroupCubit>().onGroupIdChange,
                  ),
                  const SizedBox(height: 30.0),
                  ReButton(
                    text: 'Join',
                    onPressed: () {
                      final user = context.read<UserCubit>().state;
                      context.read<JoinGroupCubit>().joinGroup(user.userId, user.token);
                    },
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
