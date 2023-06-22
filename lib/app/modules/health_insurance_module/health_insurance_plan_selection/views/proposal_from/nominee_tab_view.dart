// ignore_for_file: must_be_immutable

import 'package:bima_g/app/form_validation_expressions.dart';
import 'package:bima_g/app/module_controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../utility/colors.dart';
import '../../../../../../utility/ts.dart';
import '../../../../../../utility/utils.dart';
import '../../../../../data/models/ResNameIdList.dart';
import '../../../../../widgets/date_of_birth.dart';
import '../../../../../widgets/drop_down.dart';
import '../../../../../widgets/field_with_radio_view.dart';
import '../../../../../widgets/textfields.dart';

class NomineeTabView extends GetView {
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
                'tell_us_who_you_want_to_make_nominee'.tr,
                style: Ts.bold15(AppColors.secondaryColor),
              ),
              SizedBox(height: 16.h),
              Text(
                'select_nominee'.tr,
                style: Ts.bold14(AppColors.secondaryColor),
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
                        width: 135.w,
                        ishealthForm: true,
                        text: healthInsurancePlanSelectionController
                            .selectNomineeList[index].text,
                        isSelected: RxBool(
                            healthInsurancePlanSelectionController
                                .selectNomineeList[index].isChecked),
                        onClick: () {
                          healthInsurancePlanSelectionController
                              .onNomineeChange(index);
                        },
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(width: 10.w);
                    },
                    itemCount: healthInsurancePlanSelectionController
                        .selectNomineeList.length,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                'give_us_the_details_of_nominee_to_be'.tr,
                style: Ts.bold15(AppColors.secondaryColor),
              ),
              SizedBox(height: 16.h),

              //relation
              DropDown2<ResNameIdList>(
                key: Key('relation_type_key'),
                  field_label: 'relationship'.tr + "*",
                  dropdown_values: Utils.getRelationsList(),
                  hint_text: 'relationship'.tr,
                  onChange: (ResNameIdList res){
                    healthInsurancePlanSelectionController.selectedNomeeniRelation = res.id ?? '';
                  },
                  itemBuilder: (ctx,ResNameIdList val)=>Text(val.name ?? '')
              ),

              //name of nominee
              BorderTextField(
                key: Key('nominee_full_name_key'),
                hintText: 'Govind Singh Rathor',
                titleText: 'nominee_full_name'.tr + "*",
                controller: healthInsurancePlanSelectionController
                    .NomineeFullNameController.value,
                onValidate: (val) {
                  if (val.toString().isEmpty) {
                    return 'please_enter_nominee_full_name'.tr;
                  } else if (!formFieldValidExpression.nameValid
                      .hasMatch(val)) {
                    return 'invalid_name_format'.tr;
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 16.h),

              //date foramat
              Obx(
                () => DateOfBirthWidget(
                  key: Key('date_of_birth_key'),
                  onTap: (DateTime dbDate, String formattedDate) {
                    print('formatted data: $formattedDate');
                    healthInsurancePlanSelectionController
                        .selectedNomDate.value = dbDate;
                    healthInsurancePlanSelectionController
                        .NominneDateController.value.text = formattedDate;
                  },
                  controller: healthInsurancePlanSelectionController
                      .NominneDateController.value,
                ),
              ),
              SizedBox(height: 10.h),

              //for contact number
              BorderTextField(
                key: Key('contact_no_key'),
                hintText: '9323785690',
                titleText: 'contact_number'.tr + "*",
                maxLength: 10,
                controller: healthInsurancePlanSelectionController
                    .ContactNoController.value,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                textInputType: TextInputType.phone,
                onValidate: (val) {
                  if (val.toString().isEmpty) {
                    return 'please_enter_contact_no'.tr;
                  } else if (!formFieldValidExpression.mobileValid
                      .hasMatch(val)) {
                    return 'invalid_mobile_no_format'.tr;
                  } else {
                    return null;
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
