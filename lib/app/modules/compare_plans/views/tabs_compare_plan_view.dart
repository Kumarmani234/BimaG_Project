import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/utility/colors.dart';
import 'package:bima_g/utility/ts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

class TabsComparePlanView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      color: AppColors.white,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: 20.h),
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: comparePlansController.tabsForComparePlan.length,
        itemBuilder: (ctx, index) => InkWell(
          onTap: () {
            for (int i = 0;
                i < comparePlansController.tabsForComparePlan.length;
                i++) {
              comparePlansController.tabsForComparePlan[i].isActive = false;
            }
            comparePlansController.tabsForComparePlan[index].isActive = true;
            comparePlansController.currentComparePlanTabIndex.value = index;
            comparePlansController.tabsForComparePlan.refresh();
          },
          child: Container(
            height: 35.h,
            width: 140.w,
            margin: EdgeInsets.only(left: 15.w),
            child: Obx(() => Column(
                  children: [
                    Expanded(
                        child: Text(
                      comparePlansController.tabsForComparePlan[index].tabName,
                      style: Ts.medium13(comparePlansController
                              .tabsForComparePlan[index].isActive
                          ? AppColors.primaryColor
                          : AppColors.grey4),
                    )),
                    if (comparePlansController
                        .tabsForComparePlan[index].isActive)
                      Container(
                        height: 2.h,
                        color: AppColors.primaryColor,
                      )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
