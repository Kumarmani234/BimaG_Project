import 'package:bima_g/app/module_controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../../utility/styles.dart';
import '../../../../../utility/colors.dart';
import '../../../../../utility/ts.dart';
import '../../../../widgets/buttons.dart';

class RegisterBusinessBottomBar extends GetView {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (registerBusinessController.currentTabIndex.value == 0) {
          return decoration(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Container(
                height: 40.h,
                child: RoundSquareButtons.buttonEnabled(
                  onPressed: () {
                    registerBusinessController.currentTabIndex.value++;
                    for (int i = 0;
                        i <
                            registerBusinessController
                                .RegBusinessTabsList.length;
                        i++) {
                      registerBusinessController
                              .RegBusinessTabsList[i].isActive =
                          i == registerBusinessController.currentTabIndex.value;
                    }
                    registerBusinessController.RegBusinessTabsList.refresh();
                  },
                  text: 'continue'.tr,
                ),
              ),
            ),
          );
        } else if (registerBusinessController.currentTabIndex.value == 1) {
          return decoration(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Container(
                height: 40.h,
                child: RoundSquareButtons.buttonEnabled(
                  onPressed: () {
                    if (registerBusinessController.businessInfoKey.currentState!
                        .validate()) {
                      registerBusinessController.currentTabIndex.value++;
                      for (int i = 0;
                          i <
                              registerBusinessController
                                  .RegBusinessTabsList.length;
                          i++) {
                        registerBusinessController
                                .RegBusinessTabsList[i].isActive =
                            i ==
                                registerBusinessController
                                    .currentTabIndex.value;
                      }
                    }
                    registerBusinessController.RegBusinessTabsList.refresh();
                  },
                  text: 'continue'.tr,
                ),
              ),
            ),
          );
        } else if (registerBusinessController.currentTabIndex.value == 2) {
          return decoration(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Container(
                height: 40.h,
                child: RoundSquareButtons.buttonEnabled(
                  onPressed: () {
                    if (registerBusinessController.personalInfoKey.currentState!
                        .validate()) {
                      registerBusinessController.currentTabIndex.value++;
                      for (int i = 0;
                          i <
                              registerBusinessController
                                  .RegBusinessTabsList.length;
                          i++) {
                        registerBusinessController
                                .RegBusinessTabsList[i].isActive =
                            i ==
                                registerBusinessController
                                    .currentTabIndex.value;
                      }
                    }
                    registerBusinessController.RegBusinessTabsList.refresh();
                  },
                  text: 'continue'.tr,
                ),
              ),
            ),
          );
        } else if (registerBusinessController.currentTabIndex.value == 3) {
          return decoration(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: Row(
                children: [
                  Expanded(
                    child: Material(
                      color: Colors.transparent,
                      child: Ink(
                        child: InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            registerBusinessController.currentTabIndex.value++;
                            for (int i = 0;
                                i <
                                    registerBusinessController
                                        .RegBusinessTabsList.length;
                                i++) {
                              registerBusinessController
                                      .RegBusinessTabsList[i].isActive =
                                  i ==
                                      registerBusinessController
                                          .currentTabIndex.value;
                            }
                            registerBusinessController.RegBusinessTabsList
                                .refresh();
                          },
                          child: Text(
                            'Skip'.tr,
                            textAlign: TextAlign.center,
                            style: Ts.regular15(AppColors.primaryColor),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: RoundSquareButtons.buttonEnabled(
                      onPressed: () {
                        if (registerBusinessController
                            .bankDetailsKey.currentState!
                            .validate()) {
                          registerBusinessController.currentTabIndex.value++;
                          for (int i = 0;
                              i <
                                  registerBusinessController
                                      .RegBusinessTabsList.length;
                              i++) {
                            registerBusinessController
                                    .RegBusinessTabsList[i].isActive =
                                i ==
                                    registerBusinessController
                                        .currentTabIndex.value;
                          }
                        }
                        registerBusinessController.RegBusinessTabsList
                            .refresh();
                      },
                      text: 'Continue',
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return decoration(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: Row(
                children: [
                  Expanded(
                    child: Material(
                      color: Colors.transparent,
                      child: Ink(
                        child: InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {},
                          child: Text(
                            'Skip'.tr,
                            textAlign: TextAlign.center,
                            style: Ts.regular15(AppColors.primaryColor),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: RoundSquareButtons.buttonEnabled(
                      onPressed: () {
                        registerBusinessController.RegBusinessTabsList
                            .refresh();
                      },
                      text: 'Save All',
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}

class decoration extends StatelessWidget {
  decoration({this.child});

  final child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [Styles.dropShadowZ100()],
      ),
      child: child,
    );
  }
}
