// ignore_for_file: must_be_immutable

import 'package:bima_g/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../utility/ts.dart';
import '../../../module_controllers.dart';

class FilterExpandButtonView extends GetView {
  int index;
  Widget child;
  FilterExpandButtonView({required this.index, required this.child, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.h), color: Colors.white),
        margin: EdgeInsets.only(bottom: 8.h),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 15.w,
                ),
                Expanded(
                    child: Text(
                        policyFilterController.filterList[index].filterName,
                        style: Ts.bold14(Colors.black))),
                //Spacer(),
                IconButton(
                  onPressed: () {
                    policyFilterController.filterList[index].isExpanded =
                        !policyFilterController.filterList[index].isExpanded;
                    policyFilterController.filterList.refresh();
                  },
                  icon: Icon(
                    policyFilterController.filterList[index].isExpanded
                        ? Icons.keyboard_arrow_up_outlined
                        : Icons.keyboard_arrow_down_outlined,
                  ),
                  splashRadius: 20,
                )
              ],
            ),
            if (policyFilterController.filterList[index].isExpanded)
              Padding(
                padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 15.h),
                child: Column(
                  children: [
                    Container(
                      height: 1,
                      color: AppColors.grey2,
                    ),
                    SizedBox(height: 15.h),
                    child
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
