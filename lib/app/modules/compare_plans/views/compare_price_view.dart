import 'package:bima_g/app/widgets/buttons.dart';
import 'package:bima_g/utility/colors.dart';
import 'package:bima_g/utility/styles.dart';
import 'package:bima_g/utility/ts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../module_controllers.dart';

class ComparePriceView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: AppColors.white, boxShadow: [Styles.upperShadow()]),
      child: Obx(() => ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: comparePlansController.listSelectedQuotes.length,
            itemBuilder: (ctx, indedx) => Container(
              height: 85.h,
              width: MediaQuery.of(context).size.width * 0.5,
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    '₹3250',
                    textAlign: TextAlign.center,
                    style: Ts.semiBold17(AppColors.black).copyWith(
                        decoration: TextDecoration.lineThrough,
                        decorationColor: AppColors.red),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  RoundSquareButtons.buttonEnabled(
                      onPressed: () {}, text: '₹2,500')
                ],
              ),
            ),
          )),
    );
  }
}
