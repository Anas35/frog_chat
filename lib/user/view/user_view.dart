import 'package:frog_chat/authentication/authentication.dart';
import 'package:frog_chat/home_view.dart';
import 'package:frog_chat/user/cubit/cubit.dart';
import 'package:flutter/material.dart';

class UserView extends StatelessWidget {
  const UserView({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) {
      return const UserView();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state.isLogged()) {
          return const HomeView();
        } else {
          return const AuthenticationView();
        }
      },
    );
  }
}