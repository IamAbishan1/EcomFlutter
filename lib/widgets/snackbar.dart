import 'package:flutter/material.dart';

class CustomSnackbar {
  static showSnackbar(context, text, backgroundColor, textColor) {
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(milliseconds: 300),
      backgroundColor: backgroundColor,
      content: Text(
        text,
        style: TextStyle(color: textColor),
      ),
    ));
  }
}
