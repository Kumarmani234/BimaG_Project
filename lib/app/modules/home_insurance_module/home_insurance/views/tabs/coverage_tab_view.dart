// ignore_for_file: must_be_immutable

import 'package:bima_g/app/form_validation_expressions.dart';
import 'package:bima_g/app/widgets/textfields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../utility/colors.dart';
import '../../../../../../utility/mask_input_formatter.dart';
import '../../../../../../utility/ts.dart';
import '../../../../../module_controllers.dart';
import '../../../../../widgets/checkboxes.dart';

class CoverageTabView extends GetView {
  FormFieldValidExpression formFieldValidExpression =
      FormFieldValidExpression();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Form(
          key: homeInsuranceController.coverageTabFormKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'what_do_u_want_to_insure'.tr,
                  style: Ts.bold15(AppColors.secondaryColor),
                ),
                SizedBox(height: 16.h),
                Obx(
                  () => ListView.separated(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: homeInsuranceController.insureHouseList.length,
                    itemBuilder: (ctx, index) => CheckboxWithTextIconView(
                      imageUrl: homeInsuranceController
                          .insureHouseList[index].imageUrl,
                      isSelected: RxBool(homeInsuranceController
                          .insureHouseList[index].isSelected),
                      title_text: homeInsuranceController
                          .insureHouseList[index].title
                          .toString(),
                      subtitle_text: homeInsuranceController
                          .insureHouseList[index].subtitle
                          .toString(),
                      onClick: () {
                        homeInsuranceController.onInsureCoverageChange(index);
                      },
                    ),
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(height: 16.h),
                  ),
                ),
                SizedBox(height: 20.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'enter_building_n_carpet_area'.tr,
                      style: Ts.bold15(AppColors.secondaryColor),
                    ),
                    SizedBox(height: 16.h),
                    BorderTextField(
                      key: Key('value_of_building_key'),
                      hintText: 'enter_value_of_building'.tr,
                      titleText: 'value_of_building'.tr + "*",
                      textInputType: TextInputType.number,
                      controller:
                          homeInsuranceController.buildingValueController.value,
                      maxLength: 12,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        CommaFormatter(),
                      ],
                      onValidate: (val) {
                        if (val.toString().isEmpty) {
                          return 'please_enter_building_value'.tr;
                        } else if (!formFieldValidExpression.rsValid
                            .hasMatch(val)) {
                          return 'invalid_name_format'.tr;
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 12.h),
                    BorderTextField(
                      key: Key('value_of_household_items_key'),
                      hintText: 'enter_value_of_household_items'.tr,
                      titleText: 'value_of_household_item'.tr + "*",
                      textInputType: TextInputType.number,
                      maxLength: 11,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        CommaFormatter(),
                      ],
                      controller:
                          homeInsuranceController.householdController.value,
                      onValidate: (val) {
                        if (val.toString().isEmpty) {
                          return 'please_enter_household_items_value'.tr;
                        } else if (!formFieldValidExpression.rsValid
                            .hasMatch(val)) {
                          return 'invalid_household_items_value_format'.tr;
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 12.h),
                    Obx(
                      () => BorderTextField(
                        key: Key('carpet_area_key'),
                        hintText: 'enter_carpet_area'.tr,
                        titleText: 'carpet_area'.tr + "*",
                        textInputType: TextInputType.number,
                        maxLength: 6,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          CommaFormatter(),
                        ],
                        controller:
                            homeInsuranceController.carpetController.value,
                        onValidate: (val) {
                          if (val.toString().isEmpty) {
                            return 'please_enter_carpet_area'.tr;
                          } else if (!formFieldValidExpression.rsValid
                              .hasMatch(val)) {
                            return 'invalid_carpet_area_format'.tr;
                          } else {
                            return null;
                          }
                        },
                        onChange: (Value) {
                          // Parse the building value and carpet area
                          final buildingValue = int.tryParse(
                              homeInsuranceController
                                  .buildingValueController.value.text
                                  .replaceAll(',', ''));
                          final carpetArea = int.tryParse(
                              homeInsuranceController
                                  .carpetController.value.text
                                  .replaceAll(',', ''));

                          // Calculate the cost of construction
                          final costOfConstruction = buildingValue != null &&
                                  carpetArea != null &&
                                  carpetArea > 0
                              ? (buildingValue / carpetArea).toStringAsFixed(2)
                              : '';

                          // Update the text in the cost of construction field
                          homeInsuranceController.constructionController.value
                              .text = costOfConstruction;
                        },
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Obx(
                      () => BorderTextField(
                        key: Key('cost_of_construction_key'),
                        hintText: 'enter_cost_of_construction'.tr,
                        titleText: 'cost_of_construction'.tr + "*",
                        readOnly: true,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        controller: homeInsuranceController
                            .constructionController.value,
                        // onValidate: (val) {
                        //   if (val.toString().isEmpty) {
                        //     return 'please_enter_cost_of_construction'.tr;
                        //   } else if (!formFieldValidExpression.rsDotValid
                        //       .hasMatch(val)) {
                        //     return 'invalid_construction_cost_format'.tr;
                        //   } else {
                        //     return null;
                        //   }
                        // },
                      ),
                    ),
                    SizedBox(height: 30.h),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
