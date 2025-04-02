import 'package:flutter/material.dart';

Padding customText(
  String text,
  BuildContext context, {
  Color? color, // text'in rengi
  double? size, // text'in boyutu
  FontWeight weight = FontWeight.normal, // text'in kalınlığı
  int maxLines = 1, // kaç satır olacağı
  TextDecoration decoration = TextDecoration.none, // Text'e tasarım için
  bool softWrap =
      true, // metnin otomatik olarak satır sonlarında sarmalanıp sarmalanmayacağı
  TextAlign textAlign = TextAlign.start, // yazıyı ortalar
  TextOverflow overflow = TextOverflow.ellipsis, // taşarsa ... olarak gösterir
  EdgeInsetsGeometry padding = const EdgeInsets.all(0),
}) {
  final effectiveColor = color ?? Theme.of(context).colorScheme.primary;
  return Padding(
    padding: padding,
    child: Text(
      text,
      style: TextStyle(
          color: effectiveColor,
          fontSize: size ?? Theme.of(context).textTheme.bodyMedium!.fontSize,
          fontWeight: weight,
          decoration: decoration,
          decorationColor: effectiveColor),
      softWrap: softWrap,
      maxLines: maxLines,
      overflow: overflow ?? null,
      textAlign: textAlign,
    ),
  );
}
