import 'package:flutter/material.dart';

class MySnackbar {
  // Method to show an error snackbar
  static void showError(BuildContext context, String message) {
    _showSnackbar(
      context,
      message,
      backgroundColor: Colors.red,
    );
  }

  // Method to show a success snackbar
  static void showSuccess(BuildContext context, String message) {
    _showSnackbar(
      context,
      message,
      backgroundColor: Colors.green,
    );
  }

  static void showSnackBar(
    BuildContext context,
    String message,
  ) {
    _showSnackbar(
      context,
      message,
      backgroundColor: Colors.orange,
    );
  }

  // Private method to show the snackbar with a specified background color
  static void _showSnackbar(BuildContext context, String message,
      {required Color backgroundColor}) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 4),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
