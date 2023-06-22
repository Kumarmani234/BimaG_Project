// ignore_for_file: must_be_immutable

import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/modules/fetch_address/views/fetch_address_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../utility/colors.dart';
import '../../../../../../utility/ts.dart';

class HealthInsuranceThirdTabView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: healthInsuranceController.addressTabFormKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 15.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24.h),
              Text(
                'where_do_u_live'.tr,
                style: Ts.bold15(AppColors.secondaryColor),
              ),
              SizedBox(height: 16.h),
              FetchAddressView()
            ],
          ),
        ),
      ),
    );
  }
}
