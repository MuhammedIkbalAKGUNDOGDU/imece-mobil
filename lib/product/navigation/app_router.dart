import 'package:flutter/material.dart';
import 'package:imecehub/models/products.dart';
import 'package:imecehub/models/users.dart';
import 'package:imecehub/product/navigation/home_productDetail_router.dart';
import 'package:imecehub/screens/home/categories/categories_screen.dart';
import 'package:imecehub/screens/home/home_screen.dart';
import 'package:imecehub/screens/products/productsDetail/products_detail_screen.dart';
import 'package:imecehub/screens/profil/SignIn/sign_in_screen.dart';
import 'package:imecehub/screens/profil/addPost/add_post_screen.dart';
import 'package:imecehub/screens/profil/messaging/messaging_view.dart';
import 'package:imecehub/screens/profil/messaging/private/messaging_private_screen.dart';
import 'package:imecehub/screens/profil/sellerProfil/seller_profil_screen.dart';
import 'package:imecehub/screens/profil/wallet/wallet_screen.dart';
import 'package:imecehub/screens/profil/wallet/widget/past_payments_more_view.dart';
import 'package:imecehub/screens/shoppingCart/addCreditCart/add_credit_cart.dart';

import 'package:imecehub/screens/shoppingCart/cart_screen.dart';

import '../../screens/profil/addProduct/add_product_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/home': (context) => HomeScreen(),
  '/cart': (context) => OrderScreen(),
  '/cart/addCreditCart': (context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String?>;

    return AddCreditCartScreen(
      cartNameController: TextEditingController(text: args['cartName']),
      cartNumberController: TextEditingController(text: args['cardNumber']),
      cartUserNameController: TextEditingController(text: args['cartUserName']),
      cvvController: TextEditingController(text: args['cvv']),
      lateUseDateController: TextEditingController(text: args['lateUseDate']),
    );
  },
  '/profil/signIn': (context) => SignInScreen(),
  '/profil/signUp': (context) => SignUpScreen(),
  '/profil/changePassword': (context) => ChangePasswordScreen(),
  '/profil/sellerProfile': (context) {
    final args = ModalRoute.of(context)!.settings.arguments as List;
    return SellerProfilScreen(
      sellerProfil: args[0],
      myProfile: args[1],
    );
  },
  '/profil/messaging': (context) => MessageBox(),
  '/profil/addProduct': (context) {
    final user = ModalRoute.of(context)!.settings.arguments as User;
    if (user is User) {
      return AddProductScreen(user: user);
    } else {
      return Text('user verisi boş');
    }
  },
  '/profil/addPost': (context) => const AddPost(),
  '/profil/wallet': (context) => WalletScreen(),
  '/profil/wallet/pastPayments': (context) {
    return PastPaymentsMoreView(
        pastPayments: ModalRoute.of(context)!.settings.arguments
            as List<Map<String, dynamic>>);
  },
  '/products/productsDetail': (context) {
    return ProductsDetailScreen(
      product: ModalRoute.of(context)!.settings.arguments as Product,
    );
  },
  '/home/productsDetail': (context) {
    final futureProduct =
        ModalRoute.of(context)!.settings.arguments as Future<Product>;
    return HomeProductDetailRouter();
  },
  '/home/category': (context) {
    return CategoriesScreen(
        categoryId: ModalRoute.of(context)!.settings.arguments as int);
  },
  '/messaging/private': (context) => MessagingPrivateScreen(
      item: ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>),
};
