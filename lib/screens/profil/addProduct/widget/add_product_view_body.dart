part of '../add_product_screen.dart';

class AddProductViewBody extends StatefulWidget {
  final User profileName;

  const AddProductViewBody({super.key, required this.profileName});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final TextEditingController _controllerUrunAdi = TextEditingController();
  final TextEditingController _controllerUrunKategori = TextEditingController();
  final TextEditingController _controllerUrunAciklama = TextEditingController();
  final TextEditingController _controllerUrunMiktari = TextEditingController();
  final TextEditingController _controllerUrunFiyati = TextEditingController();
  String urunFiyatiKDV = '';
  int activeStep = 0;
  bool isNextButtonFirst = false;
  bool isNextButtonSecond = false;
  bool isNextButtonThird = false;
  int? selectedUrunTipiIndex;
  String? selectedUrunTipiValue;
  final List<String> measurementUnits = ["Adet", "Litre", "Kilo"];
  // Varsayılan değerler; seçilmediğinde null gösterip hint ile "Saat"/"Dakika" yazdıracağız.
  String? selectedHour;
  String? selectedMinute;

  // Saatler 0-24 arası, dakikalar 0-60 arası string listesi oluşturulur.
  final List<String> hourItems = List.generate(25, (index) => index.toString());
  final List<String> minuteItems =
      List.generate(61, (index) => index.toString());

  @override
  void initState() {
    super.initState();
    // Her controller'a aynı doğrulama fonksiyonunu ekliyoruz.
    _controllerUrunAdi.addListener(_validateFormFirst);
    _controllerUrunAciklama.addListener(_validateFormFirst);
    _controllerUrunKategori.addListener(_validateFormFirst);
    _controllerUrunMiktari.addListener(_validateFormSecond);
    _controllerUrunFiyati.addListener(_validateFormSecond);
  }

  void _validateFormFirst() {
    // Üç controller'daki text uzunluklarına göre butonun aktifliğini belirleyelim.
    bool shouldEnable = _controllerUrunAdi.text.length >= 4 &&
        _controllerUrunAciklama.text.length >= 4 &&
        _controllerUrunKategori.text.length >= 4;

    // Değişiklik varsa UI'ı güncelle.
    if (shouldEnable != isNextButtonFirst) {
      setState(() {
        isNextButtonFirst = shouldEnable;
      });
    }
  }

  void _validateFormSecond() {
    bool shouldEnable2 = _controllerUrunFiyati.text.isNotEmpty &&
        _controllerUrunMiktari.text.isNotEmpty &&
        selectedUrunTipiValue != null;
    setState(() {});
    urunFiyatiKDV = _controllerUrunFiyati.text;
    if (shouldEnable2 != isNextButtonSecond) {
      setState(() {
        isNextButtonSecond = shouldEnable2;
      });
    }
  }

  void _validateFormThird() {
    if (selectedHour!.isNotEmpty && selectedMinute!.isNotEmpty) {
      setState(() {
        isNextButtonThird = true;
      });
    } else {
      setState(() {
        isNextButtonThird = false;
      });
    }
  }

  void _validatedFormFourth() {}

