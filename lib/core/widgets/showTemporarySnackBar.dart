import 'package:flutter/material.dart';

void showTemporarySnackBar(BuildContext context, String message,
    {TextStyle? style, int duration = 3, Color? color}) {
  final snackBar = SnackBar(
    backgroundColor: color ?? Colors.grey,
    content: Text(
      message,
      style: style,
    ),
    duration: Duration(seconds: duration),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
