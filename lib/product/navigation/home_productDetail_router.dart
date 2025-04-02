import 'package:flutter/material.dart';
import 'package:imecehub/core/widgets/textButton.dart';
import 'package:imecehub/models/products.dart';
import 'package:imecehub/screens/products/productsDetail/products_detail_screen.dart';

class HomeProductDetailRouter extends StatefulWidget {
  const HomeProductDetailRouter({super.key});

  @override
  State<HomeProductDetailRouter> createState() => _HomeProductDetailRouter();
}

class _HomeProductDetailRouter extends State<HomeProductDetailRouter> {
  @override
  Widget build(BuildContext context) {
    late Future<Product> futureProduct =
        ModalRoute.of(context)!.settings.arguments as Future<Product>;
    Future<void> _futureProduct() async {
      final futureProduct =
          await ModalRoute.of(context)!.settings.arguments as Future<Product>;
    }

    @override
    void initState() async {
      // TODO: implement initState
      super.initState();
      await _futureProduct();
    }

    return FutureBuilder<Product>(
      future: futureProduct,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Scaffold(
                backgroundColor: Colors.white,
                body: Center(
                    child: Column(
                  children: [
                    Text('Error: ${snapshot.error}'),
                    textButton(
                      context,
                      'Tekrar Dene',
                      onPressed: () {
                        setState(() {
                          _futureProduct();
                        });
                      },
                    )
                  ],
                )));
          }
          return ProductsDetailScreen(product: snapshot.data!);
        } else {
          return Scaffold(
              backgroundColor: Colors.white,
              body: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
