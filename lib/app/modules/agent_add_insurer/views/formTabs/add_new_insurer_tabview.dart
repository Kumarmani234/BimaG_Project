// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../../../utility/colors.dart';
import '../../../../../utility/ts.dart';
import '../../../../module_controllers.dart';

class AddInsurerFormTabbarView extends GetView {
  List<GlobalKey<FormState>> formKeys = [
    agentAddInsurerController.personalInfoFormKey,
    agentAddInsurerController.documentFormKey
  ];
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: 40.h,
        padding: EdgeInsets.only(top: 10.h),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemCount: agentAddInsurerController.TabList.length,
          itemBuilder: (ctx, index) => InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              bool shouldSwitchTab = false;
              if (index < agentAddInsurerController.currentTabIndex.value) {
                // If user is clicking on a previous tab, switch to that tab
                shouldSwitchTab = true;
              } else {
                // Validate the form of the current tab
                switch (agentAddInsurerController.currentTabIndex.value) {
                  case 0:
                    shouldSwitchTab = agentAddInsurerController
                        .personalInfoFormKey.currentState!
                        .validate();
                    break;
                  case 1:
                    shouldSwitchTab = agentAddInsurerController
                        .documentFormKey.currentState!
                        .validate();
                    break;
                }
              }

              // If the form is valid or user clicked on a previous tab, switch tabs
              if (shouldSwitchTab) {
                // Update the active tab
                agentAddInsurerController.currentTabIndex.value = index;

                // Update the isActive status of all tabs
                for (int i = 0;
                    i < agentAddInsurerController.TabList.length;
                    i++) {
                  agentAddInsurerController.TabList[i].isActive = i == index;
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
                            agentAddInsurerController.TabList[index].tabName,
                            style: Ts.medium13(
                              agentAddInsurerController.TabList[index].isActive
                                  ? AppColors.secondaryColor
                                  : index <
                                          agentAddInsurerController
                                              .currentTabIndex.value
                                      ? AppColors.green
                                      : AppColors.grey3,
                            ),
                          ),
                          Spacer(),
                          index <
                                  agentAddInsurerController
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
                      color: agentAddInsurerController.TabList[index].isActive
                          ? AppColors.secondaryColor
                          : index <
                                  agentAddInsurerController
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
