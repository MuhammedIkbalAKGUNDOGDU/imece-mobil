part of '../wallet_screen.dart';

SafeArea _walletViewBody(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
  final themeData = HomeStyle(context: context);
  String bakiye = '239.567,78';
  String imageUrl2 =
      "data:image/jpeg;base64,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";
  String imageUrl3 =
      "data:image/jpeg;base64,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";
  String imageUrl1 =
      'https://github.com/MuhammedIkbalAKGUNDOGDU/imece-test-website/blob/main/imece/src/assets/images/mandalina.png?raw=true';
  List<Map<String, dynamic>> pastPayments = [
    {'date': '2023-10-01', 'amount': 100.0},
    {'date': '2023-10-02', 'amount': 200.0},
    {'date': '2023-10-03', 'amount': 300.0},
    {'date': '2023-10-04', 'amount': 400.0},
    {'date': '2023-10-05', 'amount': 500.0},
    {'date': '2023-10-06', 'amount': 600.0},
    {'date': '2023-10-07', 'amount': 700.0},
    {'date': '2023-10-08', 'amount': 800.0},
    {'date': '2023-10-09', 'amount': 900.0},
    {'date': '2023-10-10', 'amount': 1000.0}
  ];
  return SafeArea(
      top: true,
      left: true,
      right: true,
      child: SingleChildScrollView(
        padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          spacing: 20,
          children: [
            _yatacakBakiye(context, themeData, bakiye),
            _gecisOdemeler(context, pastPayments, themeData),
            _satisVerileri(context, themeData),
            _stokUrunPerformansIstatistikleri(
                context, imageUrl1, imageUrl2, imageUrl3, themeData, width),
            _bolgeselSatisVerileri(context, themeData),
            _siparisDetaylari(context, themeData)
          ],
        ),
      ));
}

SizedBox _siparisDetaylari(BuildContext context, HomeStyle themeData) {
  return SizedBox(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        customText('Sipariş Detayları', context,
            size: 20, weight: FontWeight.bold, color: themeData.primary),
        const SizedBox(height: 16),
        // Toplam Sipariş Sayısı Kartı
        Card(
          elevation: 3,
          color: themeData.surfaceContainer,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Toplam Sipariş Sayısı',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: themeData.primary,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildDataColumn('Günlük', '124 KG', themeData),
                    _buildDataColumn('Aylık', '1214 KG', themeData),
                    _buildDataColumn('Yıllık', '12.144 KG', themeData),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        // İade Edilen Sipariş Sayısı Kartı
        Card(
          elevation: 3,
          color: themeData.surfaceContainer,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'İade Edilen Sipariş Sayısı',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: themeData.primary,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildDataColumn('Günlük', '14 KG', themeData),
                    _buildDataColumn('Aylık', '154 KG', themeData),
                    _buildDataColumn('Yıllık', '2.144 KG', themeData),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildDataColumn(String period, String value, HomeStyle themeData) {
  return Column(
    children: [
      Text(
        period,
        style: TextStyle(
          fontSize: 14,
          color: themeData.primary,
        ),
      ),
      const SizedBox(height: 8),
      Text(
        value,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: themeData.secondary,
        ),
      ),
    ],
  );
}

SizedBox _bolgeselSatisVerileri(BuildContext context, HomeStyle themeData) {
  return SizedBox(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: _headerText(
            context,
            'Bölgesel Satış Verileri',
          ),
        ),
        SizedBox(height: 15),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            customText('İstanbul: 10.000KG', context,
                color: themeData.primary.withOpacity(0.5)),
            customText('Kazanç: 123.083,78 ₺', context,
                color: themeData.secondary),
          ],
        ),
        Divider(color: themeData.primary),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            customText('Bursa: 7.000KG', context,
                color: themeData.primary.withOpacity(0.5)),
            customText('Kazanç: 123.083,78 ₺', context,
                color: themeData.secondary),
          ],
        ),
        Divider(color: themeData.primary),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            customText('Kocaeli: 4.000KG', context,
                color: themeData.primary.withOpacity(0.5)),
            customText('Kazanç: 123.083,78 ₺', context,
                color: themeData.secondary),
          ],
        ),
        Divider(color: themeData.primary),
      ],
    ),
  );
}

