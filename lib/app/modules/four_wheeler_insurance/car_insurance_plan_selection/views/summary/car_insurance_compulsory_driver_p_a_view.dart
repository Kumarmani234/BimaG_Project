import 'package:bima_g/utility/colors.dart';
import 'package:bima_g/utility/ts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../insurance_components/custom_PA_container_view.dart';
import '../../../../../module_controllers.dart';

class CarInsuranceCompulsoryDriverPAView extends GetView {
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
              'Compulsory Driver PA',
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
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    carInsurancePlanSelectionController.SummaryPAList.length,
                    (index) => Padding(
                      padding: EdgeInsets.only(right: 8.w),
                      child: PADriverGridView(
                        isSelected: carInsurancePlanSelectionController
                            .SummaryPAList[index].isChecked,
                        title: carInsurancePlanSelectionController
                            .SummaryPAList[index].title
                            .toString(),
                        price_text: carInsurancePlanSelectionController
                            .SummaryPAList[index].price
                            .toString(),
                        onChecked: () {
                          carInsurancePlanSelectionController.OnSummaryPAChange(
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
