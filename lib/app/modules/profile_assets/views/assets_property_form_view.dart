// ignore_for_file: must_be_immutable

import 'package:bima_g/app/form_validation_expressions.dart';
import 'package:bima_g/utility/ts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../utility/colors.dart';
import '../../../../utility/mask_input_formatter.dart';
import '../../../module_controllers.dart';
import '../../../widgets/field_with_radio_view.dart';
import '../../../widgets/textfields.dart';

class AssetsPropertyFormView extends GetView {
  FormFieldValidExpression formFieldValidExpression =
      FormFieldValidExpression();
  AssetsPropertyFormView();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BorderTextField(
            key: Key('city_field_key'),
            hintText: 'enter_city_name'.tr,
            titleText: 'city'.tr + "*",
            controller: profileAssetsController.assetsCityNameController.value,
            onValidate: (val) {
              if (val.toString().isEmpty) {
                return 'please_enter_city_name'.tr;
              } else if (!formFieldValidExpression.alphanumSpaceValid
                  .hasMatch(val)) {
                return 'invalid_city_name_format'.tr;
              } else {
                return null;
              }
            },
          ),
          SizedBox(height: 12.h),
          BorderTextField(
            key: Key('age_of_property_key'),
            hintText: 'age_of_property'.tr,
            titleText: 'age_of_property'.tr + "*",
            maxLength: 2,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            controller:
                profileAssetsController.assetsAgePropertyController.value,
            textInputType: TextInputType.number,
            onValidate: (val) {
              if (val.toString().isEmpty) {
                return 'please_enter_property_age'.tr;
              } else if (!formFieldValidExpression.propertyAgeValid
                  .hasMatch(val)) {
                return 'invalid_structure_value_format'.tr;
              } else {
                return null;
              }
            },
          ),
          SizedBox(height: 12.h),
          /*DropDown(
            field_label: 'age_of_property'.tr + "*",
            dropdown_values: [
              '< 5 Years',
              '< 10 Years',
              '> 5 Years',
              '> 10 Years'
            ],
          ),*/
          BorderTextField(
            key: Key('structure_value_key'),
            hintText: 'enter_structure_value'.tr,
            titleText: 'structure_value'.tr,
            maxLength: 12,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              CommaFormatter(),
            ],
            controller:
                profileAssetsController.asetsStructureValueController.value,
            textInputType: TextInputType.number,
            onValidate: (val) {
              if (val.toString().isEmpty) {
                return 'please_enter_structure_value'.tr;
              } else if (!formFieldValidExpression.rsValid.hasMatch(val)) {
                return 'invalid_structure_value_format'.tr;
              } else {
                return null;
              }
            },
          ),
          SizedBox(height: 20.h),
          Text(
            'do_you_have_home_insurance'.tr,
            style: Ts.regular12(AppColors.grey5),
          ),
          SizedBox(height: 10.h),
          Container(
            height: 48.h,
            child: Obx(
              () => ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return FieldWithRadioView(
                    height: 48.h,
                    width: 132.w,
                    ishealthForm: true,
                    text:
                        profileAssetsController.StructureValueList[index].text,
                    isSelected: RxBool(profileAssetsController
                        .StructureValueList[index].isChecked),
                    onClick: () {
                      profileAssetsController.onStructureValueChange(index);
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(width: 10.w);
                },
                itemCount: profileAssetsController.StructureValueList.length,
              ),
            ),
          ),
          SizedBox(
            height: 12.h,
          ),

          /*Obx(
                () => DatePickerBimaG(
              hintText: 'enter_policy_expiry_date'.tr,
              titleText: 'policy_expiry_date'.tr,
              initialDate: profileAssetsController.selectedExpiryDate.value,
              onTap: (date, formattedDate) {
                profileAssetsController.selected.value = date;
              },
            ),
          ),
*/
          Obx(
            () => BorderTextField(
              key: Key('assets_policy_expire_date_key'),
              readOnly: true,
              onTap: () async {
                profileAssetsController
                    .onProperyAssExpiryDatePickerTap(context);
              },
              hintText: 'enter_policy_expiry_date'.tr,
              titleText: 'policy_expiry_date'.tr,
              controller:
                  profileAssetsController.expiryPropertyDatecontroller.value,
              onValidate: (val) {
                if (profileAssetsController.StructureValueList[0].isChecked) {
                  if (val.toString().isEmpty) {
                    return 'please_enter_date'.tr;
                  } else if (!formFieldValidExpression.dateValidExpression
                      .hasMatch(val)) {
                    return 'invalid_date_format'.tr;
                  } else {
                    return null;
                  }
                } else {
                  if (val.toString().isEmpty) {
                    return null;
                  }
                }
              },
              suffixIcon: Icon(Icons.date_range),
            ),
          ),
        ],
      ),
    );
  }
}
