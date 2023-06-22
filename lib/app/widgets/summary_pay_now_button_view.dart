import 'package:bima_g/utility/colors.dart';
import 'package:bima_g/utility/ts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'buttons.dart';

class summary_pay_now_button extends GetView {
  final bool isIcon;
  final isIconToggle;
  final widget;
  final String price_text;
  final String price;
  final String btn_text;
  final VoidCallback onPressed;
  final onPremimunIconTap;

  summary_pay_now_button({
    this.isIcon = false,
    this.isIconToggle,
    this.widget,
    required this.onPressed,
    required this.price_text,
    required this.price,
    required this.btn_text,
    this.onPremimunIconTap,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      height: 90.h,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(left: 16.w, top: 11.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  price_text,
                  style: Ts.regular12(AppColors.grey5),
                ),
                SizedBox(height: 5.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 32.h,
                      width: 75.w,
                      child: Text(
                        price,
                        style: Ts.medium24(AppColors.secondaryColor),
                      ),
                    ),
                    isIcon
                        ? InkWell(
                            onTap: onPremimunIconTap,
                            child: widget,
                          )
                        : SizedBox(),
                  ],
                ),
              ],
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(right: 15.w),
              child: SizedBox(
                height: 58.h,
                width: 164.w,
                child: RoundSquareButtons.buttonEnabled(
                  onPressed: onPressed,
                  text: btn_text,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
