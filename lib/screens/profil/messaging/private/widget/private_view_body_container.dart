import 'package:flutter/material.dart';
import 'package:imecehub/core/widgets/text.dart';

Container customContainer(BuildContext context, bool isMe, dynamic message) {
  return Container(
    margin: isMe
        ? EdgeInsets.only(left: 50, right: 20)
        : EdgeInsets.only(right: 60),
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: isMe
          ? Theme.of(context).colorScheme.secondary
          : Theme.of(context).colorScheme.primary,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customText(
          message['sender'],
          context,
          weight: FontWeight.bold,
          size: Theme.of(context).textTheme.bodySmall!.fontSize,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        const SizedBox(height: 4),
        customText(message['message'], context,
            color: Theme.of(context).colorScheme.onPrimary,
            size: Theme.of(context).textTheme.bodyLarge!.fontSize),
      ],
    ),
  );
}
