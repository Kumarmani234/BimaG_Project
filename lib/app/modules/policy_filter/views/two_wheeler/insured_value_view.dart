import 'package:bima_g/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../../utility/ts.dart';
import '../../../../module_controllers.dart';
import '../filter_expand_button_view.dart';

class InsuredValueView extends GetView {
  @override
  Widget build(BuildContext context) {
    return FilterExpandButtonView(
      index: 0,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Click to know more about ',
                style: Ts.regular13(AppColors.grey4),
              ),
              Text(
                'IDV',
                style: Ts.bold14(AppColors.primaryColor)
                    .copyWith(decoration: TextDecoration.underline),
              ),
            ],
          ),

          SizedBox(
            height: 15.h,
          ),

          //price slider
          Row(
            children: [
              SizedBox(
                width: 60.w,
                child: Obx(
                  () => Text(
                    '₹${policyFilterController.insuredValue.value}',
                    style: Ts.bold15(AppColors.primaryColor),
                  ),
                ),
              ),
              Expanded(
                child: Obx(
                  () => Slider(
                    min: 0,
                    max: 1000000,
                    value: policyFilterController.insuredValue.value.toDouble(),
                    onChanged: (double value) {
                      policyFilterController.insuredValue.value = value.round();
                    },
                  ),
                ),
              ),
              Text(
                '₹1000000',
                style: Ts.bold15(AppColors.black),
              ),
            ],
          )
        ],
      ),
    );
  }
}
