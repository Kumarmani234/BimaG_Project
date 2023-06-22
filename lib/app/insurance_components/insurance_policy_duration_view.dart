import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../utility/colors.dart';
import '../../utility/ts.dart';

class InsurancePolicyDurationView extends GetView {
  InsurancePolicyDurationView(
      {required this.isSelected,
      required this.time_text,
      required this.premimum_text,
      required this.price_text,
      this.onClick});

  final RxBool isSelected;
  final String time_text;
  final String premimum_text;
  final String price_text;
  final onClick;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.w),
          color: Colors.white,
          border: Border.all(
            color: isSelected.value ? AppColors.primaryColor : AppColors.grey2,
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: Ink(
            child: InkWell(
              onTap: onClick,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      time_text,
                      style: Ts.bold15(AppColors.grey5),
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 4.h),
                          child: Text(
                            premimum_text,
                            style: Ts.regular13(AppColors.grey4),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          price_text,
                          style: Ts.medium20(AppColors.secondaryColor),
                        ),
                        Spacer(),
                        Container(
                          height: 20.h,
                          width: 20.h,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isSelected.value
                                ? AppColors.primaryColor
                                : Colors.transparent,
                            border: Border.all(
                              color: isSelected.value
                                  ? AppColors.primaryColor
                                  : AppColors.grey4,
                            ),
                          ),
                          child: isSelected.value
                              ? InkWell(
                                  onTap: onClick,
                                  child: Icon(
                                    Icons.done,
                                    color: Colors.white,
                                    size: 15.h,
                                  ),
                                )
                              : null,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
