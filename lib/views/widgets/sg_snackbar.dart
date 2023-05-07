import 'package:flutter/material.dart';

class SGSnackBar {
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> show(
      {required BuildContext context,
      required Color color,
      required String text,
      int? duration}) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: color,
        content: Text(text),
        duration: Duration(seconds: duration ?? 7),
      ),
    );
  }
}
