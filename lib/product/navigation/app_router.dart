import 'package:flutter/material.dart';
import 'package:imecehub/screens/home/home_screen.dart';
import 'package:imecehub/screens/messaging/messaging_view.dart';
import 'package:imecehub/screens/messaging/private/messaging_private_screen.dart';
import 'package:imecehub/screens/order/order_screen.dart';
import 'package:imecehub/screens/profil/addPost/addPost_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/home': (context) => HomeScreen(),
  '/order': (context) => OrderScreen(),
  '/test': (context) => AddPost(),
  '/messaging': (context) => MessageBox(),
  '/messaging/private': (context) => MessagingPrivateScreen(
      item: ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>),
};
