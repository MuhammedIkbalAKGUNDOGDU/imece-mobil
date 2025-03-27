import 'package:flutter/material.dart';
import 'package:imecehub/screens/home/style/home_screen_style.dart';

BoxShadow boxShadow(
  BuildContext context, {
  Color? color,
  Offset? offset,
  double? blurRadius,
}) {
  return BoxShadow(
    color: color ??
        HomeStyle(context: context)
            .shadow
            .withOpacity(0.3), // Gölgenin rengi ve opaklığı
    offset: offset ?? Offset(0, 2), // Yalnızca alt yönde 4 piksel kaydırma
    blurRadius: blurRadius ?? 6, // Bulanıklık değeri
  );
}
