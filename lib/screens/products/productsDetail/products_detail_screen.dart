import 'dart:io';

import 'package:flutter/material.dart';
import 'package:imecehub/core/widgets/container.dart';
import 'package:imecehub/core/widgets/iconButtons.dart';
import 'package:imecehub/core/widgets/richText.dart';
import 'package:imecehub/core/widgets/showTemporarySnackBar.dart';
import 'package:imecehub/core/widgets/soruCevapContainer.dart';
import 'package:imecehub/core/widgets/text.dart';
import 'package:imecehub/core/widgets/textButton.dart';
import 'package:imecehub/core/widgets/textField.dart';
import 'package:imecehub/core/widgets/yorumContainer.dart';
import 'package:imecehub/models/products.dart';
import 'package:imecehub/models/users.dart';
import 'package:imecehub/screens/home/style/home_screen_style.dart';
import 'package:imecehub/services/api_service.dart';

part 'widget/products_detail_view_header.dart';
part 'widget/products_detail_view_body.dart';
part 'widget/products_detail_view_bottom.dart';

class ProductsDetailScreen extends StatelessWidget {
  final Product product;

  const ProductsDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _productsDetailAppBar(context),
      body: ProductsDetailViewBody(product: product),
      bottomNavigationBar: ProductsDetailViewBottom(product: product),
    );
  }
}