SizedBox _stokUrunPerformansIstatistikleri(
    BuildContext context,
    String imageUrl1,
    String imageUrl2,
    String imageUrl3,
    HomeStyle themeData,
    double width) {
  return SizedBox(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _headerText(context, 'Stok Ürün ve Ürün Performansı'),
        SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              spacing: 20,
              children: [
                SizedBox(height: 50),
                _buildContainer(
                  context: context,
                  topNumber: "2",
                  imageUrl: imageUrl1,
                  title: "Mandalina",
                  subtitle: "10.000KG Satış",
                ),
              ],
            ),
            _buildContainer(
              context: context,
              topNumber: "1",
              imageUrl: imageUrl2,
              title: "Portakal",
              subtitle: "20.000KG Satış",
            ),
            Column(
              spacing: 20,
              children: [
                SizedBox(height: 50),
                _buildContainer(
                  context: context,
                  topNumber: "3",
                  imageUrl: imageUrl3,
                  title: "Elma",
                  subtitle: "4.000 Kg Satış",
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 20),
        richText(
            color: themeData.primary.withOpacity(0.5),
            textAlign: TextAlign.start,
            maxLines: 10,
            context,
            children: [
              TextSpan(
                  text: 'Bazı istatistikler\n\n',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: themeData.primary)),
              TextSpan(text: 'En hızlı tükenen ürün: '),
              TextSpan(
                  text: 'Portakal\n',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              WidgetSpan(
                  child: Divider(
                      color: themeData.primary, endIndent: width * 0.2)),
              TextSpan(text: 'En fazla kazanç sağlayan ürün: '),
              TextSpan(
                  text: 'Elma\n',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              WidgetSpan(
                  child: Divider(
                      color: themeData.primary, endIndent: width * 0.2)),
              TextSpan(text: 'Ortalama alıcı sepet tutarı: '),
              TextSpan(
                  text: '357,67 ₺',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ]),
      ],
    ),
  );
}

SizedBox _satisVerileri(BuildContext context, HomeStyle themeData) {
  return SizedBox(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _headerText(context, 'Satış Verileri'),
        container(context,
            color: themeData.surfaceContainer,
            isBoxShadow: false,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                color: themeData.secondary, width: 1, style: BorderStyle.solid),
            child: Expanded(
              child: richText(
                  color: themeData.primary.withOpacity(0.5),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  context,
                  children: [
                    TextSpan(
                        text: 'Günlük: ',
                        style:
                            TextStyle(fontSize: themeData.bodyLarge.fontSize)),
                    TextSpan(
                        text: ' 708,67 ₺',
                        style: TextStyle(
                            fontSize: themeData.bodyLarge.fontSize,
                            fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: '  /  ',
                        style:
                            TextStyle(fontSize: themeData.bodyLarge.fontSize)),
                    TextSpan(
                        text: 'Aylık: ',
                        style:
                            TextStyle(fontSize: themeData.bodyLarge.fontSize)),
                    TextSpan(
                        text: ' 25.749,67 ₺',
                        style: TextStyle(
                            fontSize: themeData.bodyLarge.fontSize,
                            fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: '  /  ',
                        style:
                            TextStyle(fontSize: themeData.bodyLarge.fontSize)),
                    TextSpan(
                        text: 'Yıllık: ',
                        style:
                            TextStyle(fontSize: themeData.bodyLarge.fontSize)),
                    TextSpan(
                        text: ' 365.654,67 ₺',
                        style: TextStyle(
                            fontSize: themeData.bodyLarge.fontSize,
                            fontWeight: FontWeight.bold)),
                  ]),
            )),
      ],
    ),
  );
}

SizedBox _gecisOdemeler(BuildContext context,
    List<Map<String, dynamic>> pastPayments, HomeStyle themeData) {
  return SizedBox(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _headerText(context, 'Geçmiş Ödemeler'),
        SizedBox(height: 10),
        ...pastPayments.take(4).map((payment) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                richText(
                    color: themeData.primary.withOpacity(0.5),
                    context,
                    children: [
                      TextSpan(text: "${payment['date']}'te yatırılan tutar: "),
                      TextSpan(
                          text: '${payment['amount']} ₺',
                          style: TextStyle(fontWeight: FontWeight.bold))
                    ]),
                Divider()
              ],
            )),
        if (pastPayments.length > 4)
          // "Daha fazla..." butonu
          GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/profil/wallet/pastPayments',
                    arguments: pastPayments);
              },
              child: customText('Daha fazla...', context,
                  color: themeData.secondary,
                  size: themeData.bodyLarge.fontSize,
                  decoration: TextDecoration.underline,
                  weight: FontWeight.w400))
      ],
    ),
  );
}

SizedBox _yatacakBakiye(
    BuildContext context, HomeStyle themeData, String bakiye) {
  return SizedBox(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 5,
      children: [
        _headerText(context, 'Yatacak Bakiye'),
        container(context,
            color: themeData.surfaceContainer,
            isBoxShadow: false,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            border: Border.all(color: themeData.secondary, width: 1),
            borderRadius: BorderRadius.circular(8),
            child: richText(context, children: [
              TextSpan(text: 'Cüzdanıdaki para miktarı: '),
              TextSpan(text: '${bakiye} ₺')
            ]))
      ],
    ),
  );
}

Widget _buildContainer({
  required BuildContext context,
  required String topNumber,
  required String imageUrl,
  required String title,
  required String subtitle,
}) {
  double imgWidth = 100;
  double imgHeight = 100;
  Color? topNumberColor = topNumber == "1"
      ? Colors.yellow
      : topNumber == "2"
          ? Colors.orange
          : Colors.black;
  return Column(
    children: [
      // Görselin yer aldığı container
      Stack(
        clipBehavior: Clip.none,
        children: [
          // Network görseli, hata durumunda fallback görsel gösteriyor
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
              width: imgWidth,
              height: imgHeight,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Image.network(
                  'https://www.halifuryasi.com/Upload/null.png',
                  width: imgWidth,
                  height: imgHeight,
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          // Üstte, sol üst köşede gösterilecek sayı
          Positioned(
            top: -15,
            left: imgWidth / 2 - 5,
            child: Text(
              topNumber,
              style: TextStyle(
                  color: topNumberColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
        ],
      ),
      const SizedBox(height: 8),
      // Üst metin (bold)
      Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      // Alt metin
      Text(
        subtitle,
        style: TextStyle(
          color: HomeStyle(context: context).primary.withOpacity(0.5),
        ),
      )
    ],
  );
}

Padding _headerText(BuildContext context, String title) {
  return customText(title, context,
      size: 18,
      textAlign: TextAlign.start,
      weight: FontWeight.w600,
      color: Theme.of(context).colorScheme.primary);
}
