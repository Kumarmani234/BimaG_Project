// ignore_for_file: must_be_immutable

import 'package:bima_g/app/form_validation_expressions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../utility/colors.dart';
import '../../../../../../utility/ts.dart';
import '../../../../../../utility/utils.dart';
import '../../../../../data/models/ResNameIdList.dart';
import '../../../../../module_controllers.dart';
import '../../../../../widgets/checkboxes.dart';
import '../../../../../widgets/drop_down.dart';
import '../../../../../widgets/textfields.dart';
import '../../../../fetch_address/views/fetch_address_view.dart';

class AddressDetailTabView extends GetView {
  FormFieldValidExpression formFieldValidExpression =
      FormFieldValidExpression();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.white,
        ),
        margin: EdgeInsets.all(16.h),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'property_address'.tr,
                style: Ts.bold15(AppColors.secondaryColor),
              ),
              SizedBox(height: 10.h),
              FetchAddressView(),
              SizedBox(height: 10.h),
              DropDown(
                key: Key('floor_no_key'),
                field_label: 'floor_no'.tr,
                dropdown_values: [
                  'Ground Floor',
                  'First Floor',
                  'Second Floor',
                  'Third Floor'
                ],
              ),
              SizedBox(height: 8.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () => RoundCheckBox(
                      onChange: () {
                        homeInsurancePlanSelectionController
                                .isCommAddressVisible.value =
                            !homeInsurancePlanSelectionController
                                .isCommAddressVisible.value;
                      },
                      isChecked: homeInsurancePlanSelectionController
                          .isCommAddressVisible.value,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: SizedBox(
                      height: 40.h,
                      child: Text(
                        'communication_address_is_same_as_property_address'.tr,
                        style: Ts.regular12(
                          AppColors.grey5,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 8.h),
              Obx(
                () => Visibility(
                  visible: homeInsurancePlanSelectionController
                      .isCommAddressVisible.value,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'communication_address'.tr,
                        style: Ts.bold15(AppColors.secondaryColor),
                      ),
                      SizedBox(height: 10.h),
                      FetchAddressView(),
                      SizedBox(height: 10.h),
                      DropDown(
                        field_label: 'floor_no'.tr,
                        dropdown_values: [
                          'Ground Floor',
                          'First Floor',
                          'Second Floor',
                          'Third Floor'
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () => RoundCheckBox(
                        onChange: () {
                          homeInsurancePlanSelectionController
                                  .isNominneeInfoVisible.value =
                              !homeInsurancePlanSelectionController
                                  .isNominneeInfoVisible.value;
                        },
                        isChecked: homeInsurancePlanSelectionController
                            .isNominneeInfoVisible.value),
                  ),
                  SizedBox(width: 10.w),
                  SizedBox(
                    height: 40.h,
                    width: 275.w,
                    child: Text(
                      'want_to_declare_nominne_information'.tr,
                      style: Ts.regular12(
                        AppColors.grey5,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Obx(
                () => Visibility(
                  visible: homeInsurancePlanSelectionController
                      .isNominneeInfoVisible.value,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BorderTextField(
                        key: Key('nominee_name_key'),
                        hintText: 'nominee_name'.tr,
                        titleText: 'nominee_name'.tr + "*",
                        controller: homeInsurancePlanSelectionController
                            .nomNameController.value,
                        onValidate: (val) {
                          if (val.toString().isEmpty) {
                            return 'please_enter_nominee_name'.tr;
                          } else if (!formFieldValidExpression.nameValid
                              .hasMatch(val)) {
                            return 'invalid_name_format'.tr;
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 12.h),
                      BorderTextField(
                        key: Key('nominee_age_key'),
                        hintText: 'nominee_age'.tr,
                        titleText: 'nominee_age'.tr + "*",
                        maxLength: 3,
                        textInputType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        controller: homeInsurancePlanSelectionController
                            .nomAgeController.value,
                        onValidate: (val) {
                          if (val.toString().isEmpty) {
                            return 'please_enter_nominee_age'.tr;
                          } else if (!formFieldValidExpression.ageValid
                              .hasMatch(val)) {
                            return 'invalid_age_format'.tr;
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 12.h),
                      //relation
                      DropDown2<ResNameIdList>(
                        key: Key('relationship_key'),
                          field_label: 'relationship'.tr + "*",
                          dropdown_values: Utils.getRelationsList(),
                          hint_text: 'relationship'.tr,
                          onChange: (ResNameIdList res){
                            homeInsurancePlanSelectionController.selectedNomeeniRelation = res.id ?? '';
                          },
                          itemBuilder: (ctx,ResNameIdList val)=>Text(val.name ?? '')
                      ),
                    ],
                  ),
                ),
              ),
//SizedBox(height: 8.h),
              SizedBox(
                height: 30.h,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Obx(
                      () => RoundCheckBox(
                          onChange: () {
                            homeInsurancePlanSelectionController
                                    .isLoanInfoVisible.value =
                                !homeInsurancePlanSelectionController
                                    .isLoanInfoVisible.value;
                          },
                          isChecked: homeInsurancePlanSelectionController
                              .isLoanInfoVisible.value),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Text(
                        'does_your_property_have_a_loan'.tr,
                        style: Ts.regular12(
                          AppColors.grey5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              Obx(
                () => Visibility(
                  visible: homeInsurancePlanSelectionController
                      .isLoanInfoVisible.value,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BorderTextField(
                        hintText: 'enter_bank_name'.tr,
                        titleText: 'bank_name'.tr + "*",
                        controller: homeInsurancePlanSelectionController
                            .bankController.value,
                        onValidate: (val) {
                          if (val.toString().isEmpty) {
                            return 'please_enter_bank_name'.tr;
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 12.h),
                      BorderTextField(
                        hintText: 'enter_branch_name'.tr,
                        titleText: 'branch_name'.tr + "*",
                        controller: homeInsurancePlanSelectionController
                            .branchController.value,
                        onValidate: (val) {
                          if (val.toString().isEmpty) {
                            return 'please_enter_branch_name'.tr;
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 12.h),
                      BorderTextField(
                        hintText: '389749827489',
                        titleText: 'account_number'.tr + "*",
                        textInputType: TextInputType.number,
                        maxLength: 17,
                        controller: homeInsurancePlanSelectionController
                            .accountnoController.value,
                        onValidate: (val) {
                          if (val.toString().isEmpty) {
                            return 'please_enter_account_no'.tr;
                          } else if (!formFieldValidExpression.numberValid
                              .hasMatch(val)) {
                            return 'invalid_account_number_format'.tr;
                          } else {
                            return null;
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
