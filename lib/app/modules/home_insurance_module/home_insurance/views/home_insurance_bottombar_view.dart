import 'package:bima_g/app/module_controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../utility/colors.dart';
import '../../../../../utility/styles.dart';
import '../../../../../utility/ts.dart';
import '../../../../widgets/buttons.dart';
import '../../../policy_quote_list/views/policy_quote_list_view.dart';

class HomeInsuranceBottombarView extends GetView {
  HomeInsuranceBottombarView(
      {required this.detailsFormKey, required this.coverageFormKey});
  final GlobalKey<FormState> detailsFormKey;
  final GlobalKey<FormState> coverageFormKey;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (homeInsuranceController.currentTabIndex.value == 0) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              Styles.upperShadow(),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.only(
                top: 16.h, right: 15.w, left: 16.w, bottom: 16.h),
            child: Container(
              height: 40.h,
              width: 168.w,
              child: RoundSquareButtons.buttonEnabled(
                onPressed: () {
                  if (detailsFormKey.currentState!.validate()) {
                    homeInsuranceController.currentTabIndex.value++;
                    for (int i = 0;
                        i < homeInsuranceController.HomeTabs.length;
                        i++) {
                      homeInsuranceController.HomeTabs[i].isActive =
                          i == homeInsuranceController.currentTabIndex.value;
                    }
                    homeInsuranceController.HomeTabs.refresh();
                  }
                },
                text: 'continue'.tr,
              ),
            ),
          ),
        );
      } else {
        bool isLastTab = homeInsuranceController.currentTabIndex.value ==
            homeInsuranceController.HomeTabs.length - 1;
        String continueText = isLastTab ? 'view_plans'.tr : 'continue'.tr;
        return Container(
          height: 80.h,
          width: 375.w,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              Styles.upperShadow(),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 83.5.w, top: 26.h),
                child: Material(
                  color: Colors.transparent,
                  child: Ink(
                    child: InkWell(
                      onTap: () {
                        homeInsuranceController.currentTabIndex.value--;
                        for (int i = 0;
                            i < homeInsuranceController.HomeTabs.length;
                            i++) {
                          homeInsuranceController.HomeTabs[i].isActive = i ==
                              homeInsuranceController.currentTabIndex.value;
                        }
                        homeInsuranceController.HomeTabs.refresh();
                      },
                      child: Text(
                        'back'.tr,
                        style: Ts.regular15(AppColors.secondaryColor),
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(top: 16.h, right: 15.w),
                child: Container(
                  height: 40.h,
                  width: 168.w,
                  child: RoundSquareButtons.buttonEnabled(
                    onPressed: () {
                      if (isLastTab) {
                        if (coverageFormKey.currentState!.validate()) {
                          Get.to(PolicyQuoteListView());
                        }
                      } else {
                        homeInsuranceController.currentTabIndex.value++;
                        for (int i = 0;
                            i < homeInsuranceController.HomeTabs.length;
                            i++) {
                          homeInsuranceController.HomeTabs[i].isActive = i ==
                              homeInsuranceController.currentTabIndex.value;
                        }
                        homeInsuranceController.HomeTabs.refresh();
                      }
                    },
                    text: continueText,
                  ),
                ),
              )
            ],
          ),
        );
      }
    });
  }
}
