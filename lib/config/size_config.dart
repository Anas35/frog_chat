import 'package:flutter/material.dart';

class SizeConfig extends StatelessWidget {
  const SizeConfig({super.key, required this.large, required this.medium, required this.small});

  final Widget large;
  final Widget medium;
  final Widget small;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 450) {
      return small;
    } else if (width < 900) {
      return medium;
    } else {
      return large;
    }
  }
}
