import 'package:chat_app/group/bloc/bloc.dart';
import 'package:chat_app/group/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CreateGroupPage extends StatelessWidget {
  const CreateGroupPage({super.key});

  /// The static route for GroupPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const CreateGroupPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GroupBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Create Group'),
        ),
        body: const GroupBodyView(),
      ),
    );
  }
}

class GroupBodyView extends StatelessWidget {
  const GroupBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupBloc, GroupState>(
      builder: (context, state) {
        if (state is GroupStateInitial) {
          return const CreateGroupWidget();
        } else if (state is GroupStateLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GroupStateSuccess) {
          Navigator.pop(context, state.group);
          return const Center(child: Text('Updating State'));
        } else {
          final errorState = state as GroupStateError;
          return Center(child: Text(errorState.message));
        }
      },
    );
  }
}
