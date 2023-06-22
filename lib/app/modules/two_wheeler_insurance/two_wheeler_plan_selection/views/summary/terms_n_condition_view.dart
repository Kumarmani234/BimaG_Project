import 'package:bima_g/utility/colors.dart';
import 'package:bima_g/utility/ts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../custom_components/single_radio_view.dart';

class TermsNConditionView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      margin: EdgeInsets.symmetric(horizontal: 16.h, vertical: 8.h),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 8.h),
          child: Row(
            children: [
              SingleRadioView(isClicked: RxBool(true), isCircle: RxBool(false)),
              SizedBox(width: 10.w),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: 'i_agree_to_your'.tr + " ",
                          style: Ts.regular13(AppColors.secondaryColor)),
                      TextSpan(
                        text: 'terms_n_condition'.tr,
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline),
                      ),
                      TextSpan(
                          text: ' ' + '&' + ' ',
                          style: Ts.regular13(AppColors.secondaryColor)),
                      TextSpan(
                        text: 'privacy_policy'.tr,
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline),
                      ),
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
