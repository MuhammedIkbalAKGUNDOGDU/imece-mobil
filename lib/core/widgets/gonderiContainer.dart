import 'package:flutter/material.dart';
import 'package:imecehub/core/widgets/container.dart';
import 'package:imecehub/core/widgets/text.dart';
import 'package:imecehub/screens/home/style/home_screen_style.dart';

Container gonderiContainer(
  BuildContext context,
  HomeStyle themeData,
  String gonderiBaslik,
  String gonderiAciklama,
  List gonderiImages,
  String profilImage,
  String profilName,
) {
  return container(context,
      border: Border.all(
          color: HomeStyle(context: context).outline.withOpacity(0.2)),
      isBoxShadow: false,
      borderRadius: BorderRadius.circular(8),
      padding: EdgeInsets.all(5),
      color: themeData.surfaceContainer,
      margin: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        spacing: 10,
        children: [
          _profilResimveAdi(context, themeData, profilImage, profilName),
          _gonderiResmi(gonderiImages),
          customText(gonderiBaslik, context,
              size: themeData.bodyMedium.fontSize, weight: FontWeight.w700),
          customText(gonderiAciklama, context)
        ],
      ));
}

Row _profilResimveAdi(BuildContext context, HomeStyle themeData,
    String profilImage, String profilName) {
  return Row(
    spacing: 10,
    children: [
      CircleAvatar(
        backgroundImage: NetworkImage(profilImage),
      ),
      customText('${profilName}', context,
          weight: FontWeight.w400, size: themeData.bodyMedium.fontSize)
    ],
  );
}

SizedBox _gonderiResmi(List gonderiImages) {
  return SizedBox(
    height: 225,
    child: Expanded(
      child: PageView.builder(
        itemCount: gonderiImages.length,
        itemBuilder: (context, imgIndex) {
          return Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    onError: (exception, stackTrace) {
                      Placeholder();
                    },
                    image: NetworkImage(gonderiImages[imgIndex]),
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
                    "${imgIndex + 1}/${gonderiImages.length}",
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
  );
}
