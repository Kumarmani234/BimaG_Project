import 'package:bima_g/app/module_controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../../../utility/colors.dart';
import '../../../../../../utility/ts.dart';

class HomeInsuranceDetailTabbarView extends GetView {
  HomeInsuranceDetailTabbarView({required this.tabFormKey});

  final GlobalKey<FormState> tabFormKey;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      padding: EdgeInsets.only(top: 16.h),
      child: Obx(
        () => ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: homeInsuranceController.HomeTabs.length,
          itemBuilder: (ctx, index) => InkWell(
            onTap: () {
              if (homeInsuranceController.currentTabIndex.value == 0 &&
                  tabFormKey.currentState!.validate()) {
                for (int i = 0;
                    i < homeInsuranceController.HomeTabs.length;
                    i++) {
                  homeInsuranceController.HomeTabs[i].isActive = false;
                }
                homeInsuranceController.HomeTabs[index].isActive = true;
                homeInsuranceController.currentTabIndex.value = index;
                homeInsuranceController.HomeTabs.refresh();
              }
            },
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
                            homeInsuranceController.HomeTabs[index].tabName,
                            style: Ts.medium13(
                              homeInsuranceController.HomeTabs[index].isActive
                                  ? AppColors.secondaryColor
                                  : index <
                                          homeInsuranceController
                                              .currentTabIndex.value
                                      ? AppColors.green
                                      : AppColors.grey3,
                            ),
                          ),
                          Spacer(),
                          index < homeInsuranceController.currentTabIndex.value
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
                      color: homeInsuranceController.HomeTabs[index].isActive
                          ? AppColors.secondaryColor
                          : index <
                                  homeInsuranceController.currentTabIndex.value
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
