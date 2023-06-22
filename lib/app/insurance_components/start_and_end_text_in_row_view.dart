import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utility/colors.dart';
import '../../utility/ts.dart';

class StartToEndTextInRowView extends GetView {
  StartToEndTextInRowView({
    required this.key_text,
    required this.value_text,
    this.value_color,
  });

  final String key_text;
  final String value_text;
  final Color? value_color;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          key_text,
          style: Ts.regular15(AppColors.grey4),
        ),
        Spacer(),
        Padding(
          padding: EdgeInsets.only(right: 10.75.w),
          child: Text(
            value_text,
            style: Ts.bold13(value_color ?? AppColors.secondaryColor),
          ),
        )
      ],
    );
  }
}
