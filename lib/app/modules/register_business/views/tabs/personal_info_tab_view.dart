// ignore_for_file: must_be_immutable
import 'package:bima_g/app/form_validation_expressions.dart';
import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/modules/fetch_address/views/fetch_address_view.dart';
import 'package:bima_g/app/widgets/date_of_birth.dart';
import 'package:bima_g/app/widgets/textfields.dart';
import 'package:bima_g/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../utility/ts.dart';
import '../../../../widgets/field_with_radio_view.dart';

class PersonalInfoTabView extends GetView {
  FormFieldValidExpression formFieldValidExpression =
      FormFieldValidExpression();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BorderTextField(
            key: Key('name_key'),
            hintText: 'enter_name'.tr,
            titleText: 'name'.tr + "*",
            controller: registerBusinessController.nameController.value,
            isfill: true,
            onValidate: (val) {
              if (val.toString().isEmpty) {
                return 'please_enter_name'.tr;
              } else if (!formFieldValidExpression.nameValid.hasMatch(val)) {
                return 'invalid_name_format'.tr;
              } else {
                return null;
              }
            },
          ),
          SizedBox(height: 16.h),
          Obx(
            () => DateOfBirthWidget(
              key: Key('d_o_b_key'),
              isfill: true,
              onTap: (DateTime dbDate, String formattedDate) {
                print('formatted data: $formattedDate');
                registerBusinessController.selectedDate.value = dbDate;
                registerBusinessController.birthdateController.value.text =
                    formattedDate;
              },
              controller: registerBusinessController.birthdateController.value,
            ),
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
            onSelectGender: (gender) => registerBusinessController
                .selectedProfileInfoGender = gender.toString(),
          ),
          SizedBox(height: 16.h),
          BorderTextField(
            key: Key('mobile_number_key'),
            hintText: 'enter_mobile_number'.tr,
            titleText: 'mobile_number'.tr + "*",
            controller: registerBusinessController.mobilenoController.value,
            isfill: true,
            textInputType: TextInputType.phone,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            maxLength: 10,
            onValidate: (val) {
              if (val.toString().isEmpty) {
                return 'please_enter_mo_no'.tr;
              } else if (!formFieldValidExpression.mobileValid.hasMatch(val)) {
                return 'invalid_mobile_no_format'.tr;
              } else {
                return null;
              }
            },
          ),
          SizedBox(height: 16.h),
          BorderTextField(
            key: Key('alt_mo_no_key'),
            hintText: 'enter_alt_mo_no'.tr,
            titleText: 'alt_mo_no'.tr,
            controller: registerBusinessController.altMobilenoController.value,
            textInputType: TextInputType.phone,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            maxLength: 10,
            isfill: true,
            onValidate: (val) {
              if (val.toString().isEmpty) {
                return null;
              } else if (!formFieldValidExpression.mobileValid.hasMatch(val)) {
                return 'invalid_mobile_no_format'.tr;
              } else {
                return null;
              }
            },
          ),
          SizedBox(height: 16.h),
          BorderTextField(
            isfill: true,
            hintText: 'useremailadd@domain.com'.tr,
            titleText: 'email_address'.tr,
            controller: registerBusinessController.emailController.value,
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
          FetchAddressView(
            isfill: true,
          ),
        ],
      ),
    );
  }
}
