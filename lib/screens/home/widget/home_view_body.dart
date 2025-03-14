part of '../home_screen.dart';

class _HomeViewBody extends StatefulWidget {
  const _HomeViewBody({super.key});

  @override
  State<_HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<_HomeViewBody> {
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

  List kampanyalar = ['Kampanya 1', 'Kampanya 2', 'Kampanya 3'];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: HomeHeaderAppBar(),
      body: SafeArea(
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
                    _onerilerContainer(height, context, width),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.12,
                    ),
                  ])))),
    );
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
        boxShadow: [
          boxShadow(context),
        ],
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
              boxShadow: [
                boxShadow(context),
              ],
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
              boxShadow: [
                boxShadow(context),
              ],
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

  Container _kampanyalarItems(double width, double height) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        boxShadow(context),
      ]),
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
    double saticiContainerWidth = width * 0.2;
    double avatarContainerHeight = height * 0.13;
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
      ),
      width: double.infinity, // Ekran genişliğini kaplar
      height: avatarContainerHeight,
      child: Expanded(
        child: ListView.builder(
          itemCount: saticilar.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              width: saticiContainerWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                      child: Image.asset(
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(Icons.person_outline_sharp);
                    },
                    'assets/icon/profil.svg',
                    fit: BoxFit.cover,
                  )),
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            onError: (exception, stackTrace) {
                              Builder(
                                builder: (context) {
                                  return Icon(Icons.person_outline_sharp);
                                },
                              );
                            },
                            image: AssetImage('assets/icon/profil.svg'),
                            fit: BoxFit.cover)),
                  ),
                  Expanded(
                    child: Text(
                      '${saticilar[index]}',
                      maxLines: 2,
                      softWrap: true,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow
                          .ellipsis, // Metin taşarsa sonuna "..." ekler
                    ),
                  )
                ],
              ),
            );
          },
        ),
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
                boxShadow: [
                  boxShadow(context),
                ],
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
                boxShadow: [
                  boxShadow(context),
                ],
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
            boxShadow: [
              boxShadow(context),
            ],
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
    double containerWidth = width * 0.89;
    double containerHeight = height * 0.2;
    return Container(
      width: containerWidth,
      height: containerHeight,
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
