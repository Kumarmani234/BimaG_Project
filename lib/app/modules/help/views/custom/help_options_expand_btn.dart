// ignore_for_file: must_be_immutable

import 'package:bima_g/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../utility/ts.dart';
import '../../../../module_controllers.dart';

class HelpExpandButtonView extends GetView {
  int index;
  Widget child;
  HelpExpandButtonView({required this.index, required this.child, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.w),
          color: AppColors.white,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      helpController.helpOptionsList[index].filterName,
                      style: Ts.medium13(AppColors.secondaryColor),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: Ink(
                      child: InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          helpController.helpOptionsList[index].isExpanded =
                              !helpController.helpOptionsList[index].isExpanded;
                          helpController.helpOptionsList.refresh();
                        },
                        child: Icon(
                          helpController.helpOptionsList[index].isExpanded
                              ? Icons.keyboard_arrow_up_outlined
                              : Icons.keyboard_arrow_down_outlined,
                          color: AppColors.grey4,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              if (helpController.helpOptionsList[index].isExpanded)
                Padding(
                  padding: EdgeInsets.only(top: 8.h),
                  child: child,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
