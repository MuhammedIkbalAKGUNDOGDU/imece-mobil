part of '../seller_profil_screen.dart';

class SellerProfilBody extends StatefulWidget {
  final User sellerProfil;

  final bool myProfile;

  const SellerProfilBody(
      {super.key, required this.sellerProfil, required this.myProfile});

  @override
  State<SellerProfilBody> createState() => _sellerProfilBodyState();
}

class _sellerProfilBodyState extends State<SellerProfilBody> {
  double coverHeight = 111; // Kapak fotoğrafının yüksekliği
  double profileSize = 81; // Profil resminin boyutları
  String sonKullanimTarihi = "2025/09/29";
  String notFoundImageUrl = 'https://www.halifuryasi.com/Upload/null.png';
  String hakkinda =
      "Ben, Anadolu'nun bereketli topraklarında doğmuş, ömrünü bu topraklara adamış bir çiftçiyim. Yıllar önce babamın nasihatleriyle başladığım bu yolda, hem tohum ektim hem de hayatın türlü zorluklarıyla mücadele ettim. Tarla sürmekten hasat toplamaya, hayvan yetiştirmekten kışa hazırlık yapmaya kadar her işte emeğimi verdim. Bu topraklar bana hem geçimimi sağladı hem de sabrın, çalışkanlığın ne demek olduğunu öğretti. Şimdi ise, yılların birikimiyle, bilgimi ve tecrübemi sizin damağınızı şenlik ettirecek meyveler için kullanacağım.";
  Map<dynamic, dynamic> profil = {
    'profilImage':
        'https://raw.githubusercontent.com/MuhammedIkbalAKGUNDOGDU/imece-test-website/refs/heads/main/imece/src/assets/images/profil_photo.png'
  };
  Map<dynamic, dynamic> gonderi = {
    'gonderiBaslik': 'Başlık',
    'gonderiAciklama': 'Gönderi Hakkındaki Bilgiler',
    'gonderiImages': [
      'https://s3-alpha-sig.figma.com/img/986c/b818/056dfacdfdf401a5c21aaab97ba5433e?Expires=1743379200&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=agP1c9UHbwkXLQgf8o8B3OURHWu~-nyK5j-Ez53Gc~UBhBRKrHSTW6mjQVO5L57APBlNZHn9IKkrtI-VFGt2OL48Qi-EftIDUCuFH00zqU6YCtIIehvURNkEWUveoZeGsPxpNDxBMY~l90yx2kURlgfg8uT4RH0buM0HD-~VIo9eBQSwHqGFNPNhEu~-ktNclfuQk90x8Iu1NGBrODiUpW3gCch9SopgNWWY3jySbJ~Fc0Xz21FhhAX5ve7wz7nIkeAY1K00H4NgH4-7MSS7jvTguOwJkLUJNQIDOf28LR-aOEyDVpHoKMAR4DpOvVzpPj5L2a1sb6tkcDWVjwDUmg__',
      'https://s3-alpha-sig.figma.com/img/986c/b818/056dfacdfdf401a5c21aaab97ba5433e?Expires=1743379200&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=agP1c9UHbwkXLQgf8o8B3OURHWu~-nyK5j-Ez53Gc~UBhBRKrHSTW6mjQVO5L57APBlNZHn9IKkrtI-VFGt2OL48Qi-EftIDUCuFH00zqU6YCtIIehvURNkEWUveoZeGsPxpNDxBMY~l90yx2kURlgfg8uT4RH0buM0HD-~VIo9eBQSwHqGFNPNhEu~-ktNclfuQk90x8Iu1NGBrODiUpW3gCch9SopgNWWY3jySbJ~Fc0Xz21FhhAX5ve7wz7nIkeAY1K00H4NgH4-7MSS7jvTguOwJkLUJNQIDOf28LR-aOEyDVpHoKMAR4DpOvVzpPj5L2a1sb6tkcDWVjwDUmg__',
      'https://s3-alpha-sig.figma.com/img/986c/b818/056dfacdfdf401a5c21aaab97ba5433e?Expires=1743379200&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=agP1c9UHbwkXLQgf8o8B3OURHWu~-nyK5j-Ez53Gc~UBhBRKrHSTW6mjQVO5L57APBlNZHn9IKkrtI-VFGt2OL48Qi-EftIDUCuFH00zqU6YCtIIehvURNkEWUveoZeGsPxpNDxBMY~l90yx2kURlgfg8uT4RH0buM0HD-~VIo9eBQSwHqGFNPNhEu~-ktNclfuQk90x8Iu1NGBrODiUpW3gCch9SopgNWWY3jySbJ~Fc0Xz21FhhAX5ve7wz7nIkeAY1K00H4NgH4-7MSS7jvTguOwJkLUJNQIDOf28LR-aOEyDVpHoKMAR4DpOvVzpPj5L2a1sb6tkcDWVjwDUmg__'
    ]
  };
  int rating = 5;
  Map<dynamic, dynamic> yorum = {
    'yorumName': 'Murat Y.',
    'rating': 5.0,
    'userImg': '',
    'yorum': 'Burada kişilerin yorumları görünecektir.'
  };

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
    double width = MediaQuery.of(context).size.width;
    final themeData = HomeStyle(context: context);
    return Scaffold(
      backgroundColor: Colors.grey[100]!.withOpacity(0.7),
      body: Stack(children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            children: [
              _profilGiris(width, context),
              _profilIstatikler(width, themeData),
              _profilHakkinda(themeData, width, context),
              _profilGonderiler(context, themeData, width),
              _profilLastComment(context, width, themeData),
              _BenzerUrunlerText(context, themeData),
              //_populerUrunlerCards(height, width) //Backend yapımından dolayı deployed
              SizedBox(
                height: 100,
              )
            ],
          ),
        ),
        Builder(
          builder: (context) {
            if (widget.myProfile) {
              return ShortcutCenter(user: widget.sellerProfil);
            } else {
              return SizedBox();
            }
          },
        )
      ]),
    );
  }

  GridView _populerUrunlerCards(double height, double width) {
    return GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10),
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

  Padding _BenzerUrunlerText(BuildContext context, HomeStyle themeData) {
    return customText('Benzer Ürünler', context,
        padding: EdgeInsets.only(left: 10),
        textAlign: TextAlign.left,
        size: themeData.bodyLarge.fontSize,
        weight: FontWeight.w800);
  }

  Container _profilLastComment(
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
              'Son 4 Satışın Yorumları',
              context,
              size: themeData.bodyLarge.fontSize,
              weight: FontWeight.w800,
            ),
            Divider(),
            SizedBox(
              height: 200, // Yorum kutularının yüksekliği
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

  Container _profilGonderiler(
      BuildContext context, HomeStyle themeData, double width) {
    return container(context,
        color: themeData.surfaceContainer,
        margin: EdgeInsets.symmetric(horizontal: 20),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          spacing: 10,
          children: [
            customText('Gönderiler', context,
                size: themeData.bodyLarge.fontSize, weight: FontWeight.w900),
            gonderiContainer(
                context,
                themeData,
                gonderi['gonderiBaslik'],
                gonderi['gonderiAciklama'],
                gonderi['gonderiImages'],
                profil['profilImage'],
                widget.sellerProfil.username),
            _seeAllPosts(width, themeData),
          ],
        ));
  }

  SizedBox _seeAllPosts(double width, HomeStyle themeData) {
    return SizedBox(
      width: width,
      child: GestureDetector(
        onTap: () {
          setState(() {
            print('Tüm gönderileri gör');
          });
        },
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: themeData.headlineSmall.fontSize,
                color: themeData.secondary), // Varsayılan stil
            children: [
              TextSpan(
                text: 'Tüm gönderileri gör',
              ),
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: Icon(
                  size: themeData.headlineSmall.fontSize! * 1.1,
                  Icons.arrow_forward,
                  color: themeData.secondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _profilHakkinda(
      HomeStyle themeData, double width, BuildContext context) {
    return Builder(builder: (context) {
      if (widget.sellerProfil.profilTanitimYazisi != '') {
        return container(
          context,
          color: themeData.surfaceContainer,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          width: width,
          //height: 268,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            spacing: 10,
            children: [
              customText('Hakkında', context,
                  size: themeData.bodyLarge.fontSize, weight: FontWeight.w800),
              customText(
                  widget.sellerProfil.profilTanitimYazisi == ''
                      ? 'Noname'
                      : widget.sellerProfil.profilTanitimYazisi,
                  context,
                  weight: FontWeight.w400,
                  maxLines: 13,
                  size: themeData.bodyMedium.fontSize),
              Builder(builder: (context) {
                if (widget.myProfile) {
                  return Align(
                    alignment: Alignment.bottomRight,
                    child: RichText(
                      textAlign: TextAlign.end,
                      text: TextSpan(
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize:
                                HomeStyle(context: context).bodyMedium.fontSize,
                            color: themeData.secondary), // Varsayılan stil
                        children: [
                          TextSpan(
                            text: 'hakkında kısmını düzenle',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: Icon(
                              Icons.arrow_forward,
                              color: themeData.secondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return SizedBox();
                }
              })
            ],
          ),
        );
      }
      return SizedBox();
    });
  }

  Builder _profilIstatikler(double width, HomeStyle themeData) {
    return Builder(builder: (context) {
      if (widget.myProfile) {
        return container(
          context,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          color: HomeStyle(context: context).surfaceContainer,
          //height: 285,
          width: width,
          child: Column(
            spacing: 5,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              customText('Profil istatistikleri', context,
                  size: themeData.bodyLarge.fontSize, weight: FontWeight.w800),
            ],
          ),
        );
      } else {
        return SizedBox(
          height: 0,
          width: 0,
        );
      }
    });
  }

  Column _profilGiris(double width, BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        container(
          context,
          color: HomeStyle(context: context).surfaceContainer,
          height: 306,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                clipBehavior: Clip.none, // Taşan kısımların kesilmemesi için
                children: [
                  _kapakFoto(width),
                  _profilFoto(width),
                ],
              ),
              SizedBox(
                height: profileSize / 3,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    _isimVeBilgi(context),
                    Column(
                      spacing: 5,
                      //crossAxisAlignment: CrossAxisAlignment.end,
                      //mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [_stickerEdit(context), _imeceOnay(context)],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  spacing: 20,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                        flex: 1,
                        child: widget.myProfile
                            ? textButton(
                                context,
                                'Profili Düzenle',
                                minSizeHeight: 32,
                                elevation: 5,
                                onPressed: () {
                                  showTemporarySnackBar(context,
                                      'Profili Düzenle Button (){onPressed}');
                                },
                              )
                            : textButton(
                                context,
                                'Takip Et',
                                minSizeHeight: 32,
                                elevation: 5,
                                onPressed: () {
                                  showTemporarySnackBar(
                                      context, 'Takip Et Button (){onPressed}');
                                },
                              )),
                    Expanded(
                      flex: 1,
                      child: widget.myProfile
                          ? textButton(
                              context,
                              'Mesaj Kutun',
                              minSizeHeight: 32,
                              elevation: 5,
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, '/profil/messaging');
                              },
                            )
                          : textButton(
                              context,
                              'Mesaj Gönder',
                              minSizeHeight: 32,
                              elevation: 5,
                              onPressed: () {
                                showTemporarySnackBar(context,
                                    'Mesaj Gönder Button (){onPressed}');
                              },
                            ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Column _imeceOnay(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        Builder(
          builder: (context) {
            if (widget.sellerProfil.imeceOnay) {
              ShaderMask(
                shaderCallback: (bounds) => LinearGradient(
                  colors: [
                    Color.fromRGBO(255, 229, 0, 1),
                    Color.fromRGBO(153, 138, 0, 1),
                  ],
                ).createShader(
                    Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
                child: RichText(
                  textAlign: TextAlign.end,
                  text: TextSpan(
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        decoration: TextDecoration.underline,
                        fontSize:
                            HomeStyle(context: context).bodyMedium.fontSize,
                        color: Colors.white), // Varsayılan stil
                    children: [
                      TextSpan(text: 'İmece Onaylı Satıcı  '),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: Image.asset(
                            fit: BoxFit.cover,
                            colorBlendMode: BlendMode.color,
                            cacheHeight: 13,
                            cacheWidth: 19,
                            'assets/icon/ic_certificate.jpg'),
                      ),
                    ],
                  ),
                ),
              );
            }
            return SizedBox(
              height: 5,
            );
          },
        ),
        Builder(builder: (context) {
          if (widget.myProfile) {
            return customText('${sonKullanimTarihi} Tarihine kadar ', context,
                weight: FontWeight.w500,
                size: HomeStyle(context: context).bodySmall.fontSize);
          } else {
            return SizedBox(
              height: 15,
            );
          }
        })
      ],
    );
  }

  Column _stickerEdit(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        Builder(builder: (context) {
          if (widget.sellerProfil.rol == 'satici') {
            return FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerRight,
              //flex: 2,
              child: TextButton(
                  style: TextButton.styleFrom(
                    side: BorderSide(
                        color: HomeStyle(context: context).outline,
                        width: 1), // Çerçeve rengi ve kalınlığı
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          8), // Kenar yumuşaklığı (circular 8)
                    ),
                  ),
                  onPressed: () {},
                  child: customText(
                      "${widget.sellerProfil.username} çiftliği", context,
                      weight: FontWeight.bold,
                      size: HomeStyle(context: context).bodySmall.fontSize)),
            );
          }
          return SizedBox();
        }),
        Builder(builder: (context) {
          if (widget.myProfile) {
            return RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                    fontSize: HomeStyle(context: context).bodyMedium.fontSize,
                    color: HomeStyle(context: context)
                        .secondary), // Varsayılan stil
                children: [
                  TextSpan(text: 'Etiket adını değiştir'),
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: Icon(
                      size: 18,
                      Icons.arrow_forward_rounded,
                      color: HomeStyle(context: context).secondary,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return SizedBox(
              height: 16,
              width: 0,
            );
          }
        })
      ],
    );
  }

  Column _isimVeBilgi(BuildContext context) {
    return Column(
      spacing: 5,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.min,
      children: [
        customText(
            widget.sellerProfil.firstName == ''
                ? 'Noname'
                : widget.sellerProfil.firstName,
            context,
            weight: FontWeight.bold,
            size: HomeStyle(context: context).bodyLarge.fontSize),
        customText('çiftçi / hayvan üreticisi', context,
            weight: FontWeight.w500,
            size: HomeStyle(context: context).bodySmall.fontSize),
        customText('Türkiye / Aydın / akbük', context,
            weight: FontWeight.w300,
            size: HomeStyle(context: context).bodySmall.fontSize),
      ],
    );
  }

  Positioned _profilFoto(double width) {
    return Positioned(
      top: coverHeight - profileSize / 1.5,
      left: 20, // Ortalamak için
      child: Stack(children: [
        Container(
          width: profileSize,
          height: profileSize,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white, width: 2),
              image: DecorationImage(
                  image: NetworkImage(widget.sellerProfil.profilFotograf == ''
                      ? notFoundImageUrl
                      : 'widget.sellerProfil.profilFotograf'))),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: 13,
            height: 13,
            decoration: BoxDecoration(
                color: widget.sellerProfil.isActive ? Colors.red : Colors.green,
                borderRadius: BorderRadius.circular(8)),
          ),
        )
      ]),
    );
  }

  Container _kapakFoto(double width) {
    return Container(
      width: width,
      height: coverHeight,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(widget.sellerProfil.profilBanner == ''
                  ? notFoundImageUrl
                  : widget.sellerProfil.profilBanner),
              fit: BoxFit.cover)),
    );
  }
}
