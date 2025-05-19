import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

abstract class AppToast {
  static void showSuccessToast(String message) {
    _showToast(
      message: message,
      backgroundColor: Colors.green,
      textColor: Colors.white,
    );
  }

  static void showErrorToast(String message) {
    _showToast(
      message: message,
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
  }

  static void _showToast({
    required String message,
    required Color backgroundColor,
    required Color textColor,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: 16.0,
    );
  }
}
