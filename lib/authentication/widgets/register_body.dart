import 'package:frog_chat/extension.dart';
import 'package:frog_chat/home_view.dart';
import 'package:frog_chat/user/user.dart';
import 'package:frog_chat/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:frog_chat/authentication/cubit/cubit.dart';
import 'package:validator/validator.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        final errorMessage = context.read<AuthenticationCubit>().registerErrorMessage;
        if (errorMessage != null) {
          context.showSnackbar(errorMessage);
          context.read<AuthenticationCubit>().resetStatus();
        }
        if (state.status.isFailure) {
          context.showSnackbar('Failed to LogIn Groups');
        }
        if (state.status.isSuccess) {
          context.read<UserCubit>().updateState(state.token);
          Navigator.pushAndRemoveUntil(context, HomeView.route(), (route) => false);
        }
      },
      builder: (context, state) {
      return Scaffold(
        body: Center(
          child: SizedBox(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ReTextField(
                  labelText: 'Name',
                  onChanged: context.read<AuthenticationCubit>().onNameChange,
                ),
                const SizedBox(height: 30),
                ReTextField(
                  labelText: 'Email',
                  onChanged: context.read<AuthenticationCubit>().onEmailChange,
                ),
                const SizedBox(height: 30),
                ReTextField(
                  labelText: 'Password',
                  onChanged: context.read<AuthenticationCubit>().onPasswordChange,
                ),
                const SizedBox(height: 30),
                ReButton(
                  onPressed: () async {
                    await context.read<AuthenticationCubit>().register();
                  },
                  text: 'Register',
                ),
              ],
            ),
          ),
        ),
      );
      }
    );
  }
}
