import 'package:bima_g/app/module_controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../utility/colors.dart';
import '../../../../../../utility/ts.dart';
import '../../../../../insurance_components/insurance_selection_coverage_view.dart';

class ExtraCoverageView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
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
              'add_extra_coverage'.tr,
              style: Ts.medium17(AppColors.secondaryColor),
            ),
            SizedBox(height: 16.h),
            Obx(
              () => ListView.separated(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount:
                    twoWheelerPlanSelectionController.extraCoverageList.length,
                itemBuilder: (ctx, index) => InsuranceSelectionCoverageView(
                  index: index,
                  isChecked: RxBool(twoWheelerPlanSelectionController
                      .extraCoverageList[index].isChecked),
                  titleText: twoWheelerPlanSelectionController
                      .extraCoverageList[index].title
                      .toString(),
                  timeText: twoWheelerPlanSelectionController
                      .extraCoverageList[index].time
                      .toString(),
                  priceText: twoWheelerPlanSelectionController
                      .extraCoverageList[index].price
                      .toString(),
                  mandatoryText: twoWheelerPlanSelectionController
                      .extraCoverageList[index].mandatoryText
                      .toString(),
                  onCheck: () {
                    if (twoWheelerPlanSelectionController
                            .extraCoverageList[index] !=
                        0) {
                      twoWheelerPlanSelectionController
                              .extraCoverageList[index].isChecked !=
                          twoWheelerPlanSelectionController
                              .extraCoverageList[index].isChecked;
                    }
                  },
                ),
                separatorBuilder: (BuildContext context, int index) =>
                    SizedBox(height: 8.h),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
