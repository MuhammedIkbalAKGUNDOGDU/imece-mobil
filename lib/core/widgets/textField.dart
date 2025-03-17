import 'package:flutter/material.dart';
import 'package:imecehub/screens/home/style/home_screen_style.dart';

TextField textField(
  BuildContext context, {
  String? hintText,
  Color? hintTextColor,
  BorderRadius? borderRadius,
  Color? borderColor,
  TextInputType? keyboardType,
  TextEditingController? controller,
  bool obscureText = false,
  bool showSuffixIcon = false,
  VoidCallback? onTap,
}) {
  return TextField(
    controller: controller,
    obscureText: obscureText,

    keyboardType:
        keyboardType ?? TextInputType.emailAddress, // Klavye tipi e-posta için
    decoration: InputDecoration(
      suffixIcon: showSuffixIcon
          ? IconButton(
              icon: Icon(
                obscureText ? Icons.visibility_off : Icons.visibility,
              ),
              onPressed: onTap,
            )
          : null,
      hintStyle: TextStyle(
          color: hintTextColor ??
              HomeStyle(context: context).outline.withOpacity(0.5)),
      hintText: hintText, // Hint metni
      border: OutlineInputBorder(
        borderRadius:
            borderRadius ?? BorderRadius.circular(8.0), // Kenar yumuşaklığı
        borderSide: BorderSide(
          color: borderColor ??
              HomeStyle(context: context).secondary, // Kenar çizgisinin rengi
        ),
      ),
    ),
  );
}
