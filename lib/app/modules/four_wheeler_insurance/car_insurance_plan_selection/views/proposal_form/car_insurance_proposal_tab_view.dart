// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../utility/colors.dart';
import '../../../../../../utility/ts.dart';
import '../../../../../module_controllers.dart';

class CarInsuranceProposalTabView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: 50.h,
        padding: EdgeInsets.only(top: 10.h),
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: carInsurancePlanSelectionController.tabsForProposal.length,
          itemBuilder: (ctx, index) => InkWell(
            onTap: () {
              bool shouldSwitchTab = false;
              if (index <
                  carInsurancePlanSelectionController.currentTabIndex.value) {
                // If user is clicking on a previous tab, switch to that tab
                shouldSwitchTab = true;
              } else {
                // Validate the form of the current tab
                switch (
                    carInsurancePlanSelectionController.currentTabIndex.value) {
                  case 0:
                    shouldSwitchTab = carInsurancePlanSelectionController
                        .ownerTabFormkey.currentState!
                        .validate();
                    break;
                  case 1:
                    shouldSwitchTab = carInsurancePlanSelectionController
                        .nomineeTabFormkey.currentState!
                        .validate();
                    break;
                  case 2:
                    shouldSwitchTab = carInsurancePlanSelectionController
                        .vehicleTabFormkey.currentState!
                        .validate();
                    break;
                }
              }

              // If the form is valid or user clicked on a previous tab, switch tabs
              if (shouldSwitchTab) {
                // Update the active tab
                carInsurancePlanSelectionController.currentTabIndex.value =
                    index;

                // Update the isActive status of all tabs
                for (int i = 0;
                    i <
                        carInsurancePlanSelectionController
                            .tabsForProposal.length;
                    i++) {
                  carInsurancePlanSelectionController
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
                            carInsurancePlanSelectionController
                                .tabsForProposal[index].tabName,
                            style: Ts.medium13(
                              carInsurancePlanSelectionController
                                      .tabsForProposal[index].isActive
                                  ? AppColors.secondaryColor
                                  : index <
                                          carInsurancePlanSelectionController
                                              .currentTabIndex.value
                                      ? AppColors.green
                                      : AppColors.grey3,
                            ),
                          ),
                          Spacer(),
                          index <
                                  carInsurancePlanSelectionController
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
                      color: carInsurancePlanSelectionController
                              .tabsForProposal[index].isActive
                          ? AppColors.secondaryColor
                          : index <
                                  carInsurancePlanSelectionController
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
