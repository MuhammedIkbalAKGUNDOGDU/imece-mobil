import 'package:flutter/material.dart';
import 'package:imecehub/core/widgets/raitingStars.dart';
import 'package:imecehub/core/widgets/text.dart';
import 'package:imecehub/models/products.dart';
import 'package:imecehub/screens/home/style/home_screen_style.dart';

class productsCard extends StatefulWidget {
  final Product product;

  final double width;

  final BuildContext context;

  final double height;

  const productsCard(
      {super.key,
      required this.product,
      required this.width,
      required this.context,
      required this.height});

  @override
  State<productsCard> createState() => _productsCardState();
}

class _productsCardState extends State<productsCard> {
  bool favoriteProduct = false;
  String notFoundImageUrl = 'https://www.halifuryasi.com/Upload/null.png';
  bool cokluGorsel = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          Navigator.pushNamed(context, '/products/productsDetail',
              arguments: widget.product);
        });
      },
      child: Card(
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
                                            : widget.product
                                                .kapakGorseli![imgIndex]),
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
              // Bilgi bölümünü içerik kadar yer kaplayacak şekilde düzenliyoruz.
              customText(widget.product.urunAdi ?? '', context,
                  weight: FontWeight.bold,
                  size: HomeStyle(context: context).bodyLarge.fontSize),
              buildRatingStars(
                  double.tryParse(widget.product.degerlendirmePuani)!
                      .toDouble()),
              customText('${widget.product.aciklama}', context,
                  size: 14, maxLines: 2),
              customText("KG: ${widget.product.fiyat} TL", context,
                  size: HomeStyle(context: context).bodyLarge.fontSize,
                  color: HomeStyle(context: context).secondary),
              Row(
                spacing: 5,
                children: [
                  Expanded(
                    flex: 4,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: HomeStyle(context: context).secondary),
                        child: customText('Sepete Ekle', context,
                            color: Colors.white,
                            weight: FontWeight.bold,
                            size:
                                HomeStyle(context: context).bodySmall.fontSize),
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
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.grey[200],
                        ),
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
      ),
    );
  }
}
