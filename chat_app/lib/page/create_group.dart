import 'package:chat_app/authentication/cubit/authentication_cubit.dart';
import 'package:chat_app/groups_creation/cubits/group_code_cubit/group_code_cubit.dart';
import 'package:chat_app/groups_creation/cubits/group_cubit/group_cubit.dart';
import 'package:chat_app/groups_creation/group_enum.dart';
import 'package:chat_app/groups_creation/views/code_generate_view.dart';
import 'package:chat_app/page/home_page.dart';
import 'package:chat_app/widgets/re_button.dart';
import 'package:chat_app/widgets/re_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';

class CreateGroupPage extends StatefulWidget {
  const CreateGroupPage({super.key});

  @override
  State<CreateGroupPage> createState() => _CreateGroupPageState();
}

class _CreateGroupPageState extends State<CreateGroupPage> {
  late String groupId;
  late String groupName;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GroupCodeCubit()),
        BlocProvider(create: (context) => GroupCubit()),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<GroupCodeCubit, GroupCodeState>(
            listener: (context, state) {
              if (state.groupCode != null) {
                groupId = state.groupCode!;
              }
            },
          ),
          BlocListener<GroupCodeCubit, GroupCodeState>(
            listener: (context, state) {
              if (state.status == Status.failed) {
                context.snackBar("${state.message}");
              } else if (state.status == Status.success) {
                Navigator.pop(context);
              }
            },
          ),
        ],
        child: BlocBuilder<GroupCubit, GroupState>(
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
                      const CodeGenerateView(),
                      const SizedBox(height: 10.0),
                      ReTextField(
                        labelText: 'Group Name',
                        onChanged: (value) => groupName = value,
                      ),
                      const SizedBox(height: 15.0),
                      ReButton(
                        text: 'Create',
                        onPressed: () {
                          final group = Group(groupId: groupId, groupName: groupName);
                          final userId = context.read<AuthenticationCubit>().userId;
                          final participant = Participants(groupId: groupId, userId: userId!);

                          final groupCubit = context.read<GroupCubit>();
                          groupCubit.createAndJoin(group, participant);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
