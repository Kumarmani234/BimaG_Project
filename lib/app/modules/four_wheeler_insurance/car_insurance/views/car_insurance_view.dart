// ignore_for_file: must_be_immutable

import 'package:bima_g/app/enums.dart';
import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/modules/four_wheeler_insurance/car_insurance/controllers/car_insurance_controller.dart';
import 'package:bima_g/app/modules/four_wheeler_insurance/car_insurance/views/ask_car_details_view.dart';
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

class CarInsuranceView extends GetView<CarInsuranceController> {
  FormFieldValidExpression formFieldValidExpression =
      FormFieldValidExpression();

  //Gj13cc9397

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: InsuranceAppbarView(
          title: 'car_insurance'.tr,
        ),
        preferredSize: Size.fromHeight(80.h),
      ),
      bottomNavigationBar: Obx(
        () => BottomButton(
          text: 'verify_details'.tr,
          buttonStatus: carInsuranceController.buttonStatus.value,
          onClick: carInsuranceController.carNumberController.value.text.isEmpty
              ? null
              : () {
                  if (formFieldValidExpression.regNumberValid.hasMatch(
                      carInsuranceController.carNumberController.value.text)) {
                    HapticFeedback.mediumImpact();
                    carInsuranceController.findVehicleDetails(
                        carInsuranceController.carNumberController.value.text);
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
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InsuranceImgSliderView(
                    imagePath: dashboardController.listInsuranceSlider.value.image ?? [],
                    currentIndexOfTopCarousel:
                        carInsuranceController.currentIndexOfTopCarousel,
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
                          text: 'enter_car_details'.tr,
                          // textCapitalization: TextCapitalization.characters,
                          // isDrop: true,
                          onChange: (vehicle_num) {
                            if (vehicle_num.toString().length == 13 &&
                                formFieldValidExpression.regNumberValid
                                    .hasMatch(carInsuranceController
                                        .carNumberController.value.text)) {
                              carInsuranceController.buttonStatus.value =
                                  ButtonStatus.Active;
                            } else {
                              carInsuranceController.buttonStatus.value =
                                  ButtonStatus.InActive;
                            }
                          },
                          inputFormatters: [
                            carInsuranceController.maskFormatterForBike
                          ],
                          controller:
                              carInsuranceController.carNumberController,
                        ),
                        SizedBox(height: 6.h),
                        InsuranceRowTextButtonsView(
                          first_text: 'dont_know_car_number'.tr,
                          second_text: 'bought_new_car'.tr,
                          OnTapFirst: () {
                            Get.delete<CarInsuranceController>();
                            carInsuranceController =
                                Get.put(CarInsuranceController());
                            Get.to(AskCarDetailsView());
                          },
                          OnTapSecond: () {
                            Get.delete<CarInsuranceController>();
                            carInsuranceController =
                                Get.put(CarInsuranceController());
                            Get.to(AskCarDetailsView());
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
      //'car_insurance_long_title'.tr,
      style: Ts.medium24(Colors.black),
    ));
  }

  primaryTextSecond() {
    return Obx(() => Text(
      dashboardController.listInsuranceSlider.value.subTitle ?? '',
      //'car_ins_start_at'.tr + ' ' + '₹555*',
      style: Ts.medium17(Color(0xFF848493)),
    ));
  }
}
