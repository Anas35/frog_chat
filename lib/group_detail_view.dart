import 'package:frog_chat/selected_group/selected_group_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';

class GroupDetailView extends StatelessWidget {
  const GroupDetailView({super.key});

  /// The static route for ChatPage
  static Route<dynamic> route(Group group) {
    return MaterialPageRoute<dynamic>(builder: (_) => const GroupDetailView());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedGroupCubit, Group?>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                title: Text(state!.groupName),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    children: [
                      Text(
                        'Groups Code: ${state.groupId}',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 5.0),
                      const Text(
                        'Invite other using above code',
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 5.0),
                    ],
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    child: Text('Participants')),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: 10,
                  (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(8.0),
                      margin: const EdgeInsets.only(top: 8.0),
                      child: Text(' inde'),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
