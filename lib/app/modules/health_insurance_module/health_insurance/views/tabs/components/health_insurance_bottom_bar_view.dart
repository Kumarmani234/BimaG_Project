import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../../utility/colors.dart';
import '../../../../../../../utility/styles.dart';
import '../../../../../../../utility/ts.dart';
import '../../../../../../module_controllers.dart';
import '../../../../../../widgets/buttons.dart';
import '../../../../../../widgets/dialogs.dart';
import '../../../../../policy_quote_list/views/policy_quote_list_view.dart';
import '../../health_insurance_existing_illness_view.dart';

class HealthInsuranceBottomBarView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (healthInsuranceController.currentTabIndex.value == 0) {
          return Container(
            decoration: BoxDecoration(
                color: Colors.white, boxShadow: [Styles.upperShadow()]),
            child: Padding(
              padding: EdgeInsets.only(
                  top: 16.h, right: 15.w, left: 16.w, bottom: 50.h),
              child: Container(
                height: 40.h,
                width: 168.w,
                child: RoundSquareButtons.buttonEnabled(
                  onPressed: () {
                    bool isAnyFieldSelected = healthInsuranceController
                        .insuredMembersList
                        .any((member) => member.isSelected);
                    if (isAnyFieldSelected) {
                      healthInsuranceController.currentTabIndex.value++;
                      for (int i = 0;
                          i <
                              healthInsuranceController
                                  .tabsForComparePlan.length;
                          i++) {
                        healthInsuranceController
                                .tabsForComparePlan[i].isActive =
                            i ==
                                healthInsuranceController.currentTabIndex.value;
                      }
                      healthInsuranceController.tabsForComparePlan.refresh();
                    } else {
                      // Display an error message or perform any other desired action
                      Dialogs.showInfoDialog('Please Select Member to Insure');
                    }
                  },
                  text: 'continue'.tr,
                ),
              ),
            ),
          );
        } else {
          bool isLastTabChecked = true;

          print(
              healthInsuranceController.insuredMembersList.toList().toString());

          String continueText =
              healthInsuranceController.DetailsTabInfoList.last.isChecked
                  ? 'view_plans'.tr
                  : 'continue'.tr;

          bool isContinueEnabled = true;

          if (healthInsuranceController.currentTabIndex.value == 1) {}
          if (healthInsuranceController.currentTabIndex.value == 2) {}

          if (healthInsuranceController.currentTabIndex.value == 3) {
            isLastTabChecked =
                healthInsuranceController.DetailsTabInfoList.last.isChecked ||
                    healthInsuranceController.DetailsTabInfoList[0].isChecked ||
                    healthInsuranceController.DetailsTabInfoList[1].isChecked;

            isContinueEnabled = isLastTabChecked;
          }

          return Container(
            height: 108.h,
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
                          healthInsuranceController.currentTabIndex.value--;
                          for (int i = 0;
                              i <
                                  healthInsuranceController
                                      .tabsForComparePlan.length;
                              i++) {
                            healthInsuranceController
                                    .tabsForComparePlan[i].isActive =
                                i ==
                                    healthInsuranceController
                                        .currentTabIndex.value;
                          }
                          healthInsuranceController.tabsForComparePlan
                              .refresh();
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
                      onPressed: isContinueEnabled
                          ? () {
                              if (healthInsuranceController
                                      .currentTabIndex.value ==
                                  1) {
                                if (healthInsuranceController
                                    .ageTabFormKey.currentState!
                                    .validate()) {
                                  healthInsuranceController
                                      .currentTabIndex.value++;

                                  for (int i = 0;
                                      i <
                                          healthInsuranceController
                                              .tabsForComparePlan.length;
                                      i++) {
                                    healthInsuranceController
                                            .tabsForComparePlan[i].isActive =
                                        i ==
                                            healthInsuranceController
                                                .currentTabIndex.value;
                                  }
                                  healthInsuranceController.tabsForComparePlan
                                      .refresh();
                                }
                              } else if (healthInsuranceController
                                      .currentTabIndex.value ==
                                  2) {
                                if (healthInsuranceController
                                    .addressTabFormKey.currentState!
                                    .validate()) {
                                  healthInsuranceController
                                      .currentTabIndex.value++;

                                  for (int i = 0;
                                      i <
                                          healthInsuranceController
                                              .tabsForComparePlan.length;
                                      i++) {
                                    healthInsuranceController
                                            .tabsForComparePlan[i].isActive =
                                        i ==
                                            healthInsuranceController
                                                .currentTabIndex.value;
                                  }
                                  healthInsuranceController.tabsForComparePlan
                                      .refresh();
                                }
                              } else if (healthInsuranceController
                                      .currentTabIndex.value ==
                                  3) {
                                if (healthInsuranceController
                                    .DetailsTabInfoList.last.isChecked) {
                                  Get.to(PolicyQuoteListView());
                                } else {
                                  Get.to(HealthInsuranceExistingIllnessView());
                                }
                              } else {
                                healthInsuranceController
                                    .currentTabIndex.value++;
                                for (int i = 0;
                                    i <
                                        healthInsuranceController
                                            .tabsForComparePlan.length;
                                    i++) {
                                  healthInsuranceController
                                          .tabsForComparePlan[i].isActive =
                                      i ==
                                          healthInsuranceController
                                              .currentTabIndex.value;
                                }
                                healthInsuranceController.tabsForComparePlan
                                    .refresh();
                              }
                            }
                          : null,
                      text: continueText,
                    ),
                  ),
                )
              ],
            ),
          );
        }
      },
    );
  }
}
