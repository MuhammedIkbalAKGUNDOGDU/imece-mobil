part of '../products_screen.dart';

class ProductsScreenBodyView extends StatefulWidget {
  final String? categoryId;

  const ProductsScreenBodyView({super.key, this.categoryId});

  @override
  State<ProductsScreenBodyView> createState() => _ProductsScreenBodyView();
}

class _ProductsScreenBodyView extends State<ProductsScreenBodyView>
    with AutomaticKeepAliveClientMixin {
  List<dynamic> productCategories = [
    {'name': 'Sırala', 'icon': Icon(Icons.compare_arrows_outlined)},
    {'name': 'Filtrele', 'icon': Icon(Icons.filter_alt_outlined)},
    {'name': 'Satıcı', 'icon': Icon(Icons.home_filled)},
    {'name': 'Fiyat', 'icon': Icon(Icons.price_change_outlined)}
  ];
  String notFoundImageUrl = 'https://www.halifuryasi.com/Upload/null.png';
  // Statik cache değişkeni: Tüm örnekler arasında paylaşılır.

  static List<Product>? cachedProducts;
  late Future<List<Product>> _futureProducts;
  @override
  void initState() {
    super.initState();
    // Aşağıdaki kodu initState içine ekleyerek, eğer cachedProducts dolu ise
    // API çağrısı yapmadan cache'den verileri kullanıyoruz.
    if (cachedProducts != null && cachedProducts!.isNotEmpty) {
      // Cache dolu ise: direkt veriyi Future.value ile sarıyoruz.
      _futureProducts = Future.value(cachedProducts);
    } else {
      // İlk açılışta veya cache boşsa API’den verileri çek
      _futureProducts = ApiService.fetchProducts(id: widget.categoryId)
          as Future<List<Product>>;
      _futureProducts.then((products) {
        // Gelen veriyi cache'e atıyoruz.
        cachedProducts = products;
      });
    }
  }

  // Refresh işlemini gerçekleştiren metod:
  Future<void> _refreshProducts() async {
    // API'den verileri çek ve cache'i güncelle
    List<Product> freshProducts =
        await ApiService.fetchProducts(id: widget.categoryId) as List<Product>;
    setState(() {
      cachedProducts = freshProducts;
      _futureProducts = Future.value(freshProducts);
    });
  }

  @override
  bool get wantKeepAlive =>
      true; // Ekran arası geçişte state’in korunmasını sağlar

  @override
  Widget build(BuildContext context) {
    final themeData = HomeStyle(context: context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Color filterButtonOnColor =
        HomeStyle(context: context).secondary.withOpacity(0.15);
    return RefreshIndicator(
      color: themeData.secondary,
      backgroundColor: Colors.white,
      onRefresh: _refreshProducts,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Builder(builder: (context) {
              if (widget.categoryId == null) {
                return _categoryButtons(context, height);
              } else {
                return SizedBox();
              }
            }),
            _futureProductsItems(height, width),
          ],
        ),
      ),
    );
  }

  FutureBuilder<List<Product>> _futureProductsItems(
      double height, double width) {
    return FutureBuilder<List<Product>>(
      future: _futureProducts,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Veri bekleniyor, yükleniyor göstergesi göster
          return Container(
              margin: EdgeInsets.only(top: height * 0.5),
              color: Colors.transparent);
        } else if (snapshot.hasError) {
          // Hata durumu
          return Center(child: Text('Bir hata oluştu: ${snapshot.error}'));
        } else {
          // Veri başarıyla alındı

          final products = snapshot.data!;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _productCards(height, width, products),
              SizedBox(
                height: height * 0.12,
              )
            ],
          );
        }
      },
    );
  }

  GridView _productCards(double height, double width, products) {
    return GridView.builder(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
          return productsCard(
              product: products[index],
              width: width,
              context: context,
              height: height);
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
