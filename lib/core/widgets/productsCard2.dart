import 'package:flutter/material.dart';
import 'package:imecehub/core/widgets/raitingStars.dart';
import 'package:imecehub/core/widgets/richText.dart';
import 'package:imecehub/core/widgets/text.dart';
import 'package:imecehub/core/widgets/textButton.dart';
import 'package:imecehub/models/products.dart';
import 'package:imecehub/screens/home/style/home_screen_style.dart';
import 'package:imecehub/services/api_service.dart';

class productsCard2 extends StatefulWidget {
  final Product product;

  final double width;

  final BuildContext context;

  final double height;

  const productsCard2(
      {super.key,
      required this.product,
      required this.width,
      required this.context,
      required this.height});

  @override
  State<productsCard2> createState() => _productsCardState();
}

class _productsCardState extends State<productsCard2> {
  bool favoriteProduct = false;
  String notFoundImageUrl = 'https://www.halifuryasi.com/Upload/null.png';
  bool cokluGorsel = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: HomeStyle(context: context).surfaceContainer,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          spacing: 3,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Builder(builder: (context) {
              if (widget.product.kapakGorseli != '') {
                return Expanded(
                  child: cokluGorsel == true
                      ? PageView.builder(
                          itemCount: widget.product.kapakGorseli!.length,
                          itemBuilder: (context, imgIndex) {
                            return Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                      image: AssetImage(widget.product
                                                  .kapakGorseli![imgIndex] ==
                                              ''
                                          ? notFoundImageUrl
                                          : widget
                                              .product.kapakGorseli![imgIndex]),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                // Görselin alt sağ köşesinde kaçıncı görsel olduğunu gösteren etiket
                                Positioned(
                                  bottom: 4,
                                  right: 4,
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 25,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      color:
                                          HomeStyle(context: context).outline,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      "${imgIndex + 1}/${widget.product.kapakGorseli!.length}",
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        )
                      : Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      widget.product.kapakGorseli ??
                                          notFoundImageUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ), // Görselin alt sağ köşesinde kaçıncı görsel olduğunu gösteren etiket
                            Positioned(
                              bottom: 4,
                              right: 4,
                              child: Container(
                                alignment: Alignment.center,
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                  color: HomeStyle(context: context).outline,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  "1/1",
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                );
              } else {
                return Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: NetworkImage(notFoundImageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              }
            }),
            const SizedBox(height: 4),
            richText(
                color: HomeStyle(context: context).secondary,
                fontSize: HomeStyle(context: context).bodyLarge.fontSize,
                textAlign: TextAlign.start,
                context,
                children: [
                  TextSpan(
                      text: widget.product.urunAdi ?? '',
                      style: TextStyle(
                          color: HomeStyle(context: context).primary)),
                  TextSpan(text: '\n', style: TextStyle(fontSize: 11)),
                  WidgetSpan(
                    child: buildRatingStars(widget.product.degerlendirmePuani),
                  ),
                  TextSpan(text: '\n\n', style: TextStyle(fontSize: 10)),
                  TextSpan(
                      text: 'KG: ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: '${widget.product.fiyat} TL'),
                  TextSpan(text: '\n\n', style: TextStyle(fontSize: 3)),
                  TextSpan(
                      text: 'Stok: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                  TextSpan(text: widget.product.stokDurumu.toString()),
                ]),
            SizedBox(
              height: 4,
            ),
            textButton(
              context,
              'Ürün Detay',
              minSizeHeight: 38,
              elevation: 0,
              weight: FontWeight.bold,
              fontSize: HomeStyle(context: context).bodyLarge.fontSize,
              buttonColor: HomeStyle(context: context).surfaceContainer,
              titleColor: HomeStyle(context: context).secondary,
              border: true,
              borderWidth: 1,
              onPressed: () {
                Future<Product> _futurePopulerProducts =
                    ApiService.fetchProduct(widget.product.urunId)
                        as Future<Product>;

                setState(() {
                  Navigator.pushNamed(context, '/home/productsDetail',
                      arguments: _futurePopulerProducts);
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
