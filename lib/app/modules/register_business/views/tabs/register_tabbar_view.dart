import 'package:bima_g/app/module_controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../../../utility/colors.dart';
import '../../../../../../utility/ts.dart';

class RegisterTabarView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: 36.h,
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadiusDirectional.circular(8.w)),
        padding: EdgeInsets.only(top: 10.h),
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: registerBusinessController.RegBusinessTabsList.length,
          itemBuilder: (ctx, index) => InkWell(
            onTap: () {
              bool shouldSwitchTab = false;
              if (index < registerBusinessController.currentTabIndex.value) {
                // If user is clicking on a previous tab, switch to that tab
                shouldSwitchTab = true;
              } else {
                // Validate the form of the current tab
                switch (registerBusinessController.currentTabIndex.value) {
                  case 0:
                    shouldSwitchTab = registerBusinessController
                        .personalInfoKey.currentState!
                        .validate();
                    break;
                  case 1:
                    shouldSwitchTab = true;
                    break;
                  case 2:
                    // shouldSwitchTab = registerBusinessController
                    //     .businessInfoKey.currentState!
                    //     .validate();
                    shouldSwitchTab = true;
                    break;
                  case 3:
                    shouldSwitchTab = registerBusinessController
                        .bankDetailsKey.currentState!
                        .validate();
                    break;
                  case 4:
                    shouldSwitchTab = registerBusinessController
                        .documentsKey.currentState!
                        .validate();
                    break;
                }
              }

              // If the form is valid or user clicked on a previous tab, switch tabs
              if (shouldSwitchTab) {
                // Update the active tab
                registerBusinessController.currentTabIndex.value = index;

                // Update the isActive status of all tabs
                for (int i = 0;
                    i < registerBusinessController.RegBusinessTabsList.length;
                    i++) {
                  registerBusinessController.RegBusinessTabsList[i].isActive =
                      i == index;
                }
              }
            },
            child: Container(
              height: 20.h,
              width: 130.w,
              margin: EdgeInsets.only(left: 8.w),
              child: Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            registerBusinessController
                                .RegBusinessTabsList[index].tabName,
                            style: Ts.medium13(
                              registerBusinessController
                                      .RegBusinessTabsList[index].isActive
                                  ? AppColors.secondaryColor
                                  : index <
                                          registerBusinessController
                                              .currentTabIndex.value
                                      ? AppColors.green
                                      : AppColors.grey3,
                            ),
                          ),
                          Spacer(),
                          index <
                                  registerBusinessController
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
                      color: registerBusinessController
                              .RegBusinessTabsList[index].isActive
                          ? AppColors.secondaryColor
                          : index <
                                  registerBusinessController
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
