// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../utility/colors.dart';
import '../../../../../utility/ts.dart';
import '../../../../form_validation_expressions.dart';
import '../../../../module_controllers.dart';
import '../../../../widgets/date_of_birth.dart';
import '../../../../widgets/field_with_radio_view.dart';
import '../../../../widgets/textfields.dart';
import '../../../fetch_address/views/fetch_address_view.dart';

class InsurerPersonalInfoForm extends GetView {
  FormFieldValidExpression formFieldValidExpression =
      FormFieldValidExpression();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BorderTextField(
            key: Key('first_name_key'),
            isfill: true,
            hintText: 'user_first_name'.tr,
            titleText: 'first_name'.tr + "*",
            controller: agentAddInsurerController.firstNameController.value,
            onValidate: (val) {
              if (val.toString().isEmpty) {
                return 'please_enter_first_name'.tr;
              } else if (!formFieldValidExpression.nameValid.hasMatch(val)) {
                return 'invalid_name_format'.tr;
              } else {
                return null;
              }
            },
          ),
          SizedBox(height: 16.h),
          BorderTextField(
            key: Key('last_name_key'),
            isfill: true,
            hintText: 'user_last_name'.tr,
            titleText: 'last_name'.tr + "*",
            controller: agentAddInsurerController.lasttNameController.value,
            onValidate: (val) {
              if (val.toString().isEmpty) {
                return 'please_enter_last_name'.tr;
              } else if (!formFieldValidExpression.nameValid.hasMatch(val)) {
                return 'invalid_name_format'.tr;
              } else {
                return null;
              }
            },
          ),

          //phone number
          SizedBox(height: 16.h),
          BorderTextField(
            key: Key('mobile_no_key'),
            isfill: true,
            hintText: 'user_mobile_no'.tr,
            titleText: 'mobile_number'.tr,
            controller: agentAddInsurerController.mobileController.value,
            textInputType: TextInputType.phone,
            maxLength: 10,
            onValidate: (val) {
              if (val.toString().isEmpty) {
                return 'please_enter_mobile_no'.tr;
              } else if (!formFieldValidExpression.mobileValid.hasMatch(val)) {
                return 'invalid_mobile_no_format'.tr;
              } else {
                return null;
              }
            },
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),

          //email
          SizedBox(height: 16.h),
          BorderTextField(
            key: Key('email_address_key'),
            isfill: true,
            hintText: 'useremailadd@domain.com'.tr,
            titleText: 'email_address'.tr,
            controller: agentAddInsurerController.emailController.value,
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
          SizedBox(height: 16.h),
          Text(
            'gender'.tr + "*",
            style: Ts.regular12(
              AppColors.grey5,
            ),
          ),
          SizedBox(height: 10.h),
          SelectGenderView(
            onSelectGender: (gender) =>
                agentAddInsurerController.selectedGender = gender.toString(),
          ),
          SizedBox(height: 16.h),

          Obx(
            () => DateOfBirthWidget(
              key: Key('D_O_B_key'),
              isfill: true,
              onTap: (DateTime dbDate, String formattedDate) {
                print('formatted data: $formattedDate');
                agentAddInsurerController.selectedDate.value = dbDate;
                agentAddInsurerController.BirthDateController.value.text =
                    formattedDate;
              },
              controller: agentAddInsurerController.BirthDateController.value,
            ),
          ),
          SizedBox(height: 16.h),
          FetchAddressView(
            isfill: true,
          ),

          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}
