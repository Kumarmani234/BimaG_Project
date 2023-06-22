import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../../../utility/colors.dart';

class SingleRadioView extends GetView {
  final RxBool isClicked;
  final RxBool isCircle;
  SingleRadioView({required this.isClicked, required this.isCircle});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Padding(
          padding: EdgeInsets.only(right: 11.19.w),
          child: Material(
            child: Ink(
              child: InkWell(
                onTap: () {
                  isClicked.value = !isClicked.value;
                },
                child: Container(
                  height: 20.h,
                  width: 20.w,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(isCircle.value ? 25 : 4.w),
                    border: Border.all(
                      color: isClicked.value
                          ? AppColors.primaryColor
                          : AppColors.grey5,
                    ),
                    color: isClicked.value
                        ? AppColors.primaryColor
                        : Colors.transparent,
                  ),
                  child: isClicked.value
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
        );
      },
    );
  }
}
