// ignore_for_file: must_be_immutable

import 'package:bima_g/app/form_validation_expressions.dart';
import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/utility/colors.dart';
import 'package:bima_g/utility/ts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../widgets/drop_down.dart';
import '../../../../../widgets/field_with_radio_view.dart';
import '../../../../../widgets/textfields.dart';

class ProposerTabView extends GetView {
  FormFieldValidExpression formFieldValidExpression =
      FormFieldValidExpression();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
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
              Text(
                'proposer_detail_lets_start_with_details'.tr,
                style: Ts.bold15(AppColors.secondaryColor),
              ),
              SizedBox(height: 16.h),
              Text(
                'select_proposer'.tr + "*",
                style: Ts.bold14(AppColors.secondaryColor),
              ),
              SizedBox(height: 10.h),
              Container(
                height: 48,
                child: Obx(
                  () => ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: healthInsurancePlanSelectionController
                        .SelectProposerList.length,
                    itemBuilder: (context, index) {
                      return FieldWithRadioView(
                        height: 48.h,
                        width: 135.w,
                        ishealthForm: true,
                        text: healthInsurancePlanSelectionController
                            .SelectProposerList[index].text,
                        isSelected: RxBool(
                          healthInsurancePlanSelectionController
                              .SelectProposerList[index].isChecked,
                        ),
                        onClick: () {
                          healthInsurancePlanSelectionController
                              .OnProposerChange(index);
                        },
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(width: 10.w);
                    },
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                'prospers_details'.tr,
                style: Ts.bold15(AppColors.secondaryColor),
              ),
              SizedBox(height: 16.h),

              //for name as id
              BorderTextField(
                key: Key('full_namee_key'),
                hintText: 'full_name_as_per_id_card'.tr,
                titleText: 'full_name_as_per_id_card'.tr + "*",
                controller: healthInsurancePlanSelectionController
                    .NameAsIDController.value,
                onValidate: (val) {
                  if (val.toString().isEmpty) {
                    return 'please_name_as_per_id_card'.tr;
                  } else if (!formFieldValidExpression.nameValid
                      .hasMatch(val)) {
                    return 'invalid_name_format'.tr;
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 16.h),

              //for gender
              DropDown(
                field_label: 'select_gender'.tr + "*",
                dropdown_values: ['Male', 'Female', 'Other'],
              ),

              //for pancard
              BorderTextField(
                key: Key('pancard_key'),
                hintText: 'pan_card'.tr,
                titleText: 'pan_card'.tr + "*",
                maxLength: 10,
                controller: healthInsurancePlanSelectionController
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
              SizedBox(height: 24.h),

              //contact detail
              Text(
                'contact_details'.tr,
                style: Ts.bold15(AppColors.secondaryColor),
              ),
              SizedBox(height: 16.h),

              //for email
              BorderTextField(
                key: Key('email_address_key'),
                hintText: 'email_address'.tr,
                titleText: 'email_address'.tr,
                controller: healthInsurancePlanSelectionController
                    .EmailController.value,
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

              //mobile number drop down
              DropDown(
                field_label: 'mobile'.tr + "*",
                dropdown_values: ['4835789357', '48357891235', '8625411203'],
              ),

              //emergency drop down
              BorderTextField(
                key: Key('emergency_mob_no_key'),
                hintText: 'emergency_mob_no'.tr,
                titleText: 'emergency_mob_no'.tr + "*",
                maxLength: 10,
                textInputType: TextInputType.phone,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                controller: healthInsurancePlanSelectionController
                    .EmergencyNoController.value,
                onValidate: (val) {
                  if (val.toString().isEmpty) {
                    return 'please_enter_emergency_no'.tr;
                  } else if (!formFieldValidExpression.mobileValid
                      .hasMatch(val)) {
                    return 'invalid_mobile_no_format'.tr;
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 12.h),
            ],
          ),
        ),
      ),
    );
  }
}