  @override
  void dispose() {
    // Controller'ları dispose etmeyi unutmayın.
    _controllerUrunAdi.dispose();
    _controllerUrunAciklama.dispose();
    _controllerUrunKategori.dispose();
    _controllerUrunFiyati.dispose();
    _controllerUrunMiktari.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color? labelTextColor =
        HomeStyle(context: context).outline.withOpacity(0.5);
    final themeData = HomeStyle(context: context);
    double width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          spacing: 10,
          children: [
            _asamaSirasi(width, themeData, context),
            Padding(
              padding: EdgeInsets.only(left: 12, right: 12, bottom: 20),
              child: Builder(builder: (context) {
                switch (activeStep) {
                  case 0:
                    return _urunBilgileri(context, labelTextColor);
                  case 1:
                    return _urunSatisBilgileri(context, width);
                  case 2:
                    return _urunOzellikleri(context, width);
                  case 3:
                    return _urunFotograflari(context, width);
                  default:
                    return Center(
                      child: Text('Bir Hata Olduktu. "Switch case default"'),
                    );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }

  Column _urunFotograflari(BuildContext context, double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        _satisBilgileriHeadlineTexts(context, 'Ürün Görseli Yükleyin'),
        SizedBox(height: 15),
        container(context,
            color: HomeStyle(context: context).surfaceContainer,
            isBoxShadow: true,
            padding: EdgeInsets.all(20),
            borderRadius: BorderRadius.circular(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              spacing: 20,
              children: [
                SizedBox(
                  width: width,
                  height: width * 0.45,
                  child: Image.network(
                      fit: BoxFit.cover,
                      'https://github.com/MuhammedIkbalAKGUNDOGDU/imece-test-website/blob/main/imece/src/assets/images/yuklemeYap.png?raw=true'),
                ),
                richText(maxLines: 20, context, children: [
                  WidgetSpan(
                    child: Icon(
                      Icons.image_outlined,
                      size: 30,
                    ),
                  ),
                  TextSpan(
                      text:
                          '  Görsel 1200x1800 en fazla 5mb boyutunda olmalı\n\n'),
                  WidgetSpan(
                    child: Icon(
                      Icons.settings_overscan_sharp,
                      size: 30,
                    ),
                  ),
                  TextSpan(
                      text: '  Görsel kurallarını görüntülemek için tıkla\n\n'),
                  WidgetSpan(
                    child: Icon(
                      Icons.image_search_rounded,
                      size: 30,
                    ),
                  ),
                  TextSpan(
                      text:
                          '  Yüklemek istediğiniz görsel JPG veya PNG formatında olmalı'),
                ]),
                textButton(context, 'Galeriden Seç',
                    elevation: 6, weight: FontWeight.bold)
              ],
            )),
        Center(
            child: textButton(
          context,
          'Onayla',
          elevation: 6,
          weight: FontWeight.bold,
          onPressed: () {
            showTemporarySnackBar(context, 'Başarıyla Ürün Eklendi');
            setState(() {
              Navigator.pop(context);
            });
          },
        ))
      ],
    );
  }

  Column _urunOzellikleri(BuildContext context, width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      spacing: 10,
      children: [
        Row(
          spacing: 20,
          children: [
            SizedBox(
              width: width * 0.3,
              height: width * 0.3,
              child: Image.network(
                  fit: BoxFit.cover,
                  'https://github.com/MuhammedIkbalAKGUNDOGDU/imece-test-website/blob/main/imece/src/assets/images/yuklemeYap.png?raw=true'),
            ),
            SizedBox(
              width: width * 0.55,
              child: customText('Ürün Sertifikasını Ekle', context,
                  size: HomeStyle(context: context).bodyLarge.fontSize,
                  weight: FontWeight.bold),
            )
          ],
        ),
        Divider(),
        Row(
          spacing: 20,
          children: [
            SizedBox(
              width: width * 0.3,
              height: width * 0.3,
              child: Image.network(
                  fit: BoxFit.cover,
                  'https://github.com/MuhammedIkbalAKGUNDOGDU/imece-test-website/blob/main/imece/src/assets/images/yuklemeYap.png?raw=true'),
            ),
            SizedBox(
              width: width * 0.55,
              child: richText(context,
                  fontSize: HomeStyle(context: context).bodyLarge.fontSize,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.start,
                  maxLines: 10,
                  children: [
                    TextSpan(text: 'Lavoratuvar Sonuçlarını Ekle\n'),
                    TextSpan(text: '\n', style: TextStyle(fontSize: 4)),
                    TextSpan(
                        text:
                            'Değerli üreticimiz, ürününüzü laboratuvarda test ettirmeniz ve çıkan sonucu listelemeniz halinde sizlere x% kadar komisyon indirimi tanınacaktır.',
                        style: TextStyle(
                            fontSize:
                                HomeStyle(context: context).bodyMedium.fontSize,
                            fontWeight: FontWeight.normal,
                            color: HomeStyle(context: context)
                                .primary
                                .withOpacity(0.5)))
                  ]),
            ),
          ],
        ),
        Divider(),
        _satisBilgileriHeadlineTexts(context, 'Listeleme Süresi'),
        Row(
          children: [
            // Saat için DropdownButton
            SizedBox(
              width: width * 0.3,
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  hintText: "Saat",
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 14,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                value: selectedHour,
                items: hourItems.map((String hour) {
                  return DropdownMenuItem<String>(
                    value: hour,
                    child: Text(hour),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedHour = value;
                    _validateFormThird();
                  });
                },
              ),
            ),
            const SizedBox(width: 16),
            // Dakika için DropdownButton
            SizedBox(
              width: width * 0.3,
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  hintText: "Dakika",
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 14,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                value: selectedMinute,
                items: minuteItems.map((String minute) {
                  return DropdownMenuItem<String>(
                    value: minute,
                    child: Text(minute),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedMinute = value;
                    _validateFormThird();
                  });
                },
              ),
            ),
          ],
        ),
        Center(child: _generalTextButtons(context, isNextButtonThird)),
      ],
    );
  }

