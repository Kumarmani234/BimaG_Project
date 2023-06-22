// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../utility/colors.dart';
import '../../utility/ts.dart';

class CommissionDetailWidget extends StatelessWidget {
  CommissionDetailWidget({
    required this.title,
    required this.subtitle,
    required this.suffixText,
    required this.imgpath,
    this.status,
    this.onTap,
  });

  final String title;
  final String subtitle;
  final String suffixText;
  final String imgpath;
  final onTap;
  final status;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.w),
        color: AppColors.white,
      ),
      child: Material(
        color: Colors.transparent,
        child: Ink(
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Row(
                children: [
                  Container(
                    height: 36.h,
                    width: 36.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: fetchColor().withOpacity(0.1),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        imgpath,
                        color: fetchColor(),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: Ts.regular11(AppColors.grey4),
                        ),
                        Text(
                          subtitle,
                          style: Ts.regular12(AppColors.secondaryColor),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    suffixText,
                    style: Ts.medium17(fetchColor()),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color fetchColor() {
    if (status == 0) {
      return AppColors.primaryColor; //total
    }

    if (status == 1) {
      return AppColors.green; //success or earned
    }

    if (status == 2) {
      return AppColors.warningColor; //pending
    }

    if (status == 3) {
      return AppColors.red; // failed
    }
    return AppColors.primaryColor;
  }
}
