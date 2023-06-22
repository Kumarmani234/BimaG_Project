// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../utility/colors.dart';
import '../../../../../../utility/ts.dart';
import '../../../../../module_controllers.dart';

class ProposalTabView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: 50.h,
        padding: EdgeInsets.only(top: 10.h),
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: twoWheelerPlanSelectionController.tabsForProposal.length,
          itemBuilder: (ctx, index) => InkWell(
            onTap: () {
              bool shouldSwitchTab = false;
              if (index <
                  twoWheelerPlanSelectionController.currentTabIndex.value) {
                // If user is clicking on a previous tab, switch to that tab
                shouldSwitchTab = true;
              } else {
                // Validate the form of the current tab
                switch (
                    twoWheelerPlanSelectionController.currentTabIndex.value) {
                  case 0:
                    shouldSwitchTab = twoWheelerPlanSelectionController
                        .ownerTabFormkey.currentState!
                        .validate();
                    break;
                  case 1:
                    shouldSwitchTab = twoWheelerPlanSelectionController
                        .nomineeTabFormkey.currentState!
                        .validate();
                    break;
                  case 2:
                    shouldSwitchTab = twoWheelerPlanSelectionController
                        .vehicleTabFormkey.currentState!
                        .validate();
                    break;
                }
              }

              // If the form is valid or user clicked on a previous tab, switch tabs
              if (shouldSwitchTab) {
                // Update the active tab
                twoWheelerPlanSelectionController.currentTabIndex.value = index;

                // Update the isActive status of all tabs
                for (int i = 0;
                    i <
                        twoWheelerPlanSelectionController
                            .tabsForProposal.length;
                    i++) {
                  twoWheelerPlanSelectionController
                      .tabsForProposal[i].isActive = i == index;
                }
              }
            },
            child: Container(
              height: 35.h,
              width: 140.w,
              margin: EdgeInsets.only(left: 15.w),
              child: Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            twoWheelerPlanSelectionController
                                .tabsForProposal[index].tabName,
                            style: Ts.medium13(
                              twoWheelerPlanSelectionController
                                      .tabsForProposal[index].isActive
                                  ? AppColors.secondaryColor
                                  : index <
                                          twoWheelerPlanSelectionController
                                              .currentTabIndex.value
                                      ? AppColors.green
                                      : AppColors.grey3,
                            ),
                          ),
                          Spacer(),
                          index <
                                  twoWheelerPlanSelectionController
                                      .currentTabIndex.value
                              ? Icon(
                                  Icons.check_circle_outline,
                                  color: AppColors.green,
                                )
                              : SizedBox(),
                        ],
                      ),
                    ),
                    Container(
                      height: 2.h,
                      color: twoWheelerPlanSelectionController
                              .tabsForProposal[index].isActive
                          ? AppColors.secondaryColor
                          : index <
                                  twoWheelerPlanSelectionController
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
