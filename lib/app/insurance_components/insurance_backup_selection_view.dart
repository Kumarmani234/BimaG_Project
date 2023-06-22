import 'package:bima_g/app/insurance_components/start_and_end_text_in_row_view.dart';
import 'package:bima_g/utility/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../utility/colors.dart';
import '../../utility/ts.dart';
import '../module_controllers.dart';

class InsuranceBackupView extends GetView {
  InsuranceBackupView({
    this.isShowAsSheet = true,
    this.isHaveDiscountCoupen = true,
    this.onSheetCloseIconTap,
  });

  final bool isShowAsSheet;
  final bool isHaveDiscountCoupen;
  final onSheetCloseIconTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isShowAsSheet ? 0.w : 16.w),
      child: Container(
        height: isHaveDiscountCoupen
            ? 305.h
            : isShowAsSheet
                ? 210.h
                : 190.h,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(isShowAsSheet ? 24.0.w : 8.0.w),
            topRight: Radius.circular(isShowAsSheet ? 24.0.w : 8.0.w),
            bottomLeft: Radius.circular(8.0.w),
            bottomRight: Radius.circular(8.0.w),
          ),
          boxShadow: [Styles.upperShadow()],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Premium Breakup',
                    style: Ts.medium17(AppColors.secondaryColor),
                  ),
                  Spacer(),
                  isShowAsSheet
                      ? IconButton(
                          onPressed: onSheetCloseIconTap,
                          icon: Icon(
                            Icons.cancel_outlined,
                            color: AppColors.grey5,
                          ),
                        )
                      : SizedBox(),
                ],
              ),
              isShowAsSheet
                  ? SizedBox(height: 8.h)
                  : isShowAsSheet
                      ? SizedBox()
                      : SizedBox(height: 16.h),
              Obx(
                () => ListView.separated(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: homeInsurancePlanSelectionController
                      .premiumBreakupList.length,
                  itemBuilder: (ctx, index) => StartToEndTextInRowView(
                    key_text: homeInsurancePlanSelectionController
                        .premiumBreakupList[index].keyText
                        .toString(),
                    value_text: homeInsurancePlanSelectionController
                        .premiumBreakupList[index].valueText
                        .toString(),
                  ),
                  separatorBuilder: (BuildContext context, int index) =>
                      Container(
                    height: 1.5.h,
                    width: 313.w,
                    color: AppColors.grey1,
                    margin: EdgeInsets.symmetric(vertical: 8.h),
                  ),
                ),
              ),
              isHaveDiscountCoupen ? SizedBox(height: 20.h) : SizedBox(),
              Visibility(
                visible: isHaveDiscountCoupen,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.green.withOpacity(0.1),
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.38.w, vertical: 10.h),
                      child: Row(
                        children: [
                          Container(
                            height: 18.h,
                            width: 17.25.w,
                            color: AppColors.green,
                            child: Icon(
                              Icons.percent,
                              color: AppColors.white,
                              size: 17,
                            ),
                          ),
                          SizedBox(width: 10.88.w),
                          Text(
                            'You\'re eligible for 5% discount ',
                            style: Ts.bold15(AppColors.green),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              isHaveDiscountCoupen ? SizedBox(height: 20.h) : SizedBox(),
              Visibility(
                visible: isHaveDiscountCoupen,
                child: StartToEndTextInRowView(
                  key_text: 'After Discount',
                  value_text: '₹1,121',
                  value_color: AppColors.green,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
