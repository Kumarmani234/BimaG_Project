// ignore_for_file: must_be_immutable

import 'package:bima_g/app/form_validation_expressions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../utility/colors.dart';
import '../../../../../../utility/ts.dart';
import '../../../../../module_controllers.dart';
import '../../../../../widgets/date_of_birth.dart';
import '../../../../../widgets/drop_down.dart';
import '../../../../../widgets/textfields.dart';

class MembersTabView extends GetView {
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
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'tell_us_details_of_member_to_be_insured'.tr,
                style: Ts.bold15(AppColors.secondaryColor),
              ),
              SizedBox(height: 16.h),
              Text(
                'Pushpendra Singh Rathor',
                style: Ts.bold14(AppColors.secondaryColor),
              ),
              SizedBox(height: 16.h),

              Obx(
                () => BorderTextField(
                  key: Key('D_o_B_key'),
                  readOnly: true,
                  onTap: () async {
                    healthInsurancePlanSelectionController
                        .onMemberDatePickerTap(context);
                  },
                  hintText: '31-01-1996',
                  titleText: 'dat_format'.tr + "*",
                  controller: healthInsurancePlanSelectionController
                      .DateController.value,
                  onValidate: (val) {
                    if (val.toString().isEmpty) {
                      return 'please_enter_date'.tr;
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

              SizedBox(height: 12.h),

              //for occupation
              BorderTextField(
                key: Key('occupation_key'),
                hintText: 'UI/UX Designer',
                titleText: 'occupation'.tr + "*",
                controller: healthInsurancePlanSelectionController
                    .OccupationController.value,
                onValidate: (val) {
                  if (val.toString().isEmpty) {
                    return 'please_enter_occupation'.tr;
                  }
                  // else if (!formFieldValidExpression.regularValid
                  //     .hasMatch(val)) {
                  //   return 'please_enter_valid_value'.tr;
                  // }
                  else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 16.h),

              //height drop-downs
              Row(
                children: [
                  SmallDropDown(
                    field_label: 'height_in_feet'.tr + "*",
                    dropdown_values:
                        healthInsurancePlanSelectionController.feet,
                  ),
                  Spacer(),
                  SmallDropDown(
                    field_label: 'height_in_inch'.tr + "*",
                    dropdown_values:
                        healthInsurancePlanSelectionController.inch,
                  ),
                ],
              ),

              // for weight
              BorderTextField(
                key: Key('weight_key'),
                hintText: '60 KG',
                titleText: 'weight_in_kg'.tr,
                controller: healthInsurancePlanSelectionController
                    .WeightController.value,
                textInputType: TextInputType.number,
                maxLength: 3,
                onValidate: (val) {
                  if (val.toString().isEmpty) {
                    return null;
                  } else if (!formFieldValidExpression.regularValid
                      .hasMatch(val)) {
                    return 'invalid_weight_format'.tr;
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 20.h),

              //for spouse info
              Text(
                'spouse'.tr,
                style: Ts.bold15(AppColors.secondaryColor),
              ),
              SizedBox(height: 16.h),

              //spouse name
              BorderTextField(
                key: Key('spouse_full_name'),
                hintText: 'Puran Kanwar',
                titleText: 'enter_spouse_full_name'.tr + "*",
                controller: healthInsurancePlanSelectionController
                    .SpouseNameController.value,
                onValidate: (val) {
                  if (val.toString().isEmpty) {
                    return 'please_enter_spouse_full_name'.tr;
                  } else if (!formFieldValidExpression.nameValid
                      .hasMatch(val)) {
                    return 'invalid_name_format'.tr;
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 12.h),

              Obx(
                () => DateOfBirthWidget(
                  key: Key('born_date_key'),
                  onTap: (DateTime dbDate, String formattedDate) {
                    print('formatted data: $formattedDate');
                    healthInsurancePlanSelectionController.selectedDate.value =
                        dbDate;
                    healthInsurancePlanSelectionController
                        .SpouseDateController.value.text = formattedDate;
                  },
                  controller: healthInsurancePlanSelectionController
                      .SpouseDateController.value,
                ),
              ),
              SizedBox(height: 12.h),
              BorderTextField(
                key: Key('occupationn_key'),
                hintText: 'UI/UX Designer',
                titleText: 'occupation'.tr + "*",
                controller: healthInsurancePlanSelectionController
                    .SpouseOccupationController.value,
                onValidate: (val) {
                  if (val.toString().isEmpty) {
                    return 'please_enter_occupation'.tr;
                  }
                  // else if (!formFieldValidExpression.regularValid
                  //     .hasMatch(val)) {
                  //   return 'please_enter_valid_value'.tr;
                  // }
                  else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 12.h),
              Row(
                children: [
                  SmallDropDown(
                    field_label: 'height_in_feet'.tr + "*",
                    dropdown_values:
                        healthInsurancePlanSelectionController.feet,
                  ),
                  Spacer(),
                  SmallDropDown(
                    field_label: 'height_in_inch'.tr + "*",
                    dropdown_values:
                        healthInsurancePlanSelectionController.inch,
                  ),
                ],
              ),
              BorderTextField(
                key: Key('weightt_key'),
                hintText: '60 KG',
                titleText: 'weight_in_kg'.tr,
                controller: healthInsurancePlanSelectionController
                    .SpouseWeightController.value,
                textInputType: TextInputType.number,
                maxLength: 3,
                onValidate: (val) {
                  if (val.toString().isEmpty) {
                    return null;
                  } else if (!formFieldValidExpression.regularValid
                      .hasMatch(val)) {
                    return 'invalid_weight_format'.tr;
                  } else {
                    return null;
                  }
                },
              ),

              // Text(
              //   '1st Child',
              //   style: Ts.bold15(AppColors.secondaryColor),
              // ),
              // SizedBox(height: 16.h),
              // BorderTextField(
              //   hintText: 'Puran Kanwar',
              //   titleText: 'Enter Spouse\'s Full Name',
              //   controller: healthInsurancePlanSelectionController
              //       .SpouseNameController.value,
              //   textInputType: TextInputType.datetime,
              // ),
              // SizedBox(height: 12.h),
              // BorderTextField(
              //   hintText: '31-01-1996',
              //   titleText: 'DOB (DD-MM-YYYY)',
              //   controller: healthInsurancePlanSelectionController
              //       .DateController.value,
              //   textInputType: TextInputType.datetime,
              // ),
              // SizedBox(height: 12.h),
              // BorderTextField(
              //   hintText: 'UI/UX Designer',
              //   titleText: 'Occupation',
              //   controller: healthInsurancePlanSelectionController
              //       .OccupationController.value,
              // ),
              // SizedBox(height: 10.h),
              // Row(
              //   children: [
              //     SmallDropDown(
              //       field_label: 'Height (Feet)',
              //       dropdown_values: ['5 Feet', '6 Feet', '7 Feet'],
              //     ),
              //     SizedBox(width: 20.w),
              //     SmallDropDown(
              //       field_label: 'Height (Inch)',
              //       dropdown_values: ['4', '5', '6'],
              //     ),
              //   ],
              // ),
              // BorderTextField(
              //   hintText: '60 KG',
              //   titleText: 'Weight (KG)',
              //   controller: healthInsurancePlanSelectionController
              //       .WeightController.value,
              // ),
              SizedBox(height: 12.h),
            ],
          ),
        ),
      ),
    );
  }
}
