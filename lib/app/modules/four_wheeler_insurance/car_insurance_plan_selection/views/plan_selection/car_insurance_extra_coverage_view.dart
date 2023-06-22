import 'package:bima_g/app/module_controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../utility/colors.dart';
import '../../../../../../utility/ts.dart';
import '../../../../../insurance_components/insurance_selection_coverage_view.dart';

class CarInsuranceExtraCoverageView extends GetView {
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
              'Add Extra Coverage',
              style: Ts.medium17(AppColors.secondaryColor),
            ),
            SizedBox(height: 16.h),
            Obx(
              () => ListView.separated(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: carInsurancePlanSelectionController
                    .extraCoverageList.length,
                itemBuilder: (ctx, index) => InsuranceSelectionCoverageView(
                  index: index,
                  isChecked: RxBool(carInsurancePlanSelectionController
                      .extraCoverageList[index].isChecked),
                  titleText: carInsurancePlanSelectionController
                      .extraCoverageList[index].title
                      .toString(),
                  timeText: carInsurancePlanSelectionController
                      .extraCoverageList[index].time
                      .toString(),
                  priceText: carInsurancePlanSelectionController
                      .extraCoverageList[index].price
                      .toString(),
                  mandatoryText: carInsurancePlanSelectionController
                      .extraCoverageList[index].mandatoryText
                      .toString(),
                  onCheck: () {
                    if (carInsurancePlanSelectionController
                            .extraCoverageList[index] !=
                        0) {
                      carInsurancePlanSelectionController
                              .extraCoverageList[index].isChecked !=
                          carInsurancePlanSelectionController
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
