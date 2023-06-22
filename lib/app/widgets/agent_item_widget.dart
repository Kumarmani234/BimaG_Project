import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../utility/colors.dart';
import '../../utility/ts.dart';

class AgentItemWidget extends StatelessWidget {
  AgentItemWidget(
      {this.width,
      required this.imgUrl,
      required this.title,
      required this.subtitle,
      this.status,
      this.onTap,
      this.color,
      this.height});

  final double? width;
  final String title;
  final String subtitle;
  final String imgUrl;
  final status;
  final height;
  final onTap;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? Get.width / 2 - 20,
      height: height,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: color ?? AppColors.white,
        borderRadius: BorderRadius.circular(8.w),
      ),
      child: Material(
        color: Colors.transparent,
        child: Ink(
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
              child: Row(
                children: [
                  SvgPicture.asset(imgUrl),
                  SizedBox(width: 10.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          style: Ts.medium17(
                            fetchColor(),
                          )),
                      SizedBox(height: 4.h),
                      Text(
                        subtitle,
                        style: Ts.regular15(AppColors.grey4),
                      )
                    ],
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
