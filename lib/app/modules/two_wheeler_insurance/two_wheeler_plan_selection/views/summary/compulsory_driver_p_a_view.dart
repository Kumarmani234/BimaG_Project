import 'package:bima_g/utility/colors.dart';
import 'package:bima_g/utility/ts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../module_controllers.dart';
import '../../../../../insurance_components/custom_PA_container_view.dart';

class CompulsoryDriverPAView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'compulsory_driver_pa'.tr,
              style: Ts.medium17(AppColors.secondaryColor),
            ),
            SizedBox(height: 4.h),
            Text.rich(
              TextSpan(
                text: 'Add compulsory owner-driver personal accident cover of',
                style: Ts.regular12(AppColors.grey4),
                children: [
                  TextSpan(
                    text: ' ₹15 lakhs',
                    style: Ts.regular12(AppColors.secondaryColor),
                    children: [
                      TextSpan(
                        text: ' form :',
                        style: Ts.regular12(AppColors.grey4),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 12.h),
            Obx(
              () => SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    twoWheelerPlanSelectionController.SummaryPAList.length,
                    (index) => Padding(
                      padding: EdgeInsets.only(right: 8.w),
                      child: PADriverGridView(
                        isSelected: twoWheelerPlanSelectionController
                            .SummaryPAList[index].isChecked,
                        title: twoWheelerPlanSelectionController
                            .SummaryPAList[index].title
                            .toString(),
                        price_text: twoWheelerPlanSelectionController
                            .SummaryPAList[index].price
                            .toString(),
                        onChecked: () {
                          twoWheelerPlanSelectionController.OnSummaryPAChange(
                              index);
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
