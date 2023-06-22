import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../utility/colors.dart';
import '../../../../../utility/ts.dart';
import '../../../insurance_appbar/views/insurance_appbar_view.dart';

class WithdrawelCongratulationsView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey1,
      appBar: PreferredSize(
        child: InsuranceAppbarView(
          title: 'congratulations'.tr,
        ),
        preferredSize: Size.fromHeight(60.h),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.white,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                child: Column(
                  children: [
                    SizedBox(height: 8.h),
                    Container(
                      height: 80.h,
                      width: 80.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.green,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.w),
                        child: Icon(
                          Icons.done,
                          color: AppColors.white,
                          size: 54.h,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      '₹6,560',
                      style: Ts.medium24(AppColors.green),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Withdrawal Request submitted',
                      style: Ts.medium17(AppColors.secondaryColor),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Congratulation your withdrawal request submitted successfully. It will take 3 to 4 days to credit in your bank account after verification.',
                      style: Ts.regular15(AppColors.grey4),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16.h),
                    SizedBox(
                      width: 196.w,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.green.withOpacity(0.1),
                            elevation: 0),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'download_receipt'.tr,
                              style: Ts.bold13(AppColors.green),
                            ),
                            Icon(
                              Icons.description_outlined,
                              color: AppColors.secondaryColor,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
