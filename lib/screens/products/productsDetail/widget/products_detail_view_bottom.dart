part of '../products_detail_screen.dart';

class ProductsDetailViewBottom extends StatefulWidget {
  final Product product;

  const ProductsDetailViewBottom({super.key, required this.product});

  @override
  State<ProductsDetailViewBottom> createState() =>
      _ProductsDetailViewBottomState();
}

class _ProductsDetailViewBottomState extends State<ProductsDetailViewBottom> {
  @override
  Widget build(BuildContext context) {
    final themeData = HomeStyle(context: context);
    return container(
      context,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      color: themeData.surfaceContainer,
      width: double.infinity,
      height: 70,
      child: Row(
        spacing: 10,
        children: [
          _fiyatStokText(themeData),
          _sepeteEkleButton(context),
          _grupAlimButton(context)
        ],
      ),
    );
  }

  Expanded _grupAlimButton(BuildContext context) {
    return Expanded(
        child: textButton(context, 'Grup alım',
            buttonColor: Colors.orange, elevation: 4));
  }

  Expanded _sepeteEkleButton(BuildContext context) =>
      Expanded(child: textButton(context, 'Sepete ekle', elevation: 4));

  Expanded _fiyatStokText(HomeStyle themeData) {
    return Expanded(
        child: RichText(
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
                style: TextStyle(
                    fontSize: themeData.bodyLarge.fontSize,
                    color: themeData.primary,
                    fontWeight: FontWeight.bold),
                children: [
                  TextSpan(text: 'KG:'),
                  TextSpan(
                      text: ' ${widget.product.fiyat} TL',
                      style: TextStyle(color: themeData.secondary)),
                  TextSpan(text: '\nKalan:'),
                  TextSpan(
                      text: ' ${widget.product.stokDurumu} KG',
                      style: TextStyle(
                          color: getStokRengi(widget.product.stokDurumu ?? 0))),
                ])));
  }
}

// Stok durumuna göre renk belirleme fonksiyonu
Color getStokRengi(int stok) {
  if (stok > 200) {
    return Colors.green;
  } else if (stok >= 100 && stok <= 200) {
    return Colors.yellow.shade800;
  } else {
    return Colors.red;
  }
}
