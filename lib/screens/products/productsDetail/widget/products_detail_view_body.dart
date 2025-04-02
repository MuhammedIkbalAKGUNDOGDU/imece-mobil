part of '../products_detail_screen.dart';

class ProductsDetailViewBody extends StatefulWidget {
  final Product product;

  const ProductsDetailViewBody({super.key, required this.product});

  @override
  State<ProductsDetailViewBody> createState() => _ProductsDetailViewBodyState();
}

class _ProductsDetailViewBodyState extends State<ProductsDetailViewBody> {
  bool biggerContainer = false;
  final int activeIndex = 0;
  double urunAciklamaContainerHeight = 150;
  double sizedBoxHeight = 200;
  String notFoundImageUrl = 'https://www.halifuryasi.com/Upload/null.png';
  Map<dynamic, dynamic> yorum = {
    'yorumName': 'Murat Y.',
    'rating': 5.0,
    'userImg': '',
    'yorum':
        'Burada kişilerin yorumları görünecektir.Burada kişilerin yorumları görünecektir.Burada kişilerin yorumları görünecektir.Burada kişilerin yorumları görünecektir.Burada kişilerin yorumları görünecektir'
  };
  Map<dynamic, dynamic> soruCevap = {
    'soruProfilAdi': 'Murat Y.',
    'soru': 'Ürünün içinde çürük var mı?',
    'soruProfilImg': '',
    'cevapVeren': 'Yusuf Akar',
    'cevap':
        'Kesinlikle öyle bir durum yaşamazsınız hasadımız yeni gerçekleşti bütün çürükler ayrıştırıldı ve temizlendi',
  };
  late Future<User> _futureUser;

