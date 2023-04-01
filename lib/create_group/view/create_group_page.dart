import 'package:api_wrapper/api_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:frog_chat/create_group/cubit/cubit.dart';
import 'package:frog_chat/create_group/widgets/create_group_body.dart';

class CreateGroupPage extends StatelessWidget {
  const CreateGroupPage({super.key});
  
  static Future<T?> showDailogView<T>(BuildContext context) async {
    return showDialog<T>(context: context, builder: (_) {
      return const CreateGroupPage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateGroupCubit(
        api: context.read<ApiWrapper>(),
      ),
      child: const CreateGroupBody(),
    );
  }
}
