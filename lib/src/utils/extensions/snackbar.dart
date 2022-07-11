import 'package:flutter/material.dart';

extension ShowSnackBar on BuildContext {
  void showNackBar({
    required String message,
    Color bacgraundColor = Colors.teal,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: bacgraundColor,
      ),
    );
  }
}
