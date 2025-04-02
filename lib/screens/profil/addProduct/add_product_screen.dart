import 'package:flutter/material.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:imecehub/core/widgets/container.dart';
import 'package:imecehub/core/widgets/richText.dart';
import 'package:imecehub/core/widgets/showTemporarySnackBar.dart';
import 'package:imecehub/core/widgets/text.dart';
import 'package:imecehub/core/widgets/textButton.dart';
import 'package:imecehub/core/widgets/textField.dart';
import 'package:imecehub/models/users.dart';
import 'package:imecehub/screens/home/style/home_screen_style.dart';
import 'package:imecehub/screens/profil/SignIn/sign_in_screen.dart';

part 'widget/add_product_view_body.dart';
part 'widget/add_product_view_header.dart';

class AddProductScreen extends StatelessWidget {
  final User user;

  const AddProductScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AddProductViewHeader(profileName: user),
      body: AddProductViewBody(profileName: user),
    );
  }
}
