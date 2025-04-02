import 'package:flutter/material.dart';
import 'package:imecehub/core/widgets/container.dart';
import 'package:imecehub/core/widgets/raitingStars.dart';
import 'package:imecehub/core/widgets/text.dart';
import 'package:imecehub/screens/home/style/home_screen_style.dart';

SizedBox soruCevapContainer(BuildContext context, HomeStyle themeData,
    double width, Map<dynamic, dynamic> soruCevap) {
  double profileSize = 25;
  return SizedBox(
    width: width * 0.7,
    child: Card(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      //context,

      //borderRadius: BorderRadius.circular(8),
      //color: themeData.shadow,
      //width: width * 0.7,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 10,
          children: [
            Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Row(
                    spacing: 5,
                    children: [
                      CircleAvatar(),
                      customText(soruCevap['soruProfilAdi'], context,
                          weight: FontWeight.w600,
                          size: themeData.bodyMedium.fontSize),
                    ],
                  ),
                ),
              ],
            ),
            customText('${soruCevap['soru']}', context,
                maxLines: 10,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                size: themeData.bodyMedium.fontSize,
                color: themeData.primary),
            Expanded(
              child: container(context,
                  color: themeData.surfaceContainer,
                  padding: EdgeInsets.all(8),
                  borderRadius: BorderRadius.circular(8),
                  child: Column(
                    children: [
                      Row(
                        spacing: 5,
                        children: [
                          Container(
                            width: profileSize,
                            height: profileSize,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border:
                                    Border.all(color: Colors.white, width: 2),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://raw.githubusercontent.com/MuhammedIkbalAKGUNDOGDU/imece-test-website/refs/heads/main/imece/src/assets/images/profil_photo.png'))),
                          ),
                          customText(soruCevap['cevapVeren'], context,
                              weight: FontWeight.w500,
                              size: themeData.bodySmall.fontSize),
                        ],
                      ),
                      customText(soruCevap['cevap'], context,
                          size: themeData.bodySmall.fontSize,
                          maxLines: 10,
                          weight: FontWeight.w400)
                    ],
                  )),
            )
          ],
        ),
      ),
    ),
  );
}
