import 'package:flutter/material.dart';
import 'package:imecehub/screens/home/home_screen.dart';
import 'package:imecehub/screens/profil/SignIn/sign_in_screen.dart';
import 'package:imecehub/screens/profil/messaging/messaging_view.dart';
import 'package:imecehub/screens/profil/messaging/private/messaging_private_screen.dart';

import 'package:imecehub/screens/shoppingCart/order_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/home': (context) => HomeScreen(),
  '/order': (context) => OrderScreen(),
  '/profil/signIn': (context) => SignInScreen(),
  '/profil/signUp': (context) => SignUpScreen(),
  '/profil/changePassword': (context) => ChangePasswordScreen(),
  '/messaging': (context) => MessageBox(),
  '/messaging/private': (context) => MessagingPrivateScreen(
      item: ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>),
};
