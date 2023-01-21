import 'package:chat_app/chat/bloc/bloc.dart';
import 'package:chat_app/config/scroll_config.dart';
import 'package:chat_app/selected_group/selected_group_cubit.dart';
import 'package:flutter/material.dart';

import 'current_user/current_user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => CurrentUserRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<CurrentUserCubit>(
            create: (context) => CurrentUserCubit(
              currentUserRepository: RepositoryProvider.of<CurrentUserRepository>(context),
            )..init(),
          ),
          BlocProvider(create: (_) => SelectedGroupCubit()),
          BlocProvider(create: (_) => ChatBloc())
        ],
        child: MaterialApp(
          scrollBehavior: ScrollConfig().copyWith(scrollbars: false),
          title: 'Socket Chat',
          theme: ThemeData.dark(),
          home: const SplashView(),
        ),
      ),
    );
  }
}
