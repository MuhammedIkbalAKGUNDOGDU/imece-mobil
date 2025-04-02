import 'package:flutter/material.dart';

Widget buildRatingStars(double rating) {
  List<Widget> stars = [];
  int fullStars = rating.floor();
  bool hasHalfStar = (rating - fullStars) >= 0.5;

  for (int i = 0; i < 5; i++) {
    if (i < fullStars) {
      stars.add(const Icon(Icons.star, color: Colors.orange, size: 20));
    } else if (i == fullStars && hasHalfStar) {
      stars.add(const Icon(Icons.star_half, color: Colors.orange, size: 20));
    } else {
      stars.add(const Icon(Icons.star_border, color: Colors.orange, size: 20));
    }
  }
  return Row(children: stars);
}
