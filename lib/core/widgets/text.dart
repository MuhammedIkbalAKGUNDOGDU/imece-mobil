import 'package:flutter/material.dart';

Text customText(
  String text,
  BuildContext context, {
  Color? color,
  double? size,
  FontWeight weight = FontWeight.normal,
  int maxLines = 1,
  TextDecoration decoration = TextDecoration.none,
}) {
  final effectiveColor = color ?? Theme.of(context).colorScheme.primary;
  return Text(
    text,
    style: TextStyle(
        color: effectiveColor,
        fontSize: size ?? Theme.of(context).textTheme.bodyMedium!.fontSize,
        fontWeight: weight,
        decoration: decoration,
        decorationColor: effectiveColor),
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    textAlign: TextAlign.center,
  );
}
