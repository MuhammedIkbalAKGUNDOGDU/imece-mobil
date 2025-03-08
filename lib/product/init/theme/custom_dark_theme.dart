import 'package:flutter/material.dart';
import 'package:imecehub/product/init/theme/custom_theme.dart';
import 'package:imecehub/product/init/theme/custom_color_scheme.dart';

final class CustomDarkTheme implements CustomTheme {
  @override
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        colorScheme: CustomColorScheme.darkColorScheme,
      );
}
