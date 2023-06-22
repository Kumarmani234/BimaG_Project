import 'package:bima_g/app/module_controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../utility/colors.dart';
import '../../../../../../utility/ts.dart';
import '../../../../fetch_address/views/fetch_address_view.dart';

class DetailsTabView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Form(
          key: homeInsuranceController.detailsTabFormKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'where_ur_property'.tr,
                  style: Ts.bold15(AppColors.secondaryColor),
                ),
                SizedBox(height: 16.h),
                FetchAddressView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
