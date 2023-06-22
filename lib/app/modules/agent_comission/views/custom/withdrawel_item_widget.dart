import 'package:bima_g/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../utility/ts.dart';

class withdrawel_item_widget extends StatelessWidget {
  withdrawel_item_widget({
    this.image,
    this.onClick,
    this.isSelected,
    required this.title,
    required this.subtitle,
  });

  final image;
  final onClick;
  final bool? isSelected;
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.w),
        border: Border.all(color: AppColors.grey1),
      ),
      child: Padding(
        padding:
            EdgeInsets.only(left: 10.w, top: 8.h, bottom: 8.h, right: 10.w),
        child: Row(
          children: [
            // image,
            Image.asset(image),
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Ts.regular11(AppColors.grey5),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    subtitle,
                    style: Ts.bold13(AppColors.grey5),
                  ),
                ],
              ),
            ),
            Container(
              height: 20.w,
              width: 20.w,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color:
                    isSelected! ? AppColors.primaryColor : Colors.transparent,
                border: Border.all(
                    color:
                        isSelected! ? AppColors.primaryColor : AppColors.grey4),
                shape: BoxShape.circle,
              ),
              child: InkWell(
                onTap: onClick,
                child: isSelected!
                    ? Icon(
                        Icons.done,
                        color: Colors.white,
                        size: 18.h,
                      )
                    : null,
              ),
            )
          ],
        ),
      ),
    );
  }
}
