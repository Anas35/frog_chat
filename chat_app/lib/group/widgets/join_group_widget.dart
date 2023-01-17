import 'package:chat_app/current_user/current_user.dart';
import 'package:chat_app/group/bloc/bloc.dart';
import 'package:chat_app/widgets/re_button.dart';
import 'package:chat_app/widgets/re_text_field.dart';
import 'package:flutter/material.dart';
import 'package:models/models.dart';

class JoinGroupWidget extends StatelessWidget {
  const JoinGroupWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupBloc, GroupState>(
      builder: (context, state) {
        state as GroupStateInitial;
        return Center(
          child: SizedBox(
            width: 250,
            child: ListView(
              shrinkWrap: true,
              children: [
                ReTextField(
                  labelText: 'Group Id',
                  onChanged: (value) =>
                      context.read<GroupBloc>().add(GroupInputEvent(groupInput: value)),
                ),
                const SizedBox(height: 15.0),
                ReButton(
                  text: 'Join',
                  onPressed: () {
                    final userId = context.read<CurrentUserCubit>().state!.id;
                    final participant = Participants(groupId: state.groupInput, userId: userId);
                    context.read<GroupBloc>().add(JoinGroupEvent(participant: participant));
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
