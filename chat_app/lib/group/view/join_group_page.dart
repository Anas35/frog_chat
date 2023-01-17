import 'package:flutter/material.dart';
import 'package:chat_app/group/bloc/bloc.dart';
import 'package:chat_app/group/widgets/widgets.dart';

class JoinGroupPage extends StatelessWidget {
  const JoinGroupPage({super.key});

  /// The static route for GroupPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const JoinGroupPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GroupBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Create Group'),
        ),
        body: const _GroupBodyView(),
      ),
    );
  }
}

class _GroupBodyView extends StatelessWidget {
  const _GroupBodyView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupBloc, GroupState>(
      builder: (context, state) {
        if (state is GroupStateInitial) {
          return const JoinGroupWidget();
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
