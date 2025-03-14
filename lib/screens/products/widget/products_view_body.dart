part of '../products_screen.dart';

class ProductsScreenBodyView extends StatefulWidget {
  const ProductsScreenBodyView({super.key});

  @override
  State<ProductsScreenBodyView> createState() => _ProductsScreenBodyView();
}

class _ProductsScreenBodyView extends State<ProductsScreenBodyView> {
  List<dynamic> productCategories = [
    {'name': 'Sırala', 'icon': Icon(Icons.compare_arrows_outlined)},
    {'name': 'Filtrele', 'icon': Icon(Icons.filter_alt_outlined)},
    {'name': 'Satıcı', 'icon': Icon(Icons.home_filled)},
    {'name': 'Fiyat', 'icon': Icon(Icons.price_change_outlined)}
  ];

  List<dynamic> products = [
    {
      'imagePath': [
        'assets/image/aliciOl.png',
        'assets/image/aliciOl.png',
        'assets/image/aliciOl.png'
      ],
      'productName': 'Ürün Adı',
      'rating': 5,
      'description': 'Ürün açıklaması',
      'price': 20,
    },
    {
      'imagePath': ['assets/image/aliciOl.png', 'assets/image/aliciOl.png'],
      'productName': 'Ürün Adı 2',
      'rating': 4,
      'description': 'Ürün açıklaması 2',
      'price': 25,
    },
    {
      'imagePath': ['assets/image/aliciOl.png'],
      'productName': 'Ürün Adı 3',
      'rating': 3,
      'description': 'Ürün açıklaması 3',
      'price': 30,
    }
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Color filterButtonOnColor =
        HomeStyle(context: context).secondary.withOpacity(0.15);
    return SafeArea(
      left: false,
      right: false,
      top: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _categoryButtons(context, height),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _productCards(height, width),
                  SizedBox(
                    height: height * 0.12,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  GridView _productCards(double height, double width) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: height * 0.4,
          crossAxisCount: 2, // İki sütun
          crossAxisSpacing: 10, // Sütunlar arası yatay boşluk
          mainAxisSpacing: 10, // Satırlar arası dikey boşluk
        ),
        itemCount: products.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final product = products[index];
          return productsCard(
              product: product, width: width, context: context, height: height);
        });
  }

  Container _categoryButtons(BuildContext context, double height) {
    return Container(
      alignment: Alignment.topCenter,
      transformAlignment: Alignment.topCenter,
      decoration: BoxDecoration(
        color: HomeStyle(context: context).surface,
        boxShadow: [
          boxShadow(context),
        ],
      ),
      height: height * 0.07,
      padding: EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
        itemCount: productCategories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final items = productCategories[index];
          return Padding(
            padding: const EdgeInsets.only(
                left: 16), // Butonlar arasında yatay boşluk
            child: ProductsCategoryButtons(
              index: index,
              items: items,
            ),
          );
        },
      ),
    );
  }
}
