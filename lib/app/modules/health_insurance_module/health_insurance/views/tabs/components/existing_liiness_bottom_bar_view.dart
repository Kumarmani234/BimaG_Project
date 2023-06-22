import 'package:bima_g/app/modules/policy_quote_list/views/policy_quote_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../../utility/colors.dart';
import '../../../../../../../utility/styles.dart';
import '../../../../../../../utility/ts.dart';
import '../../../../../../widgets/buttons.dart';

class ExistingLillnessBottomBar extends GetView {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 108.h,
      width: 375.w,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          Styles.upperShadow(),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 83.5.w, top: 26.h),
            child: Material(
              color: Colors.transparent,
              child: Ink(
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Text(
                    'back'.tr,
                    style: Ts.regular15(AppColors.secondaryColor),
                  ),
                ),
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(top: 16.h, right: 15.w),
            child: Container(
              height: 40.h,
              width: 168.w,
              child: RoundSquareButtons.buttonEnabled(
                  onPressed: () {
                    Get.to(PolicyQuoteListView());
                  },
                  text: 'view_plans'.tr),
            ),
          )
        ],
      ),
    );
  }
}
