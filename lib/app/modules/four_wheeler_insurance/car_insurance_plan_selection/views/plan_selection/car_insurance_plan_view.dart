import 'package:bima_g/app/module_controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../utility/colors.dart';
import '../../../../../../utility/ts.dart';
import '../../../../../insurance_components/insurance_plan_selection_view.dart';

class CarInsurancePlanView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h, bottom: 8.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'insurance_plan'.tr,
              style: Ts.medium17(AppColors.secondaryColor),
            ),
            SizedBox(height: 8.h),
            Obx(
              () => ListView.separated(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount:
                    carInsurancePlanSelectionController.insurePlanList.length,
                itemBuilder: (ctx, index) => InsurancePlanSelectionView(
                  isSelected: RxBool(carInsurancePlanSelectionController
                      .insurePlanList[index].isSelected),
                  title_text: carInsurancePlanSelectionController
                      .insurePlanList[index].title
                      .toString(),
                  subtitle_text: carInsurancePlanSelectionController
                      .insurePlanList[index].subtitle
                      .toString(),
                  price_text: carInsurancePlanSelectionController
                      .insurePlanList[index].priceTime
                      .toString(),
                  onClick: () {
                    carInsurancePlanSelectionController
                        .onInsurePlanSelectionChange(index);
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
