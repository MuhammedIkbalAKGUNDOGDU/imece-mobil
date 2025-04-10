import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:imecehub/core/widgets/container.dart';
import 'package:imecehub/core/widgets/gonderiContainer.dart';
import 'package:imecehub/core/widgets/iconButtons.dart';
import 'package:imecehub/core/widgets/productsCard.dart';
import 'package:imecehub/core/widgets/showTemporarySnackBar.dart';
import 'package:imecehub/core/widgets/text.dart';
import 'package:imecehub/core/widgets/textButton.dart';
import 'package:imecehub/core/widgets/textField.dart';
import 'package:imecehub/core/widgets/yorumContainer.dart';
import 'package:imecehub/models/users.dart';
import 'package:imecehub/screens/home/style/home_screen_style.dart';

part 'widget/seller_profil_view_header.dart';
part 'widget/seller_profil_view_body.dart';
part 'widget/seller_profil_fastCenter.dart';

class SellerProfilScreen extends StatefulWidget {
  final User sellerProfil;
  
  final bool myProfile;

  const SellerProfilScreen({super.key, required this.sellerProfil,required this.myProfile});

  @override
  State<SellerProfilScreen> createState() => _SellerProfilScreenState();
}

class _SellerProfilScreenState extends State<SellerProfilScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _sellerProfilAppBar(context),
      body: SellerProfilBody(
        sellerProfil: widget.sellerProfil,
        myProfile: widget.myProfile,
      ),
    );
  }
}
