// ignore_for_file: must_be_immutable

import 'package:bima_g/app/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../utility/asset_paths.dart';
import '../../../../utility/colors.dart';
import '../../../../utility/ts.dart';
import '../../../module_controllers.dart';
import '../../../widgets/textfields.dart';
import '../../topbar_authentication/views/topbar_authentication_view.dart';
import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  String phone;
  ForgotPasswordView({this.phone = '', Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            AssetPath.background_image,
            width: Get.width,
          ),
          Form(
            key: forgotPasswordController.newPassFormKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Padding(
              padding: EdgeInsets.all(20.h),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    NewPasswordText(),
                    SizedBox(height: 25.h),
                    Obx(
                      () => BorderTextField(
                        controller: forgotPasswordController.passwordCon.value,
                        titleText: 'enter_new_pass'.tr,
                        hintText: 'enter_new_pass'.tr,
                        maxLength: 16,
                        obscureText:
                            forgotPasswordController.isPasswordVisible.value,
                        onChange: (val) {
                          forgotPasswordController.onChange();
                        },
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
                            forgotPasswordController.isPasswordVisible.value =
                                !forgotPasswordController
                                    .isPasswordVisible.value;
                          },
                          icon: Icon(
                            forgotPasswordController.isPasswordVisible.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Obx(
                      () => BorderTextField(
                        controller:
                            forgotPasswordController.confirmPasswordCon.value,
                        titleText: 'confirm_new_pass'.tr,
                        hintText: 'hint_confirm_password'.tr,
                        maxLength: 16,
                        obscureText:
                            forgotPasswordController.isConPasswordVisible.value,
                        onChange: (val) {
                          forgotPasswordController.onChange();
                        },
                        onValidate: (val) {
                          if (val.toString().isEmpty) {
                            return 'hint_confirm_password'.tr;
                          } else if (forgotPasswordController
                                  .confirmPasswordCon.value.text !=
                              forgotPasswordController.passwordCon.value.text) {
                            return 'error_pass_and_con_pass'.tr;
                          } else {
                            return null;
                          }
                        },
                        suffixIcon: IconButton(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onPressed: () {
                            forgotPasswordController
                                    .isConPasswordVisible.value =
                                !forgotPasswordController
                                    .isConPasswordVisible.value;
                          },
                          icon: Icon(
                            forgotPasswordController.isConPasswordVisible.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Obx(() => ElevatedButtonBimaG(
                          text: 'save_n_login'.tr,
                          onClick: () =>
                              forgotPasswordController.onForgotPassClick(phone),
                          buttonStatus: forgotPasswordController
                              .newPasswordBtnStatus.value,
                          // forgotPasswordController.newPasswordBtnStatus.value,
                        )),
                  ],
                ),
              ),
            ),
          ),
          //TopBarHelpPolicesButton(hideLogo: true,)
          Padding(
            padding: EdgeInsets.only(top: 40.h),
            child: TopbarAuthenticationView(),
          ),
        ],
      ),
    );
  }
}

class NewPasswordText extends StatelessWidget {
  const NewPasswordText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 150.h),
        SvgPicture.asset(AssetPath.login_image, width: 215.w, height: 215.w),
        SizedBox(height: 10.h),
        Text(
          'create_new_password'.tr,
          style: Ts.semiBold24(Colors.black),
        ),
        SizedBox(height: 10.h),
        Text(
          "your_new_pass_must_be_dif_from".tr +
              '\n' +
              "previously_used_passwords".tr,
          style: Ts.regular15(AppColors.grey4),
        )
      ],
    );
  }
}
