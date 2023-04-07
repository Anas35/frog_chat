import 'package:api_wrapper/api_wrapper.dart';
import 'package:frog_chat/chat/bloc/chat_bloc.dart';
import 'package:frog_chat/config/scroll_config.dart';
import 'package:frog_chat/selected_group/selected_group_cubit.dart';
import 'package:frog_chat/user/repository/preference.dart';
import 'package:frog_chat/user/user.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final preference = Preference(
    sharedPreferences: await SharedPreferences.getInstance(),
  );
  runApp(MyApp(preference: preference));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.preference});

  final Preference preference;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(
          value: preference,
        ),
        RepositoryProvider(
          create: (_) => ApiWrapper(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => UserCubit(
              preference: context.read<Preference>(),
            )..getState(),
          ),
          BlocProvider(
            create: (context) => SelectedGroupCubit(),
          ),
          BlocProvider(
            create: (context) => ChatBloc(api: context.read<ApiWrapper>()),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          scrollBehavior: ScrollConfig().copyWith(scrollbars: false),
          title: 'Socket Chat',
          theme: ThemeData(
            useMaterial3: true,
          ),
          home: const RedirectView(),
        ),
      ),
    );
  }
}
