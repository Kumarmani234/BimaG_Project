// ignore_for_file: must_be_immutable

import 'package:bima_g/app/module_controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../utility/colors.dart';
import '../../../../../../utility/ts.dart';
import '../../../../../insurance_components/insurance_policy_duration_view.dart';

class PolicyDurationView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8.w),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'policy_duration'.tr,
              style: Ts.medium17(AppColors.secondaryColor),
            ),
            SizedBox(height: 8.h),
            Obx(
              () => ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount:
                    twoWheelerPlanSelectionController.policydurationList.length,
                itemBuilder: (ctx, index) => InsurancePolicyDurationView(
                  isSelected: RxBool(twoWheelerPlanSelectionController
                      .policydurationList[index].isSelected),
                  time_text: twoWheelerPlanSelectionController
                      .policydurationList[index].time
                      .toString(),
                  premimum_text: twoWheelerPlanSelectionController
                      .policydurationList[index].premium
                      .toString(),
                  price_text: twoWheelerPlanSelectionController
                      .policydurationList[index].price
                      .toString(),
                  onClick: () {
                    twoWheelerPlanSelectionController
                        .onPolicyDurationChange(index);
                  },
                ),
                separatorBuilder: (BuildContext context, int index) =>
                    SizedBox(height: 16.h),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
