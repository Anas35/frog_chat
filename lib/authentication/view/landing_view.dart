import 'package:flutter/material.dart';
import 'package:frog_chat/authentication/view/login_view.dart';
import 'package:frog_chat/authentication/view/register_view.dart';
import 'package:frog_chat/widgets/widgets.dart';

class LandingView extends StatelessWidget {
  const LandingView({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const LandingView());
  }

  @override
  Widget build(BuildContext context) {
    return ReScaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to FrogChat!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 25),
            ReButton(
              text: 'Register',
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              onPressed: () => Navigator.push(context, RegisterView.route()),
            ),
            const SizedBox(height: 25),
            ReButton(
              text: 'Log In',
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              onPressed: () => Navigator.push(context, LogInView.route()),
            ),
          ],
        ),
      ),
    );
  }
}
