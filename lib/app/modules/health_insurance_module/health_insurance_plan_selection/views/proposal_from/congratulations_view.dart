import 'package:bima_g/utility/colors.dart';
import 'package:bima_g/utility/ts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../insurance_appbar/views/insurance_appbar_view.dart';

class CongratulationsView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: InsuranceAppbarView(
          title: 'congratulations'.tr,
        ),
        preferredSize: Size.fromHeight(60.h),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 16.h, left: 16.w, right: 15.w),
        child: Container(
          height: 305.h,
          width: 344.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 80.w,
                width: 80.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.green,
                ),
                child: Icon(
                  Icons.done,
                  color: AppColors.white,
                  size: 50,
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                '₹14 Lakh',
                style: Ts.medium24(AppColors.green),
              ),
              SizedBox(height: 16.h),
              Text(
                'My Health Suraksha',
                style: Ts.medium17(AppColors.secondaryColor),
              ),
              SizedBox(height: 5.h),
              SizedBox(
                width: 262.w,
                height: 40.h,
                child: Text(
                  'success_insurance_processed'.tr,
                  style: Ts.regular15(AppColors.grey4),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 16.h),
              Container(
                height: 40.h,
                width: 196.w,
                decoration: BoxDecoration(
                  color: AppColors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Row(
                    children: [
                      SizedBox(width: 15.w),
                      SizedBox(
                        height: 20.h,
                        width: 148.w,
                        child: Text(
                          'download_receipt'.tr,
                          style: Ts.bold13(AppColors.green),
                        ),
                      ),
                      Icon(
                        Icons.description_outlined,
                        color: AppColors.green,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
