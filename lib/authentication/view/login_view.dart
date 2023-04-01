import 'package:api_wrapper/api_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:frog_chat/authentication/cubit/cubit.dart';
import 'package:frog_chat/authentication/widgets/login_body.dart';

class LogInView extends StatelessWidget {
  const LogInView({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const LogInView());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationCubit(context.read<ApiWrapper>()),
      child: Scaffold(
        appBar: AppBar(),
        body: const LogInBody(),
      ),
    );
  }
}