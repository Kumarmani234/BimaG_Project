// ignore_for_file: must_be_immutable

import 'package:bima_g/app/module_controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../utility/colors.dart';
import '../../../../../../utility/ts.dart';
import '../../../../../form_validation_expressions.dart';
import '../../../../../widgets/textfields.dart';

class HealthInsuranceSecondTabView extends GetView {
  FormFieldValidExpression formFieldValidExpression =
      FormFieldValidExpression();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: healthInsuranceController.ageTabFormKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'how_old_each_member'.tr,
              style: Ts.bold15(AppColors.secondaryColor),
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: Obx(
                () => SingleChildScrollView(
                  child: Column(
                    key: Key('age_key'),
                    children: [
                      for (int index = 0;
                          index <
                              healthInsuranceController
                                  .insuredMembersList.length;
                          index++)
                        if (healthInsuranceController
                                .insuredMembersList[index].isSelected &&
                            healthInsuranceController
                                .insuredMembersList[index].isChild)
                          Column(
                            children: [
                              for (int i = 0;
                                  i <
                                      healthInsuranceController
                                          .insuredMembersList[index].childCount;
                                  i++)
                                Column(
                                  children: [
                                    BorderTextField(
                                      controller: TextEditingController(
                                        text: healthInsuranceController
                                            .insuredMembersList[
                                                index /* + i + 1*/]
                                            .age
                                            .toString(),
                                      ),
                                      maxLength: 3,
                                      textInputType: TextInputType.number,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      onValidate: (val) {
                                        if (val.toString().isEmpty) {
                                          return 'please_enter_age'.tr;
                                        } else if (!formFieldValidExpression
                                            .ageValid
                                            .hasMatch(val)) {
                                          return 'invalid_age_format'.tr;
                                        } else {
                                          return null;
                                        }
                                      },
                                      onChange: (value) {
                                        healthInsuranceController
                                            .insuredMembersList[
                                                index /* + i + 1*/]
                                            .age = value;
                                      },
                                      hintText: 'enter_age'.tr,
                                      titleText:
                                          '${i + 1}${_getOrdinalSuffix(i + 1)} ${healthInsuranceController.insuredMembersList[index].memberType}\'s Age',
                                    ),
                                    SizedBox(height: 16.h),
                                  ],
                                )
                            ],
                          )
                        else if (healthInsuranceController
                            .insuredMembersList[index].isSelected)
                          Column(
                            children: [
                              BorderTextField(
                                controller: TextEditingController(
                                  text: healthInsuranceController
                                      .insuredMembersList[index].age
                                      .toString(),
                                ),
                                maxLength: 3,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                textInputType: TextInputType.number,
                                onValidate: (val) {
                                  if (val.toString().isEmpty) {
                                    return 'please_enter_age'.tr;
                                  } else if (!formFieldValidExpression.ageValid
                                      .hasMatch(val)) {
                                    return 'invalid_age_format'.tr;
                                  } else {
                                    return null;
                                  }
                                },
                                onChange: (value) {
                                  healthInsuranceController
                                      .insuredMembersList[index].age = value;
                                },
                                hintText: 'enter_age'.tr,
                                titleText: index == 0
                                    ? 'your_age'.tr
                                    : '${healthInsuranceController.insuredMembersList[index].memberType}\'s Age',
                              ),
                              SizedBox(height: 16.h),
                            ],
                          ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String _getOrdinalSuffix(int value) {
  switch (value % 10) {
    case 1:
      return 'st';
    case 2:
      return 'nd';
    case 3:
      return 'rd';
    default:
      return 'th';
  }
}
