import 'package:frog_chat/authentication/view/view.dart';
import 'package:frog_chat/widgets/re_button.dart';
import 'package:flutter/material.dart';

class AuthenticationView extends StatelessWidget {
  const AuthenticationView({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const AuthenticationView());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
          ),
          padding: const EdgeInsets.all(20.0),
          margin: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ReButton(
                text: 'Register', 
                onPressed: () {
                  Navigator.push(context, RegisterView.route());
                },
              ),
              const SizedBox(height: 25),
              ReButton(
                text: 'Log In', 
                onPressed: () {
                  Navigator.push(context, LogInView.route());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}