// ignore_for_file: must_be_immutable

import 'package:bima_g/app/form_validation_expressions.dart';
import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/modules/fetch_address/views/fetch_address_view.dart';
import 'package:bima_g/app/modules/insurance_appbar/views/insurance_appbar_view.dart';
import 'package:bima_g/app/widgets/containers.dart';
import 'package:bima_g/utility/asset_paths.dart';
import 'package:bima_g/utility/colors.dart';
import 'package:bima_g/utility/styles.dart';
import 'package:bima_g/utility/ts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../widgets/buttons.dart';
import '../../../widgets/date_of_birth.dart';
import '../../../widgets/field_with_radio_view.dart';
import '../../../widgets/textfields.dart';
import '../../topbar_authentication/views/topbar_authentication_view.dart';
part '../../policies/views/profile_policies/view_plan_details.dart';

class ProfileBasicDetailsFormView extends GetView {
  final FormFieldValidExpression formFieldValidExpression =
      FormFieldValidExpression();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomButton(
        text: 'submit'.tr,
        onClick: () => authenticationController.onSubmitBasicDetails(),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40.h),
            TopbarAuthenticationView(
              isShowLogo: true,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
              child: Form(
                key: profileController.profileFormKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'basic_details'.tr,
                      style: Ts.medium24(Colors.black),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'basic_detail_desc'.tr,
                      style: Ts.regular15(AppColors.grey4),
                    ),
                    SizedBox(height: 24.h),
                    BorderTextField(
                      hintText: 'user_first_name'.tr,
                      titleText: 'first_name'.tr + "*",
                      controller: profileController.UserNameController.value,
                      onValidate: (val) {
                        if (val.toString().isEmpty) {
                          return 'please_enter_first_name'.tr;
                        } else if (!formFieldValidExpression.nameValid
                            .hasMatch(val)) {
                          return 'invalid_name_format'.tr;
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 16.h),
                    BorderTextField(
                      hintText: 'user_last_name'.tr,
                      titleText: 'last_name'.tr + "*",
                      controller: profileController.LastNameController.value,
                      onValidate: (val) {
                        if (val.toString().isEmpty) {
                          return 'please_enter_last_name'.tr;
                        } else if (!formFieldValidExpression.nameValid
                            .hasMatch(val)) {
                          return 'invalid_name_format'.tr;
                        } else {
                          return null;
                        }
                      },
                    ),

                    //phone number
                    SizedBox(height: 16.h),
                    BorderTextField(
                      hintText: ''.tr,
                      enabled: false,
                      titleText: 'mobile_number'.tr,
                      controller: profileController.MobileController.value,
                      textInputType: TextInputType.phone,
                      onValidate: (val) {},
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),

                    //email
                    SizedBox(height: 16.h),
                    BorderTextField(
                      hintText: 'useremailadd@domain.com'.tr,
                      titleText: 'email_address'.tr,
                      controller: profileController.EmailController.value,
                      textInputType: TextInputType.emailAddress,
                      onValidate: (val) {
                        if (val.toString().isEmpty) {
                          return null;
                        } else if (!formFieldValidExpression.emailValid
                            .hasMatch(val)) {
                          return 'invalid_email_format'.tr;
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'gender'.tr + "*",
                      style: Ts.regular12(
                        AppColors.grey5,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    SelectGenderView(
                      onSelectGender: (gender) => profileController
                          .selectedBasicProfileGender = gender.toString(),
                    ),
                    SizedBox(height: 16.h),

                    Obx(
                      () => DateOfBirthWidget(
                        onTap: (DateTime dbDate, String formattedDate) {
                          print('formatted data: $formattedDate');
                          profileController.selectedDate.value = dbDate;
                          profileController.BirthDateController.value.text =
                              formattedDate;
                        },
                        controller: profileController.BirthDateController.value,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    FetchAddressView(),

                    SizedBox(height: 16.h),
                    //password
                    Obx(
                      () => BorderTextField(
                        controller: profileController.passwordCon,
                        titleText: 'password'.tr,
                        hintText: 'hint_password'.tr,
                        maxLength: 16,
                        obscureText: profileController.isPasswordVisible.value,
                        onChange: (val) {},
                        onValidate: (val) {
                          if (val.toString().isEmpty) {
                            return 'hint_password'.tr;
                          } else if (val.toString().length < 8) {
                            return 'password_length_should_be_between_8_to_16'
                                .tr;
                          }
                          return null;
                        },
                        suffixIcon: IconButton(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onPressed: () {
                            profileController.isPasswordVisible.value =
                                !profileController.isPasswordVisible.value;
                          },
                          icon: Icon(
                            profileController.isPasswordVisible.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),

                    //confirm password
                    Obx(
                      () => BorderTextField(
                        controller: profileController.confirmPasswordCon,
                        titleText: 'confirm_password'.tr,
                        hintText: 'hint_confirm_password'.tr,
                        maxLength: 16,
                        obscureText:
                            profileController.isConPasswordVisible.value,
                        onChange: (val) {},
                        onValidate: (val) {
                          if (val.toString().isEmpty) {
                            return 'hint_confirm_password'.tr;
                          } else if (profileController
                                  .confirmPasswordCon.text !=
                              profileController.passwordCon.text) {
                            return 'error_pass_and_con_pass'.tr;
                          } else {
                            return null;
                          }
                        },
                        suffixIcon: IconButton(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onPressed: () {
                            profileController.isConPasswordVisible.value =
                                !profileController.isConPasswordVisible.value;
                          },
                          icon: Icon(
                            profileController.isConPasswordVisible.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
