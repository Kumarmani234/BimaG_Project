import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../utility/ts.dart';

class CompareIdvView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('IDV', style: Ts.bold15(AppColors.black),),
        SizedBox(height: 8.h,),
        Container(
          height: 65.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.h),
            color: AppColors.primaryColor.withOpacity(0.1)
          ),
          child: Obx(() => ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: comparePlansController.listSelectedQuotes.length,
            itemBuilder: (ctx, index)=>Container(
              width: MediaQuery.of(context).size.width * 0.45,
              alignment: Alignment.center,
              child: Text(
                '₹'+comparePlansController.listSelectedQuotes[index].planDiscountedPrice.toString(),
                style: Ts.semiBold20(AppColors.black),
              ),
            ),
          )),
        )
      ],
    );
  }
}
