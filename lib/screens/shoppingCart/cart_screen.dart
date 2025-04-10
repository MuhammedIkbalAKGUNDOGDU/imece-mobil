import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:imecehub/core/widgets/container.dart';
import 'package:imecehub/core/widgets/richText.dart';
import 'package:imecehub/core/widgets/showTemporarySnackBar.dart';
import 'package:imecehub/core/widgets/text.dart';
import 'package:imecehub/core/widgets/textButton.dart';
import 'package:imecehub/screens/home/style/home_screen_style.dart';
import 'package:u_credit_card/u_credit_card.dart';

part 'widget/cart_view_header.dart';
part 'widget/test.dart';
part 'widget/cart_view_body.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _CartScreenHeader(context),
        body: _CartViewBody());
  }
}

Text _appBarHeaderText(String title) {
  return Text(
    title,
    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
  );
}

Text _appBarBodyText(String title) {
  return Text(
    title,
    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
  );
}
