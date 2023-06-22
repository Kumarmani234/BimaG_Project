// ignore_for_file: must_be_immutable

import 'package:bima_g/app/form_validation_expressions.dart';
import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/widgets/textfields.dart';
import 'package:bima_g/utility/colors.dart';
import 'package:bima_g/utility/ts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../widgets/date_of_birth.dart';
import '../../../../../widgets/drop_down.dart';

class PersonalDetailTabView extends GetView {
  FormFieldValidExpression formFieldValidExpression =
      FormFieldValidExpression();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.white,
      ),
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'great_let’s_start_with_proposer_details'.tr,
              style: Ts.bold15(AppColors.secondaryColor),
            ),
            SizedBox(height: 16.h),
            Text(
              'prospers_details'.tr,
              style: Ts.bold15(AppColors.secondaryColor),
            ),
            SizedBox(height: 12.h),

            //for name as id
            BorderTextField(
              key: Key('full_name_key'),
              hintText: 'full_name_as_per_id_card'.tr,
              titleText: 'full_name_as_per_id_card'.tr + "*",
              controller:
                  homeInsurancePlanSelectionController.fullNameController.value,
              onValidate: (val) {
                if (val.toString().isEmpty) {
                  return 'please_name_as_per_id_card'.tr;
                } else if (!formFieldValidExpression.nameValid.hasMatch(val)) {
                  return 'invalid_name_format'.tr;
                } else {
                  return null;
                }
              },
            ),
            SizedBox(height: 12.h),

            //select gender
            DropDown(
              key: Key('select_gender_key'),
              field_label: 'select_gender' + "*",
              dropdown_values: ['Female', 'Male', 'Other'],
            ),

            //for date
            Obx(
              () => DateOfBirthWidget(
                key: Key('dob_key'),
                onTap: (DateTime dbDate, String formattedDate) {
                  print('formatted data: $formattedDate');
                  healthInsurancePlanSelectionController.selectedDate.value =
                      dbDate;
                  homeInsurancePlanSelectionController
                      .birhtDateController.value.text = formattedDate;
                },
                controller: homeInsurancePlanSelectionController
                    .birhtDateController.value,
              ),
            ),
            SizedBox(height: 20.h),

            //contact details
            Text(
              'contact_details'.tr,
              style: Ts.bold15(AppColors.secondaryColor),
            ),
            SizedBox(height: 20.h),

            //for email
            BorderTextField(
              key: Key('email_address_key'),
              hintText: 'sdlkfslkfj@gmail.com',
              titleText: 'email_address'.tr,
              controller:
                  homeInsurancePlanSelectionController.emailController.value,
              textInputType: TextInputType.emailAddress,
              onValidate: (val) {
                if (val.toString().isEmpty) {
                  return null;
                } else if (!formFieldValidExpression.emailValid.hasMatch(val)) {
                  return 'invalid_email_format'.tr;
                } else {
                  return null;
                }
              },
            ),
            SizedBox(height: 12.h),

            //mobile drop-down
            DropDown(
              key: Key('mobile_no_key'),
              dropdown_values: [
                '9835789357',
                '9835789123',
                '9835789956',
                '9835789000'
              ],
              field_label: 'mobile'.tr + "*",
            ),
          ],
        ),
      ),
    );
  }
}
