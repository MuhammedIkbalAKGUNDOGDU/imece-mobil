import 'package:flutter/material.dart';

final class HomeStyle {
  HomeStyle({required BuildContext context}) : _context = context;
  final BuildContext _context;

  Color get primary => Theme.of(_context).colorScheme.primary;
  Color get secondary => Theme.of(_context).colorScheme.secondary;
  Color get outline => Theme.of(_context).colorScheme.outline;
  Color get surface => Theme.of(_context).colorScheme.surface;
  Color get secondaryFixedDim =>
      Theme.of(_context).colorScheme.secondaryFixedDim;

  TextStyle get appBarTextStyle => Theme.of(_context).textTheme.headlineMedium!;
  TextStyle get headlineSmall => Theme.of(_context).textTheme.headlineSmall!;
  TextStyle get bodyLarge => Theme.of(_context).textTheme.bodyLarge!;
  TextStyle get bodyMedium => Theme.of(_context).textTheme.bodyMedium!;
  TextStyle get bodySmall => Theme.of(_context).textTheme.bodySmall!;
  TextStyle get labelLarge => Theme.of(_context).textTheme.labelLarge!;

  EdgeInsets get appBarPadding => const EdgeInsets.symmetric(horizontal: 20);
  EdgeInsets get bottomNavigationBarPadding =>
      const EdgeInsets.symmetric(horizontal: 20, vertical: 10);
  EdgeInsets get bodyPadding => const EdgeInsets.symmetric(horizontal: 20);

  BorderRadius get bottomNavigationBarBorderRadius =>
      BorderRadius.circular(16.0);

  BorderRadius get appBarTextFieldBorderRadius => BorderRadius.circular(26.0);
  BorderRadius get bodyCategoryContainerBorderRadius =>
      BorderRadius.circular(8.0);
}
