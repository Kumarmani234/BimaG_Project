// ignore_for_file: must_be_immutable

import 'package:bima_g/app/enums.dart';
import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/modules/four_wheeler_insurance/car_insurance/controllers/car_insurance_controller.dart';
import 'package:bima_g/app/modules/two_wheeler_insurance/two_wheeler_details/views/custom_components/details_field_view.dart';
import 'package:bima_g/utility/colors.dart';
import 'package:bima_g/utility/ts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../widgets/buttons.dart';
import '../../../insurance_appbar/views/insurance_appbar_view.dart';

class CarDetailsView extends GetView<CarInsuranceController> {
  @override
  // ${controller.selectedCity.value}
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: InsuranceAppbarView(title: 'car_insurance'.tr),
        preferredSize: Size.fromHeight(80.h),
      ),
      bottomNavigationBar: Obx(
        () => BottomButton(
          key:Key('view_quotess_key'),
          text: 'view_quotes'.tr,
          buttonStatus: carInsuranceController.viewQuotesButtonStatus.value,
          onClick: () {
            if (carInsuranceController.viewQuotesButtonStatus.value ==
                ButtonStatus.Loading) {
              return;
            }
            policyQuoteListController.fetchQuoteList(
                vehicle_num:
                    carInsuranceController.carNumberController.value.text,
                vehicleType: 2);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 24.h,
              ),
              Text(
                'city'.tr,
                style: Ts.regular12(AppColors.grey5),
              ),
              SizedBox(height: 6.h),
              DetailsFieldView(
                text: '${carInsuranceController.selectedCity.value}',
              ),
              SizedBox(height: 16.h),
              Text(
                'rto'.tr,
                style: Ts.regular12(AppColors.grey5),
              ),
              SizedBox(height: 6.h),
              DetailsFieldView(
                text: '${carInsuranceController.selectedRTO.value}',
              ),
              SizedBox(height: 16.h),
              Text(
                'manufacturer'.tr,
                style: Ts.regular12(AppColors.grey5),
              ),
              SizedBox(height: 6.h),
              DetailsFieldView(
                text:
                    '${carInsuranceController.selectedManufacturer.value.name}',
              ),
              SizedBox(height: 16.h),
              Text(
                'model'.tr,
                style: Ts.regular12(AppColors.grey5),
              ),
              SizedBox(height: 6.h),
              DetailsFieldView(
                text: '${carInsuranceController.selectedModel.value.name}',
              ),
              SizedBox(height: 16.h),
              Text(
                'variant'.tr,
                style: Ts.regular12(AppColors.grey5),
              ),
              SizedBox(height: 6.h),
              DetailsFieldView(
                text: '${carInsuranceController.selectedVariant.value.name}',
              ),
              SizedBox(height: 16.h),
              Text(
                'year'.tr,
                style: Ts.regular12(AppColors.grey5),
              ),
              SizedBox(height: 6.h),
              DetailsFieldView(
                text: '${carInsuranceController.selectedYear.value}',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
