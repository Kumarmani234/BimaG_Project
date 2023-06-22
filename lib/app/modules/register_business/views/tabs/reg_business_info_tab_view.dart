// ignore_for_file: must_be_immutable

import 'package:bima_g/app/form_validation_expressions.dart';
import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/modules/fetch_address/views/fetch_address_view.dart';
import 'package:bima_g/app/widgets/drop_down.dart';
import 'package:bima_g/app/widgets/textfields.dart';
import 'package:bima_g/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../utility/ts.dart';
import '../../../../widgets/field_with_radio_view.dart';

class RegBusinessInfoTabView extends GetView {
  FormFieldValidExpression formFieldValidExpression =
      FormFieldValidExpression();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'do_u_have_gstin'.tr,
            style: Ts.regular14(AppColors.secondaryColor),
          ),
          SizedBox(height: 10.h),
          SelectYesOrNoView(
            onSelection: (per) =>
                registerBusinessController.selectGSTIN = per.toString(),
            selectPermission: registerBusinessController.selectGSTIN,
          ),
          SizedBox(height: 16.h),
          Obx(
            () => BorderTextField(
              key: Key('gst_no_key'),
              hintText: 'enter_gst_no'.tr,
              titleText: 'gst_no'.tr,
              controller: registerBusinessController.gstnoController.value,
              isfill: true,
              maxLength: 15,
              onValidate: (val) {
                if (registerBusinessController.selectGSTIN == 'Yes') {
                  if (val.toString().isEmpty) {
                    return 'please_enter_gst_no'.tr;
                  }
                  // else if (!formFieldValidExpression.nameValid
                  //     .hasMatch(val)) {
                  //   return 'invalid_gst_no_format'.tr;
                  // }
                  else {
                    return null;
                  }
                }
              },
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            'auto_fetch_detail_text'.tr,
            style: Ts.regular12(AppColors.grey4),
          ),
          SizedBox(height: 16.h),
          BorderTextField(
            key: Key('garage_name_key'),
            hintText: 'enter_garage_name'.tr,
            titleText: 'garage_name'.tr,
            controller: registerBusinessController.garageNameController.value,
            isfill: true,
          ),
          SizedBox(height: 16.h),
          drop_down(
            isfill: true,
            field_label: 'business_subcategory'.tr,
            hint_text: '',
            is_dropdown_field: true,
            dropdown_values: ['General Hospital ', 'Personal Clinic'],
          ),
          BorderTextField(
            key: Key('company_pan_key'),
            hintText: 'enter_company_pan'.tr,
            titleText: 'company_pan'.tr,
            controller: registerBusinessController.companyPanController.value,
            isfill: true,
          ),
          SizedBox(height: 16.h),
          BorderTextField(
            key: Key('business_type_key'),
            hintText: 'enter_business_type'.tr,
            titleText: 'business_type'.tr,
            controller: registerBusinessController.businessTypeController.value,
            isfill: true,
          ),
          SizedBox(height: 16.h),
          drop_down(
            key: Key('established_year_key'),
            isfill: true,
            field_label: 'established_year'.tr,
            hint_text: '',
            is_dropdown_field: true,
            dropdown_values: bikeInsuranceController.yearList,
          ),
          drop_down(
            isfill: true,
            field_label: 'select_business_cat'.tr,
            hint_text: '',
            is_dropdown_field: true,
            dropdown_values: ['Vehicle Repairing', 'Vehicle Servicing'],
          ),
          BorderTextField(
            key: Key('business_mo_no_key'),
            hintText: 'enter_business_mo_no'.tr,
            titleText: 'business_mo_no'.tr,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            maxLength: 10,
            textInputType: TextInputType.phone,
            controller: registerBusinessController.businessMoNoController.value,
            isfill: true,
          ),
          SizedBox(height: 16.h),
          Text(
            'business_mo_no_same_as_whatsapp'.tr,
            style: Ts.regular14(AppColors.secondaryColor),
          ),
          SizedBox(height: 14.h),
          SelectYesOrNoView(
            onSelection: (per) =>
                registerBusinessController.selectwappNo = per.toString(),
            selectPermission: registerBusinessController.selectwappNo,
          ),
          SizedBox(height: 16.h),
          Obx(
            () => BorderTextField(
              key: Key('whatsapp_no_key'),
              hintText: 'enter_whatsapp_no'.tr,
              titleText: 'whatsapp_no'.tr,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              maxLength: 10,
              textInputType: TextInputType.phone,
              controller: registerBusinessController.whatsappController.value,
              isfill: true,
            ),
          ),
          SizedBox(height: 16.h),
          BorderTextField(
            key: Key('business_email_add_key'),
            hintText: 'useremailadd@domain.com',
            titleText: 'business_email_add'.tr,
            textInputType: TextInputType.emailAddress,
            controller:
                registerBusinessController.businessEmailController.value,
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
