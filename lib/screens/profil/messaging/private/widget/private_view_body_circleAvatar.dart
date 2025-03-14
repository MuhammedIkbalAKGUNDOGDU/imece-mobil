import 'package:flutter/material.dart';

CircleAvatar customCircleAvatar(
    BuildContext context, String avatar, bool isMe) {
  return CircleAvatar(
      backgroundColor: isMe
          ? Theme.of(context).colorScheme.secondary
          : Theme.of(context).colorScheme.primary,
      backgroundImage: NetworkImage(avatar));
}
