import 'package:chat_app/groups_creation/group_enum.dart';
import 'package:chat_app/user_details/cubit/user_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDetailsView extends StatelessWidget {
  const UserDetailsView({super.key, required this.userId, required this.message});

  final String userId;
  final String message;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDetailsCubit, UserDetailsState>(
      bloc: UserDetailsCubit()..fetchUser(userId),
      builder: (context, state) {
        if (state.status == Status.loading) {
          return const SizedBox(
            height: 50,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state.status == Status.success) {
          return SizedBox(
            height: 65,
            child: Column(
              children: [
                Text(state.user?.name ?? "None"),
                Text(message),
              ],
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
