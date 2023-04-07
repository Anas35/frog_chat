import 'package:flutter/material.dart';

class ReScaffold extends StatelessWidget {
  const ReScaffold({super.key, required this.body, this.showPop = true});

  final Widget body;

  final bool showPop;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF2979FF),
            Color(0xFF00E676),
          ],
        ),
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: showPop ? TextButton(
            onPressed: () => Navigator.pop(context),
            style: TextButton.styleFrom(
              foregroundColor: Colors.black,
            ),
            child: const Icon(Icons.arrow_back_ios_new),
          ) : const SizedBox(),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
        ),
        body: body,
      ),
    );
  }
}
