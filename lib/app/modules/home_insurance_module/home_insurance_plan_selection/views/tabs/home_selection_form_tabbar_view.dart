// ignore_for_file: must_be_immutable

import 'package:bima_g/app/module_controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../utility/colors.dart';
import '../../../../../../utility/ts.dart';

class HomeSelectionFormTabbarView extends GetView {
  List<GlobalKey<FormState>> formKeys = [
    homeInsurancePlanSelectionController.PersionalDetailFormKey,
    homeInsurancePlanSelectionController.AddressDetailFormKey
  ];
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: 50.h,
        padding: EdgeInsets.only(top: 10.h),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemCount:
              homeInsurancePlanSelectionController.HomeProposalTabList.length,
          itemBuilder: (ctx, index) => InkWell(
            onTap: () {
              bool shouldSwitchTab = false;
              if (index <
                  homeInsurancePlanSelectionController.currentTabIndex.value) {
                // If user is clicking on a previous tab, switch to that tab
                shouldSwitchTab = true;
              } else {
                // Validate the form of the current tab
                switch (homeInsurancePlanSelectionController
                    .currentTabIndex.value) {
                  case 0:
                    shouldSwitchTab = homeInsurancePlanSelectionController
                        .PersionalDetailFormKey.currentState!
                        .validate();
                    break;
                  case 1:
                    shouldSwitchTab = homeInsurancePlanSelectionController
                        .AddressDetailFormKey.currentState!
                        .validate();
                    break;
                }
              }

              // If the form is valid or user clicked on a previous tab, switch tabs
              if (shouldSwitchTab) {
                // Update the active tab
                homeInsurancePlanSelectionController.currentTabIndex.value =
                    index;

                // Update the isActive status of all tabs
                for (int i = 0;
                    i <
                        homeInsurancePlanSelectionController
                            .HomeProposalTabList.length;
                    i++) {
                  homeInsurancePlanSelectionController
                      .HomeProposalTabList[i].isActive = i == index;
                }
              }
            },
            child: Container(
              height: 20.h,
              width: 167.5.w,
              margin: EdgeInsets.only(left: 16.w),
              child: Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            homeInsurancePlanSelectionController
                                .HomeProposalTabList[index].tabName,
                            style: Ts.medium13(
                              homeInsurancePlanSelectionController
                                      .HomeProposalTabList[index].isActive
                                  ? AppColors.secondaryColor
                                  : index <
                                          homeInsurancePlanSelectionController
                                              .currentTabIndex.value
                                      ? AppColors.green
                                      : AppColors.grey3,
                            ),
                          ),
                          Spacer(),
                          index <
                                  homeInsurancePlanSelectionController
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
                      color: homeInsurancePlanSelectionController
                              .HomeProposalTabList[index].isActive
                          ? AppColors.secondaryColor
                          : index <
                                  homeInsurancePlanSelectionController
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
