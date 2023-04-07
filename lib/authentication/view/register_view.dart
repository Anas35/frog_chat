import 'package:api_wrapper/api_wrapper.dart';
import 'package:frog_chat/authentication/authentication.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const RegisterView());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationCubit(context.read<ApiWrapper>()),
      child: const RegisterBody(),
    );
  }
}
