import 'package:flutter/material.dart';
import 'package:imecehub/core/widgets/container.dart';
import 'package:imecehub/core/widgets/raitingStars.dart';
import 'package:imecehub/core/widgets/text.dart';
import 'package:imecehub/screens/home/style/home_screen_style.dart';

Container yorumContainer(BuildContext context, HomeStyle themeData,
    double width, Map<dynamic, dynamic> yorum) {
  return container(
    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
    context,
    borderRadius: BorderRadius.circular(8),
    color: themeData.surfaceContainer,
    width: width * 0.7,
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        spacing: 10,
        children: [
          Row(
            spacing: 5,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Row(
                  spacing: 5,
                  children: [
                    CircleAvatar(),
                    customText(yorum['yorumName'], context,
                        weight: FontWeight.w400,
                        size: themeData.bodyMedium.fontSize),
                  ],
                ),
              ),
              container(context,
                  padding: EdgeInsets.all(2),
                  border: Border.all(
                      color:
                          HomeStyle(context: context).outline.withOpacity(0.2)),
                  isBoxShadow: false,
                  color: themeData.surfaceContainer,
                  child: Expanded(
                    child: Row(spacing: 5, children: [
                      customText(yorum['rating'].toString(), context),
                      buildRatingStars(yorum['rating'])
                    ]),
                  ),
                  width: 105)
            ],
          ),
          Expanded(
              child: customText('${yorum['yorum']}', context,
                  maxLines: 10,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  size: themeData.bodySmall.fontSize,
                  color: themeData.primary.withOpacity(0.6)))
        ],
      ),
    ),
  );
}
