import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../utility/colors.dart';
import '../../../../../../utility/ts.dart';
import '../../../../../module_controllers.dart';

class IdvSliderView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.w),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'insured_value_idv'.tr,
              style: Ts.medium17(AppColors.secondaryColor),
            ),
            SizedBox(height: 15.h),
            Row(
              children: [
                Obx(
                  () => Text(
                    '₹${twoWheelerPlanSelectionController.insuredValue.value}',
                    style: Ts.bold15(AppColors.primaryColor),
                  ),
                ),
                Expanded(
                  child: Obx(() => Slider(
                        min: 0,
                        max: 42670,
                        value: twoWheelerPlanSelectionController
                            .insuredValue.value
                            .toDouble(),
                        onChanged: (double value) {
                          twoWheelerPlanSelectionController.insuredValue.value =
                              value.round();
                        },
                      )),
                ),
                Text(
                  '₹42,670',
                  style: Ts.bold15(AppColors.black),
                ),
              ],
            ),
            Center(
              child: Obx(
                () => Text(
                  '₹${twoWheelerPlanSelectionController.insuredValue.value}',
                  style: Ts.medium24(AppColors.primaryColorMaterial),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
