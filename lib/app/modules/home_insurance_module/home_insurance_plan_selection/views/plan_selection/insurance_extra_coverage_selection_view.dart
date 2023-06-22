import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../../../utility/colors.dart';
import '../../../../../../utility/ts.dart';
import '../../../../../module_controllers.dart';
import '../../../../../insurance_components/insurance_selection_coverage_view.dart';

class HomeInsuranceExtraCoverageView extends GetView {
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
              itemCount:
                  homeInsurancePlanSelectionController.extraCoverageList.length,
              itemBuilder: (ctx, index) => InsuranceSelectionCoverageView(
                index: index,
                isChecked: RxBool(homeInsurancePlanSelectionController
                    .extraCoverageList[index].isChecked),
                titleText: homeInsurancePlanSelectionController
                    .extraCoverageList[index].title
                    .toString(),
                timeText: homeInsurancePlanSelectionController
                    .extraCoverageList[index].time
                    .toString(),
                priceText: homeInsurancePlanSelectionController
                    .extraCoverageList[index].price
                    .toString(),
                mandatoryText: homeInsurancePlanSelectionController
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
