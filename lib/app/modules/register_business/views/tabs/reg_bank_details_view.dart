// ignore_for_file: must_be_immutable

import 'package:bima_g/app/form_validation_expressions.dart';
import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/modules/fetch_address/views/fetch_address_view.dart';
import 'package:bima_g/app/widgets/textfields.dart';
import 'package:bima_g/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../utility/ts.dart';

class RegBankDetailsView extends GetView {
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
            key: Key('account_number_key'),
            hintText: 'enter_account_number'.tr,
            titleText: 'account_number'.tr,
            controller: registerBusinessController.accountnoController.value,
            maxLength: 17,
            textInputType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            isfill: true,
            onValidate: (val) {
              if (val.toString().isEmpty) {
                return 'please_enter_account_no'.tr;
              } else if (!formFieldValidExpression.numberValid.hasMatch(val)) {
                return 'invalid_account_number_format'.tr;
              } else {
                return null;
              }
            },
          ),
          SizedBox(height: 16.h),
          BorderTextField(
            key: Key('ifsc_code_key'),
            hintText: 'enter_ifcs_code'.tr,
            titleText: 'ifcs_code'.tr,
            maxLength: 11,
            controller: registerBusinessController.ifcsController.value,
            textCapitalization: TextCapitalization.characters,
            isfill: true,
            onValidate: (val) {
              if (val.toString().isEmpty) {
                return 'please_enter_ifcd_code'.tr;
              }
              // else if (!formFieldValidExpression.alphaNumValid
              //     .hasMatch(val)) {
              //   return 'invalid_account_number_format'.tr;
              // }
              else {
                return null;
              }
            },
          ),
          SizedBox(height: 16.h),
          Text(
            'These details has been auto fetched as per your IFCS Code & Account Number. ',
            style: Ts.regular12(AppColors.grey4),
          ),
          SizedBox(height: 16.h),
          BorderTextField(
            key: Key('bank_name_key'),
            hintText: 'enter_bank_name'.tr,
            titleText: 'bank_name'.tr,
            controller: registerBusinessController.bankNameController.value,
            isfill: true,
            onValidate: (val) {
              if (val.toString().isEmpty) {
                return 'please_enter_bank_name'.tr;
              } else {
                return null;
              }
            },
          ),
          SizedBox(height: 16.h),
          BorderTextField(
            key: Key('branch_name_key'),
            hintText: 'enter_branch_name'.tr,
            titleText: 'branch_name'.tr,
            controller: registerBusinessController.branchNameController.value,
            isfill: true,
            onValidate: (val) {
              if (val.toString().isEmpty) {
                return 'please_enter_branch_name'.tr;
              } else {
                return null;
              }
            },
          ),
          SizedBox(height: 16.h),
          BorderTextField(
            key: Key('name_key'),
            hintText: 'enter_name'.tr,
            titleText: 'name'.tr,
            controller:
                registerBusinessController.nameInBankDetailController.value,
            onValidate: (val) {
              if (val.toString().isEmpty) {
                return 'please_enter_name'.tr;
              } else if (!formFieldValidExpression.nameValid.hasMatch(val)) {
                return 'invalid_name_format'.tr;
              } else {
                return null;
              }
            },
            isfill: true,
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
