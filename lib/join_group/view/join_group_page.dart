import 'package:api_wrapper/api_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:frog_chat/join_group/cubit/cubit.dart';
import 'package:frog_chat/join_group/widgets/join_group_body.dart';

class JoinGroupPage extends StatelessWidget {
  
  const JoinGroupPage({super.key});

  static Future<T?> showDailogView<T>(BuildContext context) async {
    return showDialog<T>(context: context, builder: (_) {
      return const JoinGroupPage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => JoinGroupCubit(
        api: context.read<ApiWrapper>()
      ),
      child: const JoinGroupBody(),
    );
  }    
}