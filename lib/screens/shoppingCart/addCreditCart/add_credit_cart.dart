import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:imecehub/core/widgets/showTemporarySnackBar.dart';
import 'package:imecehub/core/widgets/text.dart';
import 'package:imecehub/core/widgets/textButton.dart';
import 'package:imecehub/core/widgets/textField.dart';
import 'package:imecehub/screens/home/style/home_screen_style.dart';
import 'package:u_credit_card/u_credit_card.dart';

part 'widget/add_credit_cart_view_body.dart';
part 'widget/add_credit_cart_view_header.dart';

class AddCreditCartScreen extends StatelessWidget {
  final TextEditingController cartNumberController;
  final TextEditingController lateUseDateController;
  final TextEditingController cvvController;
  final TextEditingController cartUserNameController;
  final TextEditingController cartNameController;

  const AddCreditCartScreen(
      {super.key,
      required this.cartNumberController,
      required this.lateUseDateController,
      required this.cvvController,
      required this.cartUserNameController,
      required this.cartNameController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          true,
      appBar: _AddCreditCartAppBar(context),
      body: AddCreditCartViewBody(
        cartNumberController: cartNumberController,
        lateUseDateController: lateUseDateController,
        cartNameController: cartNameController,
        cvvController: cvvController,
        cartUserNameController: cartUserNameController,
      ),
    );
  }
}
