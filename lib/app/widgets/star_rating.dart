// ignore_for_file: deprecated_member_use, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef void RatingChangeCallback(double rating);

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating, spacing;
  final RatingChangeCallback onRatingChanged;
  final Color? color;
  final double? starSize;

  StarRating(
      {this.starCount = 5,
      this.rating = .0,
      this.spacing = 0.0,
      required this.onRatingChanged,
      this.color,
      this.starSize});

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = new Icon(
        Icons.star_border,
        size: starSize ?? 20,
        color: Theme.of(context).buttonColor,
      );
    } else if (index > rating - 1 && index < rating) {
      icon = new Icon(
        Icons.star_half,
        size: starSize ?? 20,
        color: color ?? Theme.of(context).primaryColor,
      );
    } else {
      icon = new Icon(
        Icons.star,
        size: starSize ?? 20,
        color: color ?? Theme.of(context).primaryColor,
      );
    }
    return new InkResponse(
      onTap:
          onRatingChanged == null ? null : () => onRatingChanged(index + 1.0),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
        children: new List.generate(
            starCount,
            (index) => Padding(
                  padding: EdgeInsets.only(
                      right: spacing.w / 2, left: spacing.w / 2),
                  child: buildStar(context, index),
                )));
  }
}
