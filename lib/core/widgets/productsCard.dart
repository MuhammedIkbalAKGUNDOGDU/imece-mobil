import 'package:flutter/material.dart';
import 'package:imecehub/core/widgets/text.dart';
import 'package:imecehub/screens/home/style/home_screen_style.dart';

class productsCard extends StatefulWidget {
  final dynamic product;

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

// Puanlamaya göre yıldızları oluşturan fonksiyon
Widget buildRatingStars(int rating) {
  List<Widget> stars = [];
  for (int i = 0; i < 5; i++) {
    if (i < rating) {
      stars.add(const Icon(Icons.star, color: Colors.orange, size: 16));
    } else {
      stars.add(const Icon(Icons.star_border, color: Colors.orange, size: 16));
    }
  }
  return Row(children: stars);
}

class _productsCardState extends State<productsCard> {
  bool favoriteProduct = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: HomeStyle(context: context).surface,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          spacing: 3,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: widget.product['imagePath'].length,
                itemBuilder: (context, imgIndex) {
                  return Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: AssetImage(
                                widget.product['imagePath'][imgIndex]),
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
                            color: HomeStyle(context: context).outline,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            "${imgIndex + 1}/${widget.product['imagePath'].length}",
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
              ),
            ),
            const SizedBox(height: 4),
            // Bilgi bölümünü içerik kadar yer kaplayacak şekilde düzenliyoruz.
            customText(widget.product['productName'], context,
                weight: FontWeight.bold,
                size: HomeStyle(context: context).bodyLarge.fontSize),
            buildRatingStars(widget.product['rating']),
            customText('${widget.product['description']}', context,
                size: 14, maxLines: 2),
            customText("KG: ${widget.product['price']} TL", context,
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
                          size: HomeStyle(context: context).bodySmall.fontSize),
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
    );
  }
}
