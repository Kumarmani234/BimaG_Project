import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../utility/colors.dart';
import '../../../../../../utility/ts.dart';

class CarInsuranceSummaryTopRowView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72.h,
      width: 375.w,
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16.w, top: 16.h, bottom: 16.h),
            child: Container(
              height: 40.h,
              width: 131.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4), color: Colors.amber),
              child: Image.asset('assets/pngs/select_plan.png'),
            ),
          ),
          SizedBox(
            width: 15.w,
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 17.h),
                child: SizedBox(
                  width: 96.36.w,
                  height: 18.h,
                  child: Text(
                    'IDV',
                    style: Ts.regular12(AppColors.grey4),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                width: 96.36.w,
                height: 18.h,
                child: Text(
                  '₹21,500',
                  textAlign: TextAlign.center,
                  style: Ts.bold14(AppColors.secondaryColor),
                ),
              ),
            ],
          ),
          SizedBox(width: 4.w),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 17.h),
                child: SizedBox(
                  width: 96.36.w,
                  height: 18.h,
                  child: Text(
                    'No claim bonus',
                    style: Ts.regular12(AppColors.grey4),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                width: 96.36.w,
                height: 18.h,
                child: Text(
                  'NA',
                  textAlign: TextAlign.center,
                  style: Ts.bold14(AppColors.secondaryColor),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
