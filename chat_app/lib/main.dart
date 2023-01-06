import 'package:chat_app/authentication/cubit/authentication_cubit.dart';
import 'package:chat_app/authentication/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationCubit>(
      create: (context) => AuthenticationCubit()..initialize(),
      child: MaterialApp(
        title: 'Socket Chat',
        theme: ThemeData.dark(),
        home: const SplashView(),
      ),
    );
  }
}
