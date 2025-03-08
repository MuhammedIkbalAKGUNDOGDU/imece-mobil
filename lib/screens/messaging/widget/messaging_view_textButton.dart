import 'package:flutter/material.dart';
import 'package:imecehub/core/widgets/text.dart';

class MessagingViewTextbutton extends StatelessWidget {
  const MessagingViewTextbutton(
      {super.key,
      required this.text,
      required this.isSelected,
      required this.onPressed});
  final String text;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
        minimumSize: WidgetStateProperty.all<Size>(Size(100, 60)),
        backgroundColor: WidgetStateProperty.all<Color>(
          isSelected
              ? Theme.of(context).colorScheme.secondary
              : Theme.of(context).colorScheme.onPrimary,
        ),
      ),
      onPressed: onPressed,
      child: customText(text, context,
          size: Theme.of(context).textTheme.titleMedium!.fontSize,
          weight: isSelected ? FontWeight.bold : FontWeight.normal,
          color: isSelected ? Theme.of(context).colorScheme.onPrimary : null),
    );
  }
}
