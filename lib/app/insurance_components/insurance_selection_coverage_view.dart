import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../utility/colors.dart';
import '../../utility/ts.dart';
import '../widgets/tooltip.dart';

class InsuranceSelectionCoverageView extends GetView {
  InsuranceSelectionCoverageView({
    required this.isChecked,
    required this.titleText,
    required this.priceText,
    this.timeText,
    required this.mandatoryText,
    this.onInfoIconTap,
    this.onCheck,
    this.index,
  });

  final RxBool isChecked;
  final String titleText;
  final String priceText;
  final timeText;
  final String mandatoryText;
  final onInfoIconTap;
  final onCheck;
  final index;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(
          () => Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Container(
              height: 20.h,
              width: 20.w,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.w),
                border: Border.all(
                  color: isChecked.value
                      ? AppColors.primaryColor
                      : AppColors.grey5,
                ),
                color: isChecked.value
                    ? AppColors.primaryColor
                    : Colors.transparent,
              ),
              child: InkWell(
                onTap: () {
                  if (index != 0) {
                    isChecked.value = !isChecked.value;
                  }
                },
                child: Center(
                  child: isChecked.value
                      ? Icon(
                          Icons.done,
                          color: Colors.white,
                          size: 16.sp,
                        )
                      : null,
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 12.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: Text(
                titleText,
                style: Ts.bold13(AppColors.black),
              ),
            ),
            index == 0
                ? Padding(
                    padding: EdgeInsets.only(top: 2.h, bottom: 8.h),
                    child: Text(
                      mandatoryText,
                      style: Ts.regular12(Colors.red),
                    ),
                  )
                : SizedBox(height: 8.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  priceText,
                  style: Ts.medium20(AppColors.secondaryColor),
                ),
                index == 0
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '/ ',
                            style: Ts.medium20(AppColors.secondaryColor),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 4.h),
                            child: Text(
                              timeText,
                              style: Ts.bold15(AppColors.secondaryColor),
                            ),
                          ),
                        ],
                      )
                    : SizedBox(),
              ],
            ),
          ],
        ),
        Spacer(),
        ToolTip(
          message: 'Covers damages to your vehicle only and not third-party',
          child: Container(
            height: 19.5.h,
            width: 19.5.w,
            child: Icon(
              Icons.info,
              color: AppColors.secondaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
