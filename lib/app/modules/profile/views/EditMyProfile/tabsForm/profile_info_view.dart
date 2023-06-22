import 'package:bima_g/app/modules/fetch_address/views/fetch_address_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../utility/colors.dart';
import '../../../../../../utility/encrypt_shared_pref.dart';
import '../../../../../../utility/ts.dart';
import '../../../../../form_validation_expressions.dart';
import '../../../../../module_controllers.dart';
import '../../../../../widgets/buttons.dart';
import '../../../../../widgets/date_of_birth.dart';
import '../../../../../widgets/dialogs.dart';
import '../../../../../widgets/field_with_radio_view.dart';
import '../../../../../widgets/textfields.dart';
import '../../../../insurance_appbar/views/insurance_appbar_view.dart';
import '../../../../profile_pic_update/views/profile_pic_update_view.dart';

class ProfileInfoView extends GetView {
  final FormFieldValidExpression formFieldValidExpression =
      FormFieldValidExpression();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() => BottomButton(
            buttonStatus: profileController.profileUpdateButtonStatus.value,
            text: 'save'.tr,
            onClick: () => profileController.onSaveProfileDetails(),
          )),
      appBar: PreferredSize(
        child: InsuranceAppbarView(
          title: 'profile_info'.tr,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 8.w),
              child: TextButton(
                  child: Text(
                    'logout'.tr,
                    style: Ts.bold15(AppColors.red),
                  ),
                  onPressed: () => Dialogs.showAlertDialog(
                        'Are you sure you want to logout?',
                        rightButtonText: 'Logout',
                        onRightButtonClick: () async {
                          await sharedPrefs.onLogout();
                        },
                      )
                  // onPressed: () async {
                  //   await sharedPrefs.onLogout();
                  // },
                  ),
            ),
          ],
        ),
        preferredSize: Size.fromHeight(70.h),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfilePicUpdateView(),
              SizedBox(height: 16.h),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8.w),
                ),
                child: Form(
                  key: profileController.profileFormKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BorderTextField(
                          key: Key('first_name_key'),
                          hintText: 'user_first_name'.tr,
                          titleText: 'first_name'.tr + "*",
                          controller:
                              profileController.UserNameController.value,
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
                          key: Key('last_name_key'),
                          hintText: 'user_last_name'.tr,
                          titleText: 'last_name'.tr + "*",
                          controller:
                              profileController.LastNameController.value,
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
                          key: Key('mobile_no_key'),
                          hintText: ''.tr,
                          enabled: false,
                          titleText: 'mobile_number'.tr,
                          controller: profileController.MobileController.value,
                        ),

                        //email
                        SizedBox(height: 16.h),
                        BorderTextField(
                          key: Key('mail_address_key'),
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
                          key: Key('select_gender_key'),
                          onSelectGender: (gender) => profileController
                              .selectedBasicProfileGender = gender.toString(),
                          selectedGender:
                              profileController.selectedBasicProfileGender,
                        ),
                        SizedBox(height: 16.h),

                        Obx(
                          () => DateOfBirthWidget(
                            key: Key('D_O_B_key'),
                            onTap: (DateTime dbDate, String formattedDate) {
                              print('formatted data: $formattedDate');
                              print('formatted data: $dbDate');
                              profileController.selectedDate.value = dbDate;
                              profileController.BirthDateController.value.text =
                                  formattedDate;
                            },
                            controller:
                                profileController.BirthDateController.value,
                            initialDate: profileController.selectedDate.value,
                          ),
                        ),
                        SizedBox(height: 16.h),
                        FetchAddressView(),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }
}
