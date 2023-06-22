import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../utility/colors.dart';
import '../../../../../utility/styles.dart';
import '../../../../../utility/ts.dart';

class GetHelpTopAreaview extends GetView {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [Styles.dropShadowZ100()],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 40.h,
                  width: 131.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    image: DecorationImage(
                      image: AssetImage('assets/pngs/select_plan.png'),
                    ),
                  ),
                ),
                SizedBox(width: 15.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'United india insurance',
                        style: Ts.bold14(AppColors.secondaryColor),
                      ),
                      Text(
                        'NCB Super Premium',
                        style: Ts.regular12(AppColors.grey4),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Container(
              height: 55.h,
              margin: EdgeInsets.all(3.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.w),
                  color: AppColors.primaryColor.withOpacity(0.1)),
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
              child: Row(
                children: [
                  //product
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'product'.tr,
                          style: Ts.regular11(AppColors.grey4),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          'Personal Accide...',
                          style: Ts.medium12(Colors.black),
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'sum_insured'.tr,
                          style: Ts.regular11(AppColors.grey4),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          '15.00 Lakhs',
                          style: Ts.medium12(Colors.black),
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'valid_till'.tr,
                          style: Ts.regular11(AppColors.grey4),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          'Jan 02, 2024',
                          style: Ts.medium12(Colors.black),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
