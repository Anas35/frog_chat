import 'package:chat_app/authentication/cubit/authentication_cubit.dart';
import 'package:chat_app/page/home_page.dart';
import 'package:chat_app/widgets/re_button.dart';
import 'package:chat_app/widgets/re_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state.status == AuthenticationStatus.unauthenticated) {
          Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) => const LogView(),
            ),
          );
        } else if (state.status == AuthenticationStatus.authenticated) {
          Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
          );
        }
      },
      child: const Center(child: CircularProgressIndicator()),
    );
  }
}

class LogView extends StatefulWidget {
  const LogView({super.key});

  @override
  State<LogView> createState() => _LogViewState();
}

class _LogViewState extends State<LogView> {

  late String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ReTextField(
              labelText: 'UserName',
              onChanged: (val) => name = val,
            ),
            const SizedBox(height: 30),
            ReButton(
              onPressed: () async {
                if(name.isNotEmpty) {
                  try {
                    context.read<AuthenticationCubit>().logIn(name);
                  } catch (e) {
                    print(e);
                    context.snackBar('$e');
                  }
                }
              },
              text: 'Join group',
            ),
          ],
        ),
      ),
    );
  }
}
