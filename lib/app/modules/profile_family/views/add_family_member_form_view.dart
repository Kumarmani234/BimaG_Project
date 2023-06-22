// ignore_for_file: must_be_immutable

import 'package:bima_g/app/data/models/ResNameIdList.dart';
import 'package:bima_g/app/form_validation_expressions.dart';
import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/widgets/buttons.dart';
import 'package:bima_g/app/widgets/date_of_birth.dart';
import 'package:bima_g/app/widgets/drop_down.dart';
import 'package:bima_g/app/widgets/textfields.dart';
import 'package:bima_g/utility/colors.dart';
import 'package:bima_g/utility/styles.dart';
import 'package:bima_g/utility/ts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../widgets/field_with_radio_view.dart';
import '../../insurance_appbar/views/insurance_appbar_view.dart';

class AddFamilyMemberFormView extends GetView {
  FormFieldValidExpression formFieldValidExpression =
      FormFieldValidExpression();

  GlobalKey<FormState> AddFamilyMemberFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: InsuranceAppbarView(
          title: 'add_a_family_member'.tr,
        ),
        preferredSize: Size.fromHeight(80.h),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: Form(
          key: AddFamilyMemberFormKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(8.w),
                    boxShadow: [
                      Styles.shadow(),
                    ]),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DropDown2<ResNameIdList>(
                        key: Key('relationship_dropdown_key'),
                          field_label: 'relationship'.tr + "*",
                          dropdown_values:
                              profileFamilyController.listRelation.value,
                          hint_text: 'relationship'.tr,
                          selectedValue:
                              profileFamilyController.selectedRelation,
                          onChange: (ResNameIdList res) {
                            profileFamilyController.selectedRelation = res;
                          },
                          itemBuilder: (ctx, ResNameIdList val) =>
                              Text(val.name ?? '')),
                      BorderTextField(
                        key: Key('member_full_name_key'),
                        hintText: 'member_full_name'.tr,
                        titleText: 'member_full_name'.tr + "*",
                        controller: profileFamilyController
                            .familyMemberNameController.value,
                        onValidate: (val) {
                          if (val.toString().isEmpty) {
                            return 'please_enter_member_name'.tr;
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
                          key: Key('DOB_key'),
                          initialDate: profileFamilyController
                              .selectedNewMemberBirthDate.value,
                          onTap: (DateTime dbDate, String formattedDate) {
                            print('formatted data: $formattedDate');
                            profileFamilyController
                                .selectedNewMemberBirthDate.value = dbDate;
                            profileFamilyController.familyMemberAgeController
                                .value.text = formattedDate;
                          },
                          controller: profileFamilyController
                              .familyMemberAgeController.value,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        'gender'.tr + "*",
                        style: Ts.regular12(
                          AppColors.grey5,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      SelectGenderView(
                        key: Key('gender_key'),
                        selectedGender:
                            profileFamilyController.selectedAddFamilyGender,
                        onSelectGender: (gender) => profileFamilyController
                            .selectedAddFamilyGender = gender.toString(),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomButton(
          key: Key('add_new_family_member_save_key'),
          text: 'save'.tr,
          buttonStatus: profileFamilyController.addMemberButtonStatus.value,
          onClick: () {
            if (AddFamilyMemberFormKey.currentState!.validate()) {
              profileFamilyController.addEditFamilyMember();
            } else {
              return;
            }
          },
        ),
      ),
    );
  }
}
