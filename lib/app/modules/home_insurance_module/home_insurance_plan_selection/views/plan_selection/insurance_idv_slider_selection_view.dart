import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../utility/colors.dart';
import '../../../../../../utility/ts.dart';
import '../../../../../module_controllers.dart';

class HomeInsuranceIdvSliderView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Insurance Cover',
              style: Ts.medium17(AppColors.secondaryColor),
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                Obx(() => Text(
                      '₹${homeInsurancePlanSelectionController.insuredValue.value}' +
                          ' lakh',
                      style: Ts.bold15(AppColors.secondaryColor),
                    )),
                Expanded(
                  child: Obx(
                    () => Slider(
                      min: 60,
                      max: 80,
                      value: homeInsurancePlanSelectionController
                          .insuredValue.value
                          .clamp(60, 80)
                          .toDouble(),
                      onChanged: (double value) {
                        homeInsurancePlanSelectionController
                            .insuredValue.value = value.round();
                      },
                    ),
                  ),
                ),
                Text(
                  '₹80 lakh',
                  style: Ts.bold15(AppColors.black),
                ),
              ],
            ),
            Center(
              child: Obx(
                () => Text(
                  '₹${homeInsurancePlanSelectionController.insuredValue.value}' +
                      ' lakh',
                  style: Ts.medium24(AppColors.primaryColor),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
