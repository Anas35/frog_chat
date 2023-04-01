import 'package:frog_chat/user/cubit/user_cubit.dart';
import 'package:frog_chat/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:frog_chat/create_group/cubit/cubit.dart';

class CreateGroupBody extends StatelessWidget {
  const CreateGroupBody({super.key});

  @override
  Widget build(BuildContext context) {
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
              ReTextField(
                labelText: 'Group Name',
                onChanged: context.read<CreateGroupCubit>().onGroupNameChanged,
              ),
              const SizedBox(height: 15.0),
              ReButton(
                text: 'Create',
                onPressed: () {
                  final user = context.read<UserCubit>().state;
                  context.read<CreateGroupCubit>().createGroup(user.userId, user.token);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
