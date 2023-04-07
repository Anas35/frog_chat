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
        return ReScaffold(
          body: Center(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 1.25,
                    spreadRadius: 0.75,
                    offset: Offset(0.5, 1.0),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(24.0),
              width: 320.0,
              child: ListView(
                shrinkWrap: true,
                children: [
                  const Text(
                    'Create your Account!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30),
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
      },
    );
  }
}
