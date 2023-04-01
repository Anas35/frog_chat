import 'package:flutter/material.dart';

extension Context on BuildContext {

  void showSnackbar(String content) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(content: Text(content)));
  }

}