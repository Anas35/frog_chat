import 'package:chat_app/current_user/current_user.dart';
import 'package:chat_app/current_user/view/group_details_view.dart';
import 'package:chat_app/group/group.dart';
import 'package:chat_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.userId});

  final String userId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('Groups'),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(54.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ReButton(
                    onPressed: () async {
                      final group = await Navigator.push(
                        context,
                        CreateGroupPage.route(),
                      );
                      ///TODO
                    },
                    text: 'Create group',
                  ),
                  const SizedBox(height: 30),
                  ReButton(
                    onPressed: () async {
                      final group = await Navigator.push(
                        context,
                        JoinGroupPage.route(),
                      );
                      ///TODO
                    },
                    text: 'Join group',
                  ),
                ],
              ),
            ),
          ),
          BlocBuilder<CurrentUserCubit, User?>(
            builder: (context, state) {
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final group = state!.groups[index];
                    return GroupDetailsView(group: group);
                  },
                  childCount: state?.groups.length,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

extension Nav on BuildContext {
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snackBar(String message) {
    return ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(message),
      ),
    );
  }
}
