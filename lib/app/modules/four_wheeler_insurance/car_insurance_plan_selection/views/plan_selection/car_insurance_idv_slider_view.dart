import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../utility/colors.dart';
import '../../../../../../utility/ts.dart';
import '../../../../../module_controllers.dart';

class CarInsuranceIdvSliderView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 142.h,
      width: 344.w,
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 16.w, top: 16.h, right: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Insured Value (IDV)',
              style: Ts.medium17(AppColors.secondaryColor),
            ),
            SizedBox(height: 15.h),
            Row(
              children: [
                Obx(() => Text(
                      '₹${carInsurancePlanSelectionController.insuredValue.value}',
                      style: Ts.bold15(AppColors.primaryColor),
                    )),
                Expanded(
                  child: Obx(() => Slider(
                        min: 0,
                        max: 42670,
                        value: carInsurancePlanSelectionController
                            .insuredValue.value
                            .toDouble(),
                        onChanged: (double value) {
                          carInsurancePlanSelectionController
                              .insuredValue.value = value.round();
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
                  '₹${carInsurancePlanSelectionController.insuredValue.value}',
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
