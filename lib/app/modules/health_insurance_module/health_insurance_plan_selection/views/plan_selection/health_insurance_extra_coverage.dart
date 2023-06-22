import 'package:bima_g/app/module_controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../utility/colors.dart';
import '../../../../../../utility/ts.dart';
import '../../../../../insurance_components/insurance_selection_coverage_view.dart';

class HealthInsuranceExtraCoverageView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Text(
              'Add Extra Coverage',
              style: Ts.medium17(AppColors.secondaryColor),
            ),
          ),
          Obx(
            () => ListView.separated(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              itemCount: healthInsurancePlanSelectionController
                  .extraCoverageList.length,
              itemBuilder: (ctx, index) => InsuranceSelectionCoverageView(
                index: index,
                isChecked: RxBool(healthInsurancePlanSelectionController
                    .extraCoverageList[index].isChecked),
                titleText: healthInsurancePlanSelectionController
                    .extraCoverageList[index].title
                    .toString(),
                timeText: healthInsurancePlanSelectionController
                    .extraCoverageList[index].time
                    .toString(),
                priceText: healthInsurancePlanSelectionController
                    .extraCoverageList[index].price
                    .toString(),
                mandatoryText: healthInsurancePlanSelectionController
                    .extraCoverageList[index].mandatoryText,
              ),
              separatorBuilder: (BuildContext context, int index) =>
                  SizedBox(height: 16.h),
            ),
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
