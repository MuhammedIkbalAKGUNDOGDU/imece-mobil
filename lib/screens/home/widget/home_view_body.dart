part of '../home_screen.dart';

class _HomeViewBody extends StatefulWidget {
  const _HomeViewBody({super.key});

  @override
  State<_HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<_HomeViewBody> {
  bool favoriteProduct = false;
  List categories = [
    'Meyveler',
    'Sebzeler',
    'Yeşillikler ve otlar',
    'Mantarlar',
    'Kategori 5',
    'Kategori 6',
  ];
  List saticilar = [
    'Satıcı 1',
    'Satıcı 2',
    'Satıcı 3',
    'Satıcı 4',
    'Satıcı 5',
    'Satıcı 6',
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

  // Puanlamaya göre yıldızları oluşturan fonksiyon
  Widget buildRatingStars(int rating) {
    List<Widget> stars = [];
    for (int i = 0; i < 5; i++) {
      if (i < rating) {
        stars.add(const Icon(Icons.star, color: Colors.orange, size: 16));
      } else {
        stars
            .add(const Icon(Icons.star_border, color: Colors.orange, size: 16));
      }
    }
    return Row(children: stars);
  }

  List kampanyalar = ['Kampanya 1', 'Kampanya 2', 'Kampanya 3'];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Padding(
            padding: HomeStyle(context: context).bodyPadding,
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                  _categoriesText(context),
                  _categoriesItems(width, height),
                  _kampanyalarText(context),
                  _kampanyalarItems(width, height),
                  _kayitContainer(context, height),
                  _saticilarList(height, context, width),
                  _alimTipiContainer(height, context),
                  _populerUrunlerText(context),
                  _populerUrunCards(width, height),
                  _onerilerContainer(height, context, width)
                ]))));
  }

  Row _onerilerContainer(double height, BuildContext context, double width) {
    return Row(
      spacing: 15,
      children: [
        Expanded(
            flex: 1,
            child: _imageContainer(
                height, context, width, 'İndirimli', ' Ürünleri İncele')),
        Expanded(
            flex: 1,
            child: _imageContainer(
                height, context, width, 'Bizim', 'seçtiklerimiz'))
      ],
    );
  }

  Container _imageContainer(double height, BuildContext context, double width,
      String title, String title2) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      height: height * 0.15,
      decoration: BoxDecoration(
        borderRadius:
            HomeStyle(context: context).bodyCategoryContainerBorderRadius,
        image: const DecorationImage(
          image: AssetImage('assets/image/grupalim.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        spacing: height * 0.15 * 0.1,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          RichText(
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                  style: TextStyle(
                    fontSize: HomeStyle(context: context).bodyLarge.fontSize,
                    fontWeight: FontWeight.bold,
                    color: HomeStyle(context: context).secondary,
                  ),
                  children: [
                    TextSpan(
                      text: title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize:
                            HomeStyle(context: context).headlineSmall.fontSize,
                        color: HomeStyle(context: context)
                            .secondary, // "Alıcı" kelimesinin istediğiniz rengi
                      ),
                    ),
                    TextSpan(
                      text: title2,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize:
                            HomeStyle(context: context).headlineSmall.fontSize,
                        color: HomeStyle(context: context)
                            .surface, // "Alıcı" kelimesinin istediğiniz rengi
                      ),
                    ),
                  ])),
          Align(
              alignment: Alignment.bottomCenter,
              child: customText('Tıkla...', context,
                  size: HomeStyle(context: context).bodyLarge.fontSize,
                  weight: FontWeight.bold,
                  color: HomeStyle(context: context).secondary)),
        ],
      ),
    );
  }

  Widget _populerUrunCards(double width, double height) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // İki sütun
          crossAxisSpacing: 10, // Sütunlar arası yatay boşluk
          mainAxisSpacing: 10, // Satırlar arası dikey boşluk
          childAspectRatio:
              0.5, // Kartların genişlik/yükseklik oranı; ihtiyaca göre ayarlanabilir
        ),
        itemCount: products.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                spacing: 5,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 150,
                    child: PageView.builder(
                      itemCount: product['imagePath'].length,
                      itemBuilder: (context, imgIndex) {
                        return Stack(
                          children: [
                            Container(
                              width: width * 0.37,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                  image: AssetImage(
                                      product['imagePath'][imgIndex]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            // Görselin alt sağ köşesinde kaçıncı görsel olduğunu gösteren etiket
                            Positioned(
                              bottom: 4,
                              right: 4,
                              child: Container(
                                alignment: Alignment.bottomRight,
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                  color: HomeStyle(context: context).outline,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Text(
                                    "${imgIndex + 1}/${product['imagePath'].length}",
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  customText(product['productName'], context,
                      weight: FontWeight.bold,
                      size: HomeStyle(context: context).bodyLarge.fontSize),
                  buildRatingStars(product['rating']),
                  Text(
                    product['description'],
                    style: const TextStyle(fontSize: 14),
                  ),
                  Text(
                    "KG: ${product['price']} TL",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: HomeStyle(context: context).secondary),
                  ),
                  Row(
                    spacing: 5,
                    children: [
                      Expanded(
                        flex: 4,
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: height * 0.04,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: HomeStyle(context: context).secondary),
                            child: customText('Sepete Ekle', context,
                                color: Colors.white,
                                weight: FontWeight.bold,
                                size: HomeStyle(context: context)
                                    .bodySmall
                                    .fontSize),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              favoriteProduct = !favoriteProduct;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.grey[300],
                            ),
                            height: height * 0.04,
                            child: Icon(
                              favoriteProduct
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: favoriteProduct ? Colors.red : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  Padding _populerUrunlerText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: customText('Popüler ürünler', context,
          size: HomeStyle(context: context).bodyLarge.fontSize,
          weight: FontWeight.bold,
          color: HomeStyle(context: context).primary),
    );
  }

  Row _alimTipiContainer(double height, BuildContext context) {
    return Row(
      spacing: 25,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            height: height * 0.15,
            decoration: BoxDecoration(
              borderRadius:
                  HomeStyle(context: context).bodyCategoryContainerBorderRadius,
              image: const DecorationImage(
                image: AssetImage('assets/image/saticiOl.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RichText(
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                        style: TextStyle(
                          fontSize:
                              HomeStyle(context: context).bodyLarge.fontSize,
                          fontWeight: FontWeight.bold,
                          color: HomeStyle(context: context).secondary,
                        ),
                        children: [
                          TextSpan(
                            text: 'Grup alım için',
                            style: TextStyle(
                              color: HomeStyle(context: context)
                                  .surface, // "Alıcı" kelimesinin istediğiniz rengi
                            ),
                          ),
                          TextSpan(
                              text: ' tıkla',
                              style: TextStyle(
                                color: HomeStyle(context: context).secondary,
                              )),
                        ]))
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            height: height * 0.15,
            decoration: BoxDecoration(
              borderRadius:
                  HomeStyle(context: context).bodyCategoryContainerBorderRadius,
              image: const DecorationImage(
                image: AssetImage('assets/image/saticiOl.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RichText(
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                        style: TextStyle(
                          fontSize:
                              HomeStyle(context: context).bodyLarge.fontSize,
                          fontWeight: FontWeight.bold,
                          color: HomeStyle(context: context).secondary,
                        ),
                        children: [
                          TextSpan(
                            text: 'Tekil alım için',
                            style: TextStyle(
                              color: HomeStyle(context: context)
                                  .surface, // "Alıcı" kelimesinin istediğiniz rengi
                            ),
                          ),
                          TextSpan(
                              text: ' tıkla',
                              style: TextStyle(
                                color: HomeStyle(context: context).secondary,
                              )),
                        ]))
              ],
            ),
          ),
        ),
      ],
    );
  }

  SizedBox _kampanyalarItems(double width, double height) {
    return SizedBox(
      height:
          height * 0.17, // Kategori widget'larının yüksekliğine göre ayarlayın
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: kampanyalar.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              right: index == kampanyalar.length - 1 ? 0 : 8,
            ),
            child: _kampanyalar(kampanyalar[index], width, height),
          );
        },
      ),
    );
  }

  Padding _kampanyalarText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: customText('Kampanyalar', context,
          size: HomeStyle(context: context).bodyLarge.fontSize,
          weight: FontWeight.bold,
          color: HomeStyle(context: context).primary),
    );
  }

  SizedBox _categoriesItems(double width, double height) {
    return SizedBox(
      height: height * 0.135,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              right: index == categories.length - 1 ? 0 : 8,
            ),
            child: _categories(categories[index], width, height),
          );
        },
      ),
    );
  }

  Padding _categoriesText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: customText('Kategoriler', context,
          size: HomeStyle(context: context).bodyLarge.fontSize,
          weight: FontWeight.bold,
          color: HomeStyle(context: context).primary),
    );
  }

  Container _saticilarList(double height, BuildContext context, double width) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      height: height * 0.1,
      width: double.infinity, // Ekran genişliğini kaplar
      decoration: BoxDecoration(
        border: Border.all(color: HomeStyle(context: context).secondary),
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: customText('Satıcılar', context,
                weight: FontWeight.bold,
                color: HomeStyle(context: context).primary,
                size: HomeStyle(context: context).bodyLarge.fontSize),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: saticilar.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  color: HomeStyle(context: context).secondaryFixedDim,
                  width: width * 0.2,
                  child: Center(child: customText(saticilar[index], context)),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Container _kayitContainer(BuildContext context, double height) {
    return Container(
      height: height * 0.2,
      margin: EdgeInsets.only(top: 25, bottom: 25),
      child: Row(
        spacing: 25,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: HomeStyle(context: context)
                    .bodyCategoryContainerBorderRadius,
                image: const DecorationImage(
                  image: AssetImage('assets/image/saticiOl.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    RichText(
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                            style: TextStyle(
                              fontSize: HomeStyle(context: context)
                                  .headlineSmall
                                  .fontSize,
                              fontWeight: FontWeight.bold,
                              color: HomeStyle(context: context).secondary,
                            ),
                            children: [
                              TextSpan(
                                text: 'Satıcı',
                                style: TextStyle(
                                  color: HomeStyle(context: context)
                                      .secondary, // "Alıcı" kelimesinin istediğiniz rengi
                                ),
                              ),
                              TextSpan(
                                  text: ' olarak kayıt ol',
                                  style: TextStyle(
                                    color: HomeStyle(context: context).surface,
                                  )),
                            ]))
                  ]),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: HomeStyle(context: context)
                    .bodyCategoryContainerBorderRadius,
                image: const DecorationImage(
                  image: AssetImage('assets/image/aliciOl.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    RichText(
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            style: TextStyle(
                              fontSize: HomeStyle(context: context)
                                  .headlineSmall
                                  .fontSize,
                              fontWeight: FontWeight.bold,
                              color: HomeStyle(context: context).secondary,
                            ),
                            children: [
                              TextSpan(
                                text: 'Alıcı',
                                style: TextStyle(
                                  color: HomeStyle(context: context)
                                      .secondary, // "Alıcı" kelimesinin istediğiniz rengi
                                ),
                              ),
                              TextSpan(
                                  text: ' olarak kayıt ol',
                                  style: TextStyle(
                                    color: HomeStyle(context: context).surface,
                                  )),
                            ]))
                  ]),
            ),
          ),
        ],
      ),
    );
  }

  Column _categories(dynamic category, double width, double height) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: width * 0.25,
          height: height * 0.1,
          decoration: BoxDecoration(
            borderRadius:
                HomeStyle(context: context).bodyCategoryContainerBorderRadius,
            image: const DecorationImage(
              image: AssetImage('assets/image/grupalim.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        customText(category, context,
            size: HomeStyle(context: context).bodyLarge.fontSize)
      ],
    );
  }

  Widget _kampanyalar(dynamic kampanyalar, double width, double height) {
    return Container(
      width: width * 0.9,
      height: height * 0.2,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/image/grupalim.jpg'),
          fit: BoxFit.cover,
        ),
        borderRadius:
            HomeStyle(context: context).bodyCategoryContainerBorderRadius,
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            customText(kampanyalar.toString(), context,
                color: HomeStyle(context: context).secondary,
                weight: FontWeight.bold,
                size: HomeStyle(context: context).headlineSmall.fontSize),
          ]),
    );
  }
}
