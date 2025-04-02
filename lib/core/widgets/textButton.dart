import 'package:flutter/material.dart';
import 'package:imecehub/core/widgets/richText.dart';
import 'package:imecehub/screens/home/style/home_screen_style.dart';

SizedBox textButton(
  BuildContext context,
  String title, {
  Color? buttonColor,
  Color? titleColor,
  double? fontSize,
  double? minSizeWidth,
  double? minSizeHeight,
  FontWeight weight = FontWeight.w400,
  double? elevation,
  Color? shadowColor,
  BorderRadiusGeometry? borderRadius,
  Function()? onPressed,
  bool border = false,
  double? borderWidth,
  Color? borderColor,
  EdgeInsets? padding,
  Widget? icon,
  AlignmentGeometry? textAlignment,
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
  BorderSide? test = border == true
      ? BorderSide(
          color: borderColor ?? HomeStyle(context: context).outline,
          width: borderWidth ?? 0)
      : null;
  return SizedBox(
    width: effectiveMinSizeWidth,
    height: effectiveMinSizeHeight,
    child: Material(
      elevation: elevation ?? 16, // Gölgeleme seviyesi
      shadowColor: shadowColor ??
          HomeStyle(context: context)
              .shadow
              .withOpacity(0.5), // Gölgenin rengi ve opaklığı
      borderRadius: borderRadius ?? BorderRadius.circular(8.0),
      child: TextButton(
        onPressed: onPressed,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: richText(
            context,
            color: effectiveTextColor,
            fontSize: fontSize,
            fontWeight: weight,
            children: [
              TextSpan(text: title),
              WidgetSpan(

                  //alignment: PlaceholderAlignment.,
                  child: Builder(
                builder: (context) {
                  if (icon != null) {
                    return icon;
                  } else {
                    return SizedBox();
                  }
                },
              ))
            ],
          ),
        ),
        style: ButtonStyle(
            alignment: textAlignment,
            side: WidgetStateProperty.all<BorderSide?>(test),
            padding:
                WidgetStateProperty.all<EdgeInsets>(padding ?? EdgeInsets.zero),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(8.0),
            )),
            minimumSize: WidgetStateProperty.all<Size?>(
                Size(effectiveMinSizeWidth, effectiveMinSizeHeight)),
            backgroundColor:
                WidgetStateProperty.all<Color>(effectiveButtonColor)),
      ),
    ),
  );
}
