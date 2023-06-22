// ignore_for_file: must_be_immutable

import 'package:bima_g/app/enums.dart';
import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/modules/insurance_appbar/views/insurance_appbar_view.dart';
import 'package:bima_g/app/insurance_components/insurance_fiels_with_icon_view.dart';
import 'package:bima_g/app/insurance_components/insurance_img_slider_view.dart';
import 'package:bima_g/app/insurance_components/insurance_row_text_buttons_view.dart';
import 'package:bima_g/app/widgets/buttons.dart';
import 'package:bima_g/utility/asset_paths.dart';
import 'package:bima_g/utility/ts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../form_validation_expressions.dart';
import '../controllers/bike_insurance_controller.dart';
import 'ask_bike_details_view.dart';

class BikeInsuranceView extends GetView<BikeInsuranceController> {
  FormFieldValidExpression formFieldValidExpression =
      FormFieldValidExpression();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: InsuranceAppbarView(
          title: 'bike_insurance'.tr,
        ),
        preferredSize: Size.fromHeight(80.h),
      ),
      bottomNavigationBar: Obx(
        () => BottomButton(
          text: 'verify_details'.tr,
          buttonStatus: bikeInsuranceController.buttonStatus.value,
          onClick:
              bikeInsuranceController.bikeNumberController.value.text.isEmpty
                  ? null
                  : () {
                      if (formFieldValidExpression.regNumberValid.hasMatch(
                          bikeInsuranceController
                              .bikeNumberController.value.text)) {
                        HapticFeedback.mediumImpact();
                        bikeInsuranceController.findVehicleDetails(
                            bikeInsuranceController
                                .bikeNumberController.value.text);
                      }
                    },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InsuranceImgSliderView(
                    imagePath: dashboardController.listInsuranceSlider.value.image ?? [],
                    currentIndexOfTopCarousel:
                        bikeInsuranceController.currentIndexOfTopCarousel,
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
                        InsuranceFielsWithIconView(
                          // iconData: Icons.two_wheeler,
                          imgPath: AssetPath.bike,
                          text: 'enter_bike_details'.tr,
                          // textCapitalization: TextCapitalization.characters,
                          // isDrop: true,
                          onChange: (vehicle_num) {
                            if (vehicle_num.toString().length == 13 &&
                                formFieldValidExpression.regNumberValid
                                    .hasMatch(bikeInsuranceController
                                        .bikeNumberController.value.text)) {
                              bikeInsuranceController.buttonStatus.value =
                                  ButtonStatus.Active;
                            } else {
                              bikeInsuranceController.buttonStatus.value =
                                  ButtonStatus.InActive;
                            }
                          },
                          inputFormatters: [
                            bikeInsuranceController.maskFormatterForBike
                          ],
                          controller:
                              bikeInsuranceController.bikeNumberController,
                        ),
                        SizedBox(height: 6.h),
                        InsuranceRowTextButtonsView(
                          first_text: 'dont_know_bike_number'.tr,
                          second_text: 'bought_new_bike'.tr,
                          OnTapFirst: () {
                            Get.delete<BikeInsuranceController>();
                            bikeInsuranceController =
                                Get.put(BikeInsuranceController());
                            Get.to(AskBikeDetailsView());
                          },
                          OnTapSecond: () {
                            Get.delete<BikeInsuranceController>();
                            bikeInsuranceController =
                                Get.put(BikeInsuranceController());
                            Get.to(AskBikeDetailsView());
                          },
                        ),
                        SizedBox(height: 100.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  primaryText() {
    return Obx(() => Text(
      dashboardController.listInsuranceSlider.value.title ?? '',
      //'bike_insurance_long_title'.tr,
      style: Ts.medium24(Colors.black),
    ));
  }

  primaryTextSecond() {
    return Obx(() => Text(
      dashboardController.listInsuranceSlider.value.subTitle ?? '',
      //'bike_ins_start_at'.tr + ' ₹555*',
      style: Ts.medium17(Color(0xFF848493)),
    ));
  }
}
