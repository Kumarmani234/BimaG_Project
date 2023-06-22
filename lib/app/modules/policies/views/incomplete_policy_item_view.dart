// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../utility/colors.dart';
import '../../../../utility/ts.dart';
import '../model/incomplete_policy_model.dart';

class IncompletePolicyItemView extends StatelessWidget {
  IncompletePolicyModel incompletePolicyModel;
  IncompletePolicyItemView({
    required this.incompletePolicyModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.h),
        color: Colors.white,
      ),
      padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 10.h),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text('plan'.tr, style: Ts.regular11(AppColors.grey4)),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(incompletePolicyModel.planName,
                        style: Ts.regular12(Colors.black)),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                ),
              ),
              IconButton(
                onPressed: () {},
                splashRadius: 30,
                icon: Icon(
                  Icons.keyboard_arrow_right_outlined,
                  color: AppColors.primaryColor,
                ),
              )
            ],
          ),
          LinearProgressIndicator(
            value: incompletePolicyModel.planProgress / 100,
            backgroundColor: AppColors.primaryColor.withOpacity(0.1),
            valueColor:
                new AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                decoration: BoxDecoration(
                    color: AppColors.green.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(3.h)),
                child: Text(
                  'Complete your policies today and save more 80%',
                  style: Ts.regular11(AppColors.green),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
