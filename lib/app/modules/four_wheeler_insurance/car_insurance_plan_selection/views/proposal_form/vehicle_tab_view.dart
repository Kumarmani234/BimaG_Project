// ignore_for_file: must_be_immutable

import 'package:bima_g/app/form_validation_expressions.dart';
import 'package:bima_g/app/module_controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../widgets/textfields.dart';

class VehicleTabView extends GetView {
  FormFieldValidExpression formFieldValidExpression =
      FormFieldValidExpression();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //for registration number remaining
              BorderTextField(
                key:Key('register_no_key'),
                hintText: 'RJ - 14 - DT - 0577',
                titleText: 'registration_number'.tr + "*",
                textCapitalization: TextCapitalization.characters,
                inputFormatters: [bikeInsuranceController.maskFormatterForBike],
                controller:
                    carInsurancePlanSelectionController.regNoController.value,
                onValidate: (val) {
                  if (val.toString().isEmpty) {
                    return 'please_enter_registration_no'.tr;
                  } else if (!formFieldValidExpression.regNumberValid
                      .hasMatch(val)) {
                    return 'invalid_registration_no_format'.tr;
                  } else {
                    return null;
                  }
                },
              ),

              SizedBox(height: 12.h),

              // engine number
              BorderTextField(
                key:Key('engine_no_key'),
                hintText: '283293023902',
                titleText: 'engine_number'.tr + "*",
                maxLength: 17,
                controller: carInsurancePlanSelectionController
                    .EnginenoController.value,
                onValidate: (val) {
                  if (val.toString().isEmpty) {
                    return 'please_enter_engine_no'.tr;
                  } else if (!formFieldValidExpression.alphaNumValid
                      .hasMatch(val)) {
                    return 'invalid_engine_no_format'.tr;
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 12.h),

              //chassis number
              BorderTextField(
                key:Key('chassis_no_key'),
                titleText: 'chassis_number'.tr + "*",
                hintText: '34530948498539349',
                maxLength: 17,
                controller:
                    carInsurancePlanSelectionController.ChassisController.value,
                onValidate: (val) {
                  if (val.toString().isEmpty) {
                    return 'please_enter_chassis_no'.tr;
                  } else if (!formFieldValidExpression.alphaNumValid
                      .hasMatch(val)) {
                    return 'invalid_chassis_no_format'.tr;
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 12.h),

              //date for registration
              Obx(
                () => BorderTextField(
                  key:Key('vehicle_register_no_key'),
                  readOnly: true,
                  onTap: () async {
                    carInsurancePlanSelectionController
                        .onRegDatePickerTap(context);
                  },
                  hintText: '01 Mar, 2017',
                  titleText: 'vehicle_registration_date'.tr + "*",
                  controller:
                      carInsurancePlanSelectionController.RegnoController.value,
                  onValidate: (val) {
                    if (val.toString().isEmpty) {
                      return 'please_enter_registration_date'.tr;
                    } else if (!formFieldValidExpression.dateValidExpression
                        .hasMatch(val)) {
                      return 'invalid_date_format'.tr;
                    } else {
                      return null;
                    }
                  },
                  suffixIcon: Icon(Icons.date_range),
                ),
              ),

              SizedBox(height: 16.h)
            ],
          ),
        ),
      ),
    );
  }
}