  @override
  void initState() {
    super.initState();
    _futureUser = ApiService.fetchUserId(widget.product.satici) as Future<User>;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final themeData = HomeStyle(context: context);
    print(yorum['yorum'].length);

    return SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          spacing: 15,
          children: [
            _urunFoto(width, themeData),
            _urunBilgi(themeData),
            _urunStokBilgi(width, themeData),
            _urunSoruVeCevaplar(context, themeData),
            Divider(),
            _urunSaticiBilgli(themeData, width),
            _urunAciklama(context, themeData, width),
            _urunYorumlari(context, width, themeData),
            _urunSoruCevap(context, themeData, width),
            customText('Benzer Ürünler', context, weight: FontWeight.bold),
          ],
        ));
  }

  Container _urunSoruCevap(
      BuildContext context, HomeStyle themeData, double width) {
    return container(context,
        padding: EdgeInsets.only(left: 20, top: 10),
        color: themeData.surfaceContainer,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            customText(
              'Ürün Soru & Cevap',
              padding: EdgeInsets.symmetric(vertical: 10),
              context,
              size: themeData.bodyLarge.fontSize,
              weight: FontWeight.w800,
            ),
            Divider(),
            SizedBox(
              height: soruCevap['cevap'].length < 100
                  ? 225
                  : soruCevap['cevap'].length < 200
                      ? 275
                      : soruCevap['cevap'].length < 300
                          ? 325
                          : 375, // Yorum kutularının yüksekliği
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  print(soruCevap['cevap'].length);
                  return soruCevapContainer(
                    context,
                    themeData,
                    width,
                    soruCevap,
                  );
                },
              ),
            ),
          ],
        ));
  }

  Container _urunYorumlari(
      BuildContext context, double width, HomeStyle themeData) {
    return container(context,
        width: width,
        color: themeData.surfaceContainer,
        padding: EdgeInsets.only(left: 20, top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          //spacing: 10,
          children: [
            customText(
              'Ürün Yorumları',
              context,
              padding: EdgeInsets.symmetric(vertical: 10),
              size: themeData.bodyLarge.fontSize,
              weight: FontWeight.w800,
            ),
            Divider(),
            SizedBox(
              height: yorum['yorum'].length < 100
                  ? 175
                  : yorum['yorum'].length < 200
                      ? 225
                      : yorum['yorum'].length < 300
                          ? 275
                          : 325, // Yorum kutularının yüksekliği
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return yorumContainer(context, themeData, width, yorum);
                },
              ),
            ),
          ],
        ));
  }

  AnimatedContainer _urunAciklama(
      BuildContext context, HomeStyle themeData, double width) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        color: themeData.surfaceContainer,
        //height: biggerContainer == false ? urunAciklamaContainerHeight : null,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            richText(
                fontWeight: FontWeight.w300,
                fontSize: themeData.bodyMedium.fontSize,
                textAlign: TextAlign.left,
                context,
                maxLines: biggerContainer == false ? 4 : 999,
                overflow: TextOverflow.ellipsis,
                color: themeData.primary,
                children: [
                  TextSpan(
                      text: 'Açıklama\n\n',
                      style: TextStyle(fontWeight: FontWeight.w800)),
                  TextSpan(
                      text:
                          'Ürün Hakkında açıkalama burada görünecek.Ürün Hakkında açıkalama burada görünecek.Ürün Hakkında açıkalama burada görünecek.Ürün Hakkında açıkalama burada görünecek.')
                ]),
            Divider(),
            SizedBox(
              width: width,
              height: 35,
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      biggerContainer = !biggerContainer;
                    });

                    //showTemporarySnackBar(context, 'Tüm Açıklamayı oku');
                  },
                  child: customText(
                    biggerContainer == false ? 'Tüm Açıklamayı oku' : 'Kısalt',
                    context,
                    color: themeData.secondary,
                    weight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ));
  }

  FutureBuilder<User> _urunSaticiBilgli(HomeStyle themeData, double width) {
    return FutureBuilder<User>(
      future: _futureUser,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Veri bekleniyor, yükleniyor göstergesi göster
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          // Hata durumu
          return Center(child: Text('Bir hata oluştu: ${snapshot.error}'));
        } else {
          final user = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              spacing: 15,
              children: [
                Row(
                  spacing: 3,
                  children: [
                    customText(
                      'Ürünün Satıcısı:',
                      context,
                      color: themeData.primary.withOpacity(0.3),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          Navigator.pushNamed(context, '/profil/sellerProfile',
                              arguments: [user,false]);
                        });
                      },
                      child: customText(user.username, context,
                          color: Colors.blue, weight: FontWeight.bold),
                    ),
                    container(context,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        borderRadius: BorderRadius.circular(4),
                        color: themeData.secondary,
                        width: 35,
                        height: 20,
                        isBoxShadow: false,
                        child: customText(user.degerlendirmePuani, context,
                            color: themeData.onSecondary,
                            weight: FontWeight.bold)),
                    customText(
                      '5(beş) üzerinden',
                      context,
                      color: themeData.primary.withOpacity(0.3),
                      size: themeData.bodySmall.fontSize,
                    )
                  ],
                ),
                Row(
                  spacing: 35,
                  children: [
                    textButton(
                      context,
                      'Satıcıyı favorilere ekle   ',
                      textAlignment: Alignment.center,
                      buttonColor: themeData.onSecondary,
                      titleColor: themeData.primary,
                      minSizeWidth: width * 0.4,
                      elevation: 0,
                      border: true,
                      fontSize: themeData.bodyLarge.fontSize,
                      icon: Image.network(
                          //color: Color.fromRGBO(255, 229, 0, 1),
                          //colorBlendMode: BlendMode.s,
                          fit: BoxFit.cover,
                          width: 15,
                          height: 20,
                          'https://i.pinimg.com/736x/47/ef/b4/47efb45d1159f37da35e5031d7906cd9.jpg'),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    Builder(
                      builder: (context) {
                        if (user.imeceOnay) {
                          return richText(context, children: [
                            TextSpan(text: 'İmece onaylı'),
                            WidgetSpan(
                                child: SizedBox(
                              width: 20,
                              height: 20,
                              child: Image.network(
                                  color: Color.fromRGBO(255, 229, 0, 1),
                                  fit: BoxFit.cover,
                                  'https://icons.veryicon.com/png/o/miscellaneous/linear/certificate-11.png'),
                            ))
                          ]);
                        } else {
                          return ShaderMask(
                            shaderCallback: (bounds) => LinearGradient(
                              colors: [
                                Color.fromRGBO(255, 229, 0, 1),
                                Color.fromRGBO(153, 138, 0, 1),
                              ],
                            ).createShader(Rect.fromLTWH(
                                0, 0, bounds.width, bounds.height)),
                            child: richText(context, children: [
                              TextSpan(
                                  text: 'İmece onaylı',
                                  style: TextStyle(
                                      color: Colors.white,
                                      decoration: TextDecoration.underline,
                                      fontSize: themeData.bodyLarge.fontSize)),
                              WidgetSpan(
                                  child: SizedBox(
                                width: 20,
                                height: 20,
                                child: Image.network(
                                    'https://icons.veryicon.com/png/o/miscellaneous/linear/certificate-11.png'),
                              ))
                            ]),
                          );
                        }
                      },
                    )
                  ],
                ),
              ],
            ),
          );
        }
      },
    );
  }

  GestureDetector _urunSoruVeCevaplar(
      BuildContext context, HomeStyle themeData) {
    return GestureDetector(
      onTap: () {
        showTemporarySnackBar(context, 'Soru ve Cevaplar');
      },
      child: Container(
        margin: EdgeInsets.only(left: 15),
        child: Row(
          children: [
            Icon(
              Icons.message,
              color: themeData.secondary,
            ),
            customText('  Ürün Soru & Cevapları (2)', context),
            Icon(
              Icons.navigate_next,
              size: 16,
            )
          ],
        ),
      ),
    );
  }

  Container _urunStokBilgi(double width, HomeStyle themeData) {
    return Container(
      alignment: Alignment.center,
      height: 30,
      width: width * 0.3,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Color.fromRGBO(255, 34, 34, 0.1)),
      child: RichText(
          text: TextSpan(
              style: TextStyle(
                color: themeData.primary,
                fontSize: themeData.bodyMedium.fontSize,
              ),
              children: [
            TextSpan(
                text: 'Kalan KG:',
                style: TextStyle(decoration: TextDecoration.underline)),
            TextSpan(
                text: ' ${widget.product.stokDurumu.toString()}',
                style: TextStyle(
                    color: getStokRengi(widget.product.stokDurumu ?? 0),
                    fontWeight: FontWeight.bold))
          ])),
    );
  }

  Padding _urunBilgi(HomeStyle themeData) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: RichText(
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          text: TextSpan(
              style: TextStyle(
                  color: themeData.primary,
                  fontSize: themeData.bodyLarge.fontSize,
                  fontWeight: FontWeight.bold),
              children: [
                TextSpan(text: '${widget.product.urunAdi}  '),
                TextSpan(text: 'sebze, biber, tatlı ')
              ])),
    );
  }

  Stack _urunFoto(double width, HomeStyle themeData) {
    return Stack(
      children: [
        Container(
          height: 300,
          width: width,
          decoration: BoxDecoration(
              border: Border.all(
                color: themeData.outline.withOpacity(0.5), // Çizgi rengi
              ),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(widget.product.kapakGorseli == ''
                      ? notFoundImageUrl
                      : widget.product.kapakGorseli ?? notFoundImageUrl))),
        ),
        Positioned(
            height: 13,
            bottom: 5,
            left: width / 2 - 15,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(4)),
              child: Row(
                  children: List.generate(4, (index) {
                final bool isActive = (index + 1) == activeIndex;
                return Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 2), // yan yana arada boşluk
                  width: 5,
                  height: 5,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        isActive ? Colors.grey.shade200 : Colors.grey.shade500,
                  ),
                );
              })),
            )),
        Positioned(
            width: 40,
            height: 40,
            right: 10,
            top: 10,
            child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: themeData.surfaceContainer,
                    borderRadius: BorderRadius.circular(6)),
                child: favoriIconButton(context, selected: false)))
      ],
    );
  }
}
