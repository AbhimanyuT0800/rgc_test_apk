import 'package:flutter/material.dart';
import 'package:rgc_test_apk/main.dart';

class SnackbarUtils {
  /// Show a message as a snackbar
  /// [message] Is the message to be shown to the user
  static void showSnakBar(String message) {
    MainApp.scaffoldMessngerKey.currentState!
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
