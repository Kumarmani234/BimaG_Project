import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/modules/home_insurance_module/home_insurance/views/home_insurance_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../utility/ts.dart';
import '../../../../../utility/asset_paths.dart';
import '../../../../insurance_components/insurance_img_slider_view.dart';
import '../../../../insurance_components/insurance_row_text_buttons_view.dart';
import '../../../../widgets/buttons.dart';
import '../../../insurance_appbar/views/insurance_appbar_view.dart';
import '../../../policy_quote_list/views/policy_quote_list_view.dart';
import '../controllers/home_insurance_controller.dart';

class HomeInsuranceView extends GetView<HomeInsuranceController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: InsuranceAppbarView(
          title: 'property_insurance'.tr,
        ),
        preferredSize: Size.fromHeight(80.h),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InsuranceImgSliderView(
                  imagePath: dashboardController.listInsuranceSlider.value.image ?? [],
                  currentIndexOfTopCarousel:
                      homeInsuranceController.currentIndexOfTopCarousel,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      primaryText(),
                      SizedBox(height: 12.h),
                      primaryTextSecond(),
                      SizedBox(height: 24.h),
                      Center(
                        child: Container(
                          height: 40.h,
                          width: 344.w,
                          child: RoundSquareButtons.buttonEnabled(
                              onPressed: () {
                                Get.to(PolicyQuoteListView());
                              },
                              text: 'view_quotes'.tr),
                        ),
                      ),
                      SizedBox(height: 6.h),
                      InsuranceRowTextButtonsView(
                        first_text: 'port_my_existing_policy'.tr,
                        second_text: 'renew_ur_policy'.tr,
                        OnTapFirst: () => Get.to(HomeInsuranceDetailsView()),
                        OnTapSecond: () => Get.to(HomeInsuranceDetailsView()),
                      ),
                      SizedBox(height: 150.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  primaryText() {
    return Text(
      'get_excl_offer_on_property_insurance'.tr,
      style: Ts.medium24(
        Colors.black,
      ),
    );
  }

  primaryTextSecond() {
    return Text('property_insurance_Starting_at'.tr + ' ₹499*',
        style: Ts.medium17(Color(0xFF848493)));
  }
}
