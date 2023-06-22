import 'package:bima_g/utility/colors.dart';
import 'package:bima_g/utility/ts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

class DetailsFieldView extends GetView {
  DetailsFieldView({required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: 343.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border:
            Border.all(color: text.isEmpty ? AppColors.grey5 : AppColors.green),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                text,
                style: Ts.medium15(AppColors.secondaryColor),
              ),
            ),
            Spacer(),
            text.isNotEmpty
                ? Center(
                    child: Container(
                      height: 23.h,
                      width: 23.h,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.green,
                          width: 1.5.w,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.check,
                        size: 19.h,
                        color: AppColors.green,
                      ),
                    ),
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }
}
