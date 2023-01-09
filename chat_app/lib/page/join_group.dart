import 'package:chat_app/authentication/cubit/authentication_cubit.dart';
import 'package:chat_app/current_user/current_user.dart';
import 'package:chat_app/groups_creation/cubits/group_cubit/group_cubit.dart';
import 'package:chat_app/groups_creation/group_enum.dart';
import 'package:chat_app/page/home_page.dart';
import 'package:chat_app/widgets/re_button.dart';
import 'package:chat_app/widgets/re_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';

class JoinGroupPage extends StatefulWidget {
  const JoinGroupPage({super.key});

  @override
  State<JoinGroupPage> createState() => _JoinGroupPageState();
}

class _JoinGroupPageState extends State<JoinGroupPage> {
  late String groupId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GroupCubit(),
      child: BlocConsumer<GroupCubit, GroupState>(
        listener: (context, state) {
          if (state.status == Status.failed) {
            context.snackBar(state.message ?? "Failed");
          } else if (state.status == Status.success) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          if (state.status == Status.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          return Scaffold(
            body: Center(
              child: SizedBox(
                width: 250,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    ReTextField(
                      labelText: 'Group Code',
                      onChanged: (value) => groupId = value,
                    ),
                    const SizedBox(height: 10.0),
                    BlocBuilder<CurrentUserCubit, User?>(
                      builder: (context, state) {
                        return ReButton(
                          text: 'Join',
                          onPressed: () async {
                            final participant = Participants(groupId: groupId, userId: state!.id);

                            context.read<GroupCubit>().joinGroup(participant);
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
