// ignore_for_file: deprecated_member_use

import 'package:bima_g/utility/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../../../utility/colors.dart';
import '../../../../../../utility/ts.dart';

class DocumentView extends GetView {
  DocumentView({
    required this.imageUrl,
    required this.documentType,
    required this.documentNo,
  });

  final String imageUrl;
  final String documentType;
  final String documentNo;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.w),
        color: AppColors.white,
        boxShadow: [
          Styles.shadow(),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        child: Row(
          children: [
            Container(
              height: 40.h,
              width: 40.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primaryColor.withOpacity(0.1),
              ),
              child: Center(
                child: SvgPicture.asset(
                  imageUrl,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    documentType,
                    style: Ts.regular12(AppColors.grey4),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    documentNo,
                    style: Ts.bold13(AppColors.secondaryColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
