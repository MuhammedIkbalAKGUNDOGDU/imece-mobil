import 'package:flutter/material.dart';
import 'package:imecehub/screens/messaging/messaging_view.dart';
import 'package:imecehub/screens/messaging/private/messaging_private_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/messaging': (context) => MessageBox(),
  '/messaging/private': (context) => MessagingPrivateScreen(
      item: ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>),
};
