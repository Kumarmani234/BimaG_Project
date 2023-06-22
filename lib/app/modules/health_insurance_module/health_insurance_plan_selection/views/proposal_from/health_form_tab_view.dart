import 'package:bima_g/app/module_controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../../../utility/colors.dart';
import '../../../../../../utility/ts.dart';

class HealthFormTabView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: 50.h,
        padding: EdgeInsets.only(top: 10.h),
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: healthInsurancePlanSelectionController.healthTabs.length,
          itemBuilder: (ctx, index) => InkWell(
            onTap: () {
              bool shouldSwitchTab = false;
              if (index <
                  healthInsurancePlanSelectionController
                      .currentTabIndex.value) {
                // If user is clicking on a previous tab, switch to that tab
                shouldSwitchTab = true;
              } else {
                // Validate the form of the current tab
                switch (healthInsurancePlanSelectionController
                    .currentTabIndex.value) {
                  case 0:
                    shouldSwitchTab = healthInsurancePlanSelectionController
                        .proposerTabFormkey.currentState!
                        .validate();
                    break;
                  case 1:
                    shouldSwitchTab = healthInsurancePlanSelectionController
                        .membersTabFormkey.currentState!
                        .validate();
                    break;
                  case 2:
                    shouldSwitchTab = healthInsurancePlanSelectionController
                        .medicalTabFormkey.currentState!
                        .validate();
                    break;
                  case 3:
                    shouldSwitchTab = healthInsurancePlanSelectionController
                        .nomineeTabFormkey.currentState!
                        .validate();
                    break;
                }
              }

              // If the form is valid or user clicked on a previous tab, switch tabs
              if (shouldSwitchTab) {
                // Update the active tab
                healthInsurancePlanSelectionController.currentTabIndex.value =
                    index;

                // Update the isActive status of all tabs
                for (int i = 0;
                    i <
                        healthInsurancePlanSelectionController
                            .healthTabs.length;
                    i++) {
                  healthInsurancePlanSelectionController
                      .healthTabs[i].isActive = i == index;
                }
              }
            },
            child: Container(
              height: 20.h,
              width: 79.75.w,
              margin: EdgeInsets.only(left: 16.w),
              child: Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            healthInsurancePlanSelectionController
                                .healthTabs[index].tabName,
                            style: Ts.medium13(
                              healthInsurancePlanSelectionController
                                      .healthTabs[index].isActive
                                  ? AppColors.secondaryColor
                                  : index <
                                          healthInsurancePlanSelectionController
                                              .currentTabIndex.value
                                      ? AppColors.green
                                      : AppColors.grey3,
                            ),
                          ),
                          Spacer(),
                          index <
                                  healthInsurancePlanSelectionController
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
                      color: healthInsurancePlanSelectionController
                              .healthTabs[index].isActive
                          ? AppColors.secondaryColor
                          : index <
                                  healthInsurancePlanSelectionController
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
