import 'package:flutter/material.dart';
import 'package:imecehub/core/widgets/container.dart';
import 'package:imecehub/core/widgets/richText.dart';
import 'package:imecehub/core/widgets/text.dart';
import 'package:imecehub/core/widgets/textButton.dart';
import 'package:imecehub/screens/home/home_screen.dart';
import 'package:imecehub/screens/home/style/home_screen_style.dart';
import 'package:imecehub/screens/profil/messaging/private/widget/private_view_body_circleAvatar.dart';
part 'widget/wallet_view_body.dart';
part 'widget/wallet_view_header.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _WalletViewHeader(context),
      body: _walletViewBody(context),
    );
  }
}
