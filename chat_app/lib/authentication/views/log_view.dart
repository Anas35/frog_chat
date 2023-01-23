import 'package:chat_app/authentication/authentication.dart';
import 'package:chat_app/current_user/current_user.dart';
import 'package:chat_app/home_view.dart';
import 'package:chat_app/widgets/re_button.dart';
import 'package:chat_app/widgets/re_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogView extends StatefulWidget {
  const LogView({super.key});

  @override
  State<LogView> createState() => _LogViewState();
}

class _LogViewState extends State<LogView> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state.authenticationStatus == AuthenticationStatus.authenticated) {
          context.read<CurrentUserCubit>().add(state.user);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeView(),
            ),
          );
        }

        if (state.errorMessage.isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('state.errorMessage'))
          );
        }
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ReTextField(
                labelText: 'UserName',
                onChanged: context.read<AuthenticationCubit>().onInputChanged,
              ),
              const SizedBox(height: 30),
              ReButton(
                onPressed: () async {
                  await context.read<AuthenticationCubit>().logIn();
                },
                text: 'Register',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
