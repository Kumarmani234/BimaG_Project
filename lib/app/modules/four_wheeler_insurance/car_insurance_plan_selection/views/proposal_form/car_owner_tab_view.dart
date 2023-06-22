// ignore_for_file: must_be_immutable
import 'package:bima_g/app/form_validation_expressions.dart';
import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/modules/fetch_address/views/fetch_address_view.dart';
import 'package:bima_g/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../widgets/textfields.dart';

class CarOwnerTabView extends GetView {
  FormFieldValidExpression formFieldValidExpression =
      FormFieldValidExpression();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.white,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //for name
                BorderTextField(
                  key:Key('name_key'),
                  hintText: 'user_name'.tr,
                  titleText: 'name'.tr + "*",
                  controller:
                      carInsurancePlanSelectionController.NameController.value,
                  onValidate: (val) {
                    if (val.toString().isEmpty) {
                      return 'please_enter_name'.tr;
                    } else if (!formFieldValidExpression.nameValid
                        .hasMatch(val)) {
                      return 'invalid_name_format'.tr;
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 12.h),

                // for email
                BorderTextField(
                  key:Key('email_address_key'),
                  hintText: 'useremailadd@domain.com'.tr,
                  titleText: 'email_address'.tr,
                  controller:
                      carInsurancePlanSelectionController.EmailController.value,
                  textInputType: TextInputType.emailAddress,
                  onValidate: (val) {
                    if (val.toString().isEmpty) {
                      return null;
                    } else if (!formFieldValidExpression.emailValid
                        .hasMatch(val)) {
                      return 'invalid_email_format'.tr;
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 12.h),

                // mobile no
                BorderTextField(
                  key:Key('mobile_no_key'),
                  hintText: 'user_mobile_no'.tr,
                  titleText: 'mobile_number'.tr + "*",
                  maxLength: 10,
                  textInputType: TextInputType.phone,
                  controller: carInsurancePlanSelectionController
                      .MobilenoController.value,
                  onValidate: (val) {
                    if (val.toString().isEmpty) {
                      return 'please_enter_mobile_no'.tr;
                    } else if (!formFieldValidExpression.mobileValid
                        .hasMatch(val)) {
                      return 'invalid_mobile_no_format'.tr;
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 12.h),

                //pancard
                BorderTextField(
                  key:Key('pancard_no_key'),
                  hintText: 'user_pancard'.tr,
                  titleText: 'pan_card'.tr + "*",
                  maxLength: 10,
                  controller: carInsurancePlanSelectionController
                      .PancardController.value,
                  onValidate: (val) {
                    if (val.toString().isEmpty) {
                      return 'please_enter_pancard_no'.tr;
                    } else if (!formFieldValidExpression.pancardValid
                        .hasMatch(val)) {
                      return 'invalid_pancard_no_format'.tr;
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 12.h),

                //address view
                FetchAddressView(),
                SizedBox(height: 16.h)
              ],
            ),
          ),
        ),
        SizedBox(height: 50.h),
      ],
    );
  }
}
