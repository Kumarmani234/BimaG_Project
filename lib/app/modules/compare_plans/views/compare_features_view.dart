// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/utility/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utility/ts.dart';

class CompareFeaturesView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 15.h,
        ),
        Text(
          'Features',
          style: Ts.bold15(AppColors.black),
        ),
        SizedBox(
          height: 8.h,
        ),
        Obx(() => SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                //height: 200.h,
                padding: EdgeInsets.only(left: 12.h, top: 12.h, bottom: 6.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.h),
                    color: AppColors.primaryColor.withOpacity(0.1)),
                child: Row(
                  children: [
                    for (int i = 0;
                        i < comparePlansController.listSelectedQuotes.length;
                        i++)
                      Container(
                        width: (MediaQuery.of(context).size.width * 0.5) - 20.w,
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(right: 10.w),
                        child: Column(
                          children: [
                            for (int j = 0;
                                j <
                                    comparePlansController.listSelectedQuotes[i]
                                        .planDetailsList.length;
                                j++)
                              PolicyDetailPointsFeature(
                                  strText: comparePlansController
                                      .listSelectedQuotes[i]
                                      .planDetailsList[j]),
                            for (int j = 0;
                                j <
                                    comparePlansController.listSelectedQuotes[i]
                                        .planDetailsList.length;
                                j++)
                              PolicyDetailPointsFeature(
                                  strText: comparePlansController
                                      .listSelectedQuotes[i]
                                      .planDetailsList[j]),
                            for (int j = 0;
                                j <
                                    comparePlansController.listSelectedQuotes[i]
                                        .planDetailsList.length;
                                j++)
                              PolicyDetailPointsFeature(
                                  strText: comparePlansController
                                      .listSelectedQuotes[i]
                                      .planDetailsList[j]),
                            for (int j = 0;
                                j <
                                    comparePlansController.listSelectedQuotes[i]
                                        .planDetailsList.length;
                                j++)
                              PolicyDetailPointsFeature(
                                  strText: comparePlansController
                                      .listSelectedQuotes[i].planDetailsList[j])
                          ],
                        ),
                      )
                  ],
                ),
              ),
            ))
      ],
    );
  }
}

class PolicyDetailPointsFeature extends StatelessWidget {
  String strText;
  PolicyDetailPointsFeature({this.strText = '', Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width * 0.5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.w), color: AppColors.white),
      margin: EdgeInsets.only(bottom: 7.w),
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
      child: Text(
        strText,
        style: Ts.regular12(AppColors.grey4),
      ),
    );
  }
}
