import 'dart:ffi' as ffi;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imecehub/core/widgets/shadow.dart';
import 'package:imecehub/core/widgets/text.dart';
import 'package:imecehub/core/widgets/textButton.dart';
import 'package:imecehub/core/widgets/textField.dart';
import 'package:imecehub/screens/home/style/home_screen_style.dart';
part 'profileNotLogin.dart';

part 'SignUp/widget/sign_up_view_header.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool loginUser = false;
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return loginUser ? Scaffold() : ProfileNotLogin();
      },
    );
  }
}
