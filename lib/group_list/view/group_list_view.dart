import 'package:api_wrapper/api_wrapper.dart';
import 'package:frog_chat/user/user.dart';
import 'package:flutter/material.dart';
import 'package:frog_chat/group_list/cubit/cubit.dart';
import 'package:frog_chat/group_list/widgets/group_list_body.dart';

class GroupListView extends StatelessWidget {
  const GroupListView({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const GroupListView());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final user = context.read<UserCubit>().state;
        final apiWrapper = context.read<ApiWrapper>();
        return GroupListCubit(api: apiWrapper)..getGroups(user.userId, user.token);
      },
      child: const GroupListBody(),
    );
  }
}