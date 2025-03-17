import 'package:flutter/material.dart';
import 'package:imecehub/core/widgets/text.dart';
import 'package:imecehub/screens/home/style/home_screen_style.dart';

Material textButton(
  BuildContext context,
  String title, {
  Color? buttonColor,
  Color? titleColor,
  double? fontSize,
  double? minSizeWidth,
  double? minSizeHeight,
  FontWeight weight = FontWeight.w500,
  double? elevation,
  Color? shadowColor,
  BorderRadiusGeometry? borderRadius,
  Function()? onPressed,
}) {
  final effectiveButtonColor =
      buttonColor ?? Theme.of(context).colorScheme.secondary;
  final effectiveTextColor =
      titleColor ?? Theme.of(context).colorScheme.onSecondary;
  final effectiveMinSizeWidth =
      minSizeWidth ?? MediaQuery.of(context).size.width;
  final effectiveMinSizeHeight = minSizeHeight ?? 50;
  final effectiveFontSize =
      fontSize ?? HomeStyle(context: context).bodyLarge.fontSize;
  return Material(
    elevation: elevation ?? 16, // Gölgeleme seviyesi
    shadowColor: shadowColor ??
        HomeStyle(context: context)
            .shadow
            .withOpacity(0.5), // Gölgenin rengi ve opaklığı
    borderRadius: borderRadius ?? BorderRadius.circular(8.0),
    child: TextButton(
      onPressed: onPressed,
      child: customText(title, context,
          color: effectiveTextColor, size: effectiveFontSize, weight: weight),
      style: ButtonStyle(
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(8.0),
          )),
          minimumSize: WidgetStateProperty.all<Size?>(
              Size(effectiveMinSizeWidth, effectiveMinSizeHeight)),
          backgroundColor:
              WidgetStateProperty.all<Color>(effectiveButtonColor)),
    ),
  );
}
