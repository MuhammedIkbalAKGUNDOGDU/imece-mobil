import 'package:flutter/material.dart';
import 'package:imecehub/core/widgets/shadow.dart';

Container container(
  BuildContext context, {
  double? width,
  double? height,
  Color? color,
  BorderRadius? borderRadius,
  Widget? child,
  double? blurRadius,
  Color? boxShadowColor,
  Offset? offset,
  double? withOpacity,
  EdgeInsets? margin,
  EdgeInsets? padding,
  Alignment? alignment,
  bool isBoxShadow = true,
  BoxBorder? border,
}) {
  List<BoxShadow> boxShadowDesign = isBoxShadow == true
      ? [
          boxShadow(context,
              blurRadius: blurRadius,
              color: boxShadowColor,
              offset: offset,
              withOpacity: withOpacity)
        ]
      : [];

  return Container(
    margin: margin,
    padding: padding,
    alignment: alignment,
    width: width ?? MediaQuery.of(context).size.width,
    height: height,
    decoration: BoxDecoration(
        border: border,
        borderRadius: borderRadius,
        color: color,
        boxShadow: boxShadowDesign),
    child: child,
  );
}


