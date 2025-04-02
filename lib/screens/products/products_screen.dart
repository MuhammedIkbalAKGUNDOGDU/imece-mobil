import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:imecehub/core/widgets/productsCard.dart';
import 'package:imecehub/core/widgets/shadow.dart';
import 'package:imecehub/models/products.dart';
import 'package:imecehub/screens/home/home_screen.dart';
import 'package:imecehub/screens/home/style/home_screen_style.dart';
import 'package:imecehub/services/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'widget/products_view_body.dart';
part 'widget/products_category_buttons.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeHeaderAppBar(),
      body: ProductsScreenBodyView(),
    );
  }
}
