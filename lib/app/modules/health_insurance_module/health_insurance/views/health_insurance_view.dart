// ignore_for_file: must_be_immutable

import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../utility/asset_paths.dart';
import '../../../../../utility/ts.dart';
import '../../../../insurance_components/insurance_img_slider_view.dart';
import '../../../../insurance_components/insurance_row_text_buttons_view.dart';
import '../../../insurance_appbar/views/insurance_appbar_view.dart';
import '../../../policy_quote_list/views/policy_quote_list_view.dart';
import '../controllers/health_insurance_controller.dart';
import 'health_insurance_details_view.dart';

class HealthInsuranceView extends GetView<HealthInsuranceController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: InsuranceAppbarView(
          title: 'health_insurance'.tr,
        ),
        preferredSize: Size.fromHeight(80.h),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InsuranceImgSliderView(
            imagePath: dashboardController.listInsuranceSlider.value.image ?? [],
            currentIndexOfTopCarousel:
                healthInsuranceController.currentIndexOfTopCarousel,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                primaryText(),
                SizedBox(height: 12.h),
                primaryTextSecond(),
                SizedBox(height: 24.h),
                Container(
                  height: 40.h,
                  width: 344.w,
                  child: RoundSquareButtons.buttonEnabled(
                      onPressed: () {
                        Get.to(PolicyQuoteListView());
                      },
                      text: 'view_quotes'.tr),
                ),
                SizedBox(height: 6.h),
                InsuranceRowTextButtonsView(
                  first_text: 'port_my_existing_policy'.tr,
                  second_text: 'renew_ur_policy'.tr,
                  OnTapFirst: () => Get.to(HealthInsuranceDetailsView()),
                  OnTapSecond: () => Get.to(HealthInsuranceDetailsView()),
                ),
                SizedBox(height: 150),
              ],
            ),
          ),
        ],
      ),
    );
  }

  primaryText() {
    return Text(
      'offer_on_helth_insurance'.tr,
      style: Ts.medium24(
        Colors.black,
      ),
    );
  }

  primaryTextSecond() {
    return Text('health_insurance_start_at'.tr + ' ₹499*',
        style: Ts.medium17(Color(0xFF848493)));
  }
}
