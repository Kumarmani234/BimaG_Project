import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../utility/colors.dart';
import '../../../../../../utility/ts.dart';
import '../../../../../module_controllers.dart';

class HealthInsuranceTabbarView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      padding: EdgeInsets.only(top: 16.h),
      child: Obx(
        () => ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: healthInsuranceController.tabsForComparePlan.length,
          itemBuilder: (ctx, index) => InkWell(
            // onTap: () {
            //   for (int i = 0;
            //   i < healthInsuranceController.tabsForComparePlan.length;
            //   i++) {
            //     healthInsuranceController.tabsForComparePlan[i].isActive = false;
            //   }
            //   healthInsuranceController.tabsForComparePlan[index].isActive = true;
            //   healthInsuranceController.currentTabIndex.value = index;
            //   healthInsuranceController.tabsForComparePlan.refresh();
            // },
            child: Container(
              height: 20.h,
              width: 130.w,
              margin: EdgeInsets.only(left: 16.w),
              child: Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            healthInsuranceController
                                .tabsForComparePlan[index].tabName,
                            style: Ts.medium13(
                              healthInsuranceController
                                      .tabsForComparePlan[index].isActive
                                  ? AppColors.secondaryColor
                                  : index <
                                          healthInsuranceController
                                              .currentTabIndex.value
                                      ? AppColors.green
                                      : AppColors.grey3,
                            ),
                          ),
                          Spacer(),
                          index <
                                  healthInsuranceController
                                      .currentTabIndex.value
                              ? Icon(
                                  Icons.check_circle_outline,
                                  color: AppColors.green,
                                  size: 20,
                                )
                              : SizedBox(),
                        ],
                      ),
                    ),
                    Container(
                      height: 2.h,
                      color: healthInsuranceController
                              .tabsForComparePlan[index].isActive
                          ? AppColors.secondaryColor
                          : index <
                                  healthInsuranceController
                                      .currentTabIndex.value
                              ? AppColors.green
                              : AppColors.grey3,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
