// ignore_for_file: must_be_immutable

import 'package:bima_g/app/form_validation_expressions.dart';
import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/widgets/drop_down.dart';
import 'package:bima_g/utility/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../utility/colors.dart';
import '../../../../../../utility/ts.dart';
import '../../../../../data/models/ResNameIdList.dart';
import '../../../../../widgets/field_with_radio_view.dart';
import '../../../../../widgets/textfields.dart';

class SecondTabAsNomineeView extends GetView {
  FormFieldValidExpression formFieldValidExpression =
      FormFieldValidExpression();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
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
              //for nominnee name
              BorderTextField(
                key:Key('nominee_name_key'),
                hintText: 'user_nominees_name'.tr,
                titleText: 'nominees_name'.tr + "*",
                controller: twoWheelerPlanSelectionController
                    .nominee_nameController.value,
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

              //fror relation drop down
              //relation
              DropDown2<ResNameIdList>(
                  key:Key('relation_key'),
                  field_label: 'relationship'.tr + "*",
                  dropdown_values: Utils.getRelationsList(),
                  hint_text: 'relationship'.tr,
                  onChange: (ResNameIdList res) {
                    twoWheelerPlanSelectionController.selectedNomeeniRelation =
                        res.id ?? '';
                  },
                  itemBuilder: (ctx, ResNameIdList val) =>
                      Text(val.name ?? '')),

              BorderTextField(
                key:Key('nominee_age_key'),
                controller: twoWheelerPlanSelectionController
                    .nominee_ageController.value,
                maxLength: 3,
                textInputType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onValidate: (val) {
                  if (val.toString().isEmpty) {
                    return 'please_enter_nominee_age'.tr;
                  } else if (!formFieldValidExpression.ageValid.hasMatch(val)) {
                    return 'invalid_age_format'.tr;
                  } else {
                    return null;
                  }
                },
                hintText: 'user_nominees_age'.tr,
                titleText: 'nominee_age'.tr + ' (in year)' + "*",
              ),
              SizedBox(height: 16.h),

              //for gender selection
              Text(
                'gender'.tr + "*",
                style: Ts.regular12(AppColors.grey5),
              ),
              SizedBox(height: 6.h),
              SelectGenderView(
                key:Key('gender_key'),
                selectedGender:
                    twoWheelerPlanSelectionController.proposalTabNomineeGender,
                onSelectGender: (gender) => twoWheelerPlanSelectionController
                    .proposalTabNomineeGender = gender.toString(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