  Column _urunSatisBilgileri(BuildContext context, width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      spacing: 10,
      children: [
        _satisBilgileriHeadlineTexts(context, 'Ürün Tipini Seçin'),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          spacing: 10,
          children: [
            ...List.generate(
              measurementUnits.length,
              (index) {
                bool isSelected = index == selectedUrunTipiIndex;
                return Expanded(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      child: textButton(
                        context,
                        measurementUnits[index],
                        elevation: 6,
                        weight: FontWeight.bold,
                        fontSize:
                            HomeStyle(context: context).bodyLarge.fontSize,
                        titleColor: isSelected
                            ? HomeStyle(context: context).onSecondary
                            : HomeStyle(context: context).secondary,
                        shadowColor: isSelected
                            ? HomeStyle(context: context).secondary
                            : Colors.grey[200],
                        buttonColor: isSelected ? null : Colors.grey[200],
                        onPressed: () {
                          setState(() {
                            selectedUrunTipiIndex = index;
                            selectedUrunTipiValue = measurementUnits[index];
                            _validateFormSecond();
                          });
                        },
                      )),
                );
              },
            ),
          ],
        ),
        SizedBox(height: 15),
        _satisBilgileriHeadlineTexts(context, 'Ürünün Miktarı'),
        textField(context,
            hintText: 'Ürün Miktarı',
            controller: _controllerUrunMiktari,
            keyboardType: TextInputType.number),
        SizedBox(height: 15),
        _satisBilgileriHeadlineTexts(context, 'Satış Fiyatı'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          spacing: 2,
          children: [
            SizedBox(
                width: urunFiyatiKDV.length > 4
                    ? width * 0.5
                    : urunFiyatiKDV.length > 2
                        ? width * 0.55
                        : width * 0.6,
                child: textField(context,
                    hintText: 'Satış fiyatı',
                    controller: _controllerUrunFiyati,
                    keyboardType: TextInputType.number)),
            SizedBox(
              width: urunFiyatiKDV.length > 4
                  ? width * 0.39
                  : urunFiyatiKDV.length > 2
                      ? width * 0.34
                      : width * 0.29,
              child: textField(context,
                  readOnly: true,
                  hintText: 'KDV $urunFiyatiKDV TL',
                  hintTextColor: HomeStyle(context: context).primary),
            )
          ],
        ),
        Align(
          alignment: Alignment.center,
          child: _generalTextButtons(context, isNextButtonSecond),
        )
      ],
    );
  }

  Padding _satisBilgileriHeadlineTexts(BuildContext context, String text) {
    return customText(text, context,
        size: HomeStyle(context: context).bodyLarge.fontSize,
        weight: FontWeight.bold);
  }

  Column _urunBilgileri(BuildContext context, Color? labelTextColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      spacing: 10,
      children: [
        textField(
          context,
          labelText: 'Ürün Adı',
          maxLines: 1,
          controller: _controllerUrunAdi,
          labelTextColor: labelTextColor,
          onTap: () {
            setState(() {
              labelTextColor = HomeStyle(context: context).outline;
            });
          },
        ),
        textField(context,
            labelText: 'Ürün Kategorisi Seç',
            maxLines: 1,
            controller: _controllerUrunKategori),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          child: textField(context,
              labelText: 'Ürün Açıklaması',
              maxLines: 15,
              expands: true,
              controller: _controllerUrunAciklama),
        ),
        _generalTextButtons(context, isNextButtonFirst),
      ],
    );
  }

  SizedBox _generalTextButtons(BuildContext context, bool isNext) {
    return textButton(
      context,
      'Devam Et',
      buttonColor:
          isNext ? null : HomeStyle(context: context).primary.withOpacity(0.3),
      titleColor: HomeStyle(context: context).onSecondary,
      weight: FontWeight.bold,
      elevation: 6,
      fontSize: HomeStyle(context: context).bodyLarge.fontSize,
      onPressed: isNext
          ? () {
              setState(() {
                if (isNext) {
                  activeStep += 1;
                }
              });
            }
          : null,
    );
  }

  SizedBox _asamaSirasi(
      double width, HomeStyle themeData, BuildContext context) {
    return SizedBox(
      child: EasyStepper(
        direction: Axis.horizontal,
        activeStep: activeStep,
        stepShape: StepShape.circle,
        showStepBorder: false,
        borderThickness: 0,
        padding: const EdgeInsets.all(0),
        internalPadding: 0,
        stepRadius: 25,
        finishedStepBorderColor: themeData.onSecondary,
        finishedStepTextColor: themeData.onSecondary,
        finishedStepBackgroundColor: themeData.secondary,
        activeStepIconColor: themeData.secondary,
        showLoadingAnimation: false,
        steps: [
          EasyStep(
            customStep: CircleAvatar(
              backgroundColor:
                  activeStep >= 0 ? themeData.secondary : themeData.onSecondary,
              child: Icon(
                Icons.settings_system_daydream_rounded,
                color: activeStep >= 0
                    ? themeData.onSecondary
                    : themeData.secondary,
              ),
            ),
            customTitle: customText(
              'Ürün Bilgileri',
              context,
              maxLines: 2,
              textAlign: TextAlign.center,
              weight: activeStep == 0 ? FontWeight.bold : FontWeight.normal,
              color: activeStep >= 1 ? themeData.secondary : themeData.primary,
            ),
            //title: 'Ürün Bilgileri',
          ),
          EasyStep(
            customStep: CircleAvatar(
              backgroundColor:
                  activeStep >= 1 ? themeData.secondary : themeData.onSecondary,
              child: Icon(
                activeStep >= 1 ? Icons.info_outline : Icons.info,
                color: activeStep >= 1
                    ? themeData.onSecondary
                    : themeData.secondary,
              ),
            ),
            customTitle: customText(
              'Satış Bilgileri',
              context,
              maxLines: 2,
              textAlign: TextAlign.center,
              weight: activeStep == 1 ? FontWeight.bold : FontWeight.normal,
              color: activeStep >= 2 ? themeData.secondary : themeData.primary,
            ),
          ),
          EasyStep(
            customStep: CircleAvatar(
              backgroundColor:
                  activeStep >= 2 ? themeData.secondary : themeData.onSecondary,
              child: Icon(
                Icons.display_settings_sharp,
                color: activeStep >= 2
                    ? themeData.onSecondary
                    : themeData.secondary,
              ),
            ),
            customTitle: customText(
              'Ürün Özellikleri',
              context,
              maxLines: 2,
              textAlign: TextAlign.center,
              weight: activeStep == 2 ? FontWeight.bold : FontWeight.normal,
              color: activeStep >= 3 ? themeData.secondary : themeData.primary,
            ),
          ),
          EasyStep(
            customStep: CircleAvatar(
              backgroundColor:
                  activeStep >= 3 ? themeData.secondary : themeData.onSecondary,
              child: Icon(
                activeStep >= 4 ? Icons.image_outlined : Icons.image,
                color: activeStep >= 3
                    ? themeData.onSecondary
                    : themeData.secondary,
              ),
            ),
            customTitle: customText(
              'Ürün Fotoğrafı',
              context,
              maxLines: 2,
              textAlign: TextAlign.center,
              weight: activeStep == 3 ? FontWeight.bold : FontWeight.normal,
              color: activeStep >= 4 ? themeData.secondary : themeData.primary,
            ),
          ),
        ],
        onStepReached: (index) {
          setState(() {
            if (index >= activeStep) {
              return null;
            } else {
              activeStep = index;
            }
          });
        },
      ),
    );
  }
}
