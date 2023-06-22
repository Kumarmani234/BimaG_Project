import 'package:bima_g/app/enums.dart';
import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/modules/topbar_authentication/views/topbar_authentication_view.dart';
import 'package:bima_g/app/widgets/buttons.dart';
import 'package:bima_g/utility/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../utility/asset_paths.dart';
import '../../../../utility/colors.dart';
import '../../../../utility/ts.dart';
import '../../../widgets/textfields.dart';

class AskMobileView extends GetView {
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
            /// key: authenticationController.mobileFormKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 15.h, left: 15.w, right: 15.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    LoginText(),
                    SizedBox(height: 25.h),
                    Obx(
                      () => BorderTextField(
                        key: Key('mobile_no_key'),
                        controller: authenticationController.mobileNumCon.value,
                        titleText: 'mobile_number'.tr,
                        hintText: 'enter_mobile_number'.tr,
                        textInputType: TextInputType.phone,
                        maxLength: 10,
                        onChange: (val) {
                          authenticationController.userSelectedNumber = '';
                          authenticationController.loginPassVisibility.value =
                              false;
                        },
                        prefixIcon: IgnorePointer(
                            child: TextButton(
                                child: Text('+91'), onPressed: () {})),
                        onValidate: (val) {
                          authenticationController.askMobileButtonStatus.value =
                              ButtonStatus.InActive;
                          if (val.toString().isEmpty) {
                            return 'enter_mobile_number'.tr;
                          } else if (val.toString().length < 10) {
                            return 'please_enter_valid_mobile_no'.tr;
                          } else {
                            if (!Utils.validateMobileNoIndia(val.toString())) {
                              return 'invalid_mobile_no_format'.tr;
                            }
                            ;
                            if (val.toString().length == 10) {
                              authenticationController.askMobileButtonStatus
                                  .value = ButtonStatus.Active;
                            }
                            return null;
                          }
                        },
                      ),
                    ),
                    Obx(
                      () => Visibility(
                        visible:
                            authenticationController.loginPassVisibility.value,
                        child: Padding(
                          padding: EdgeInsets.only(top: 16.h),
                          child: Stack(
                            children: [
                              BorderTextField(
                                key: Key('password_field_key'),
                                controller:
                                    authenticationController.passwordCon.value,
                                titleText: 'password'.tr,
                                hintText: 'hint_password'.tr,
                                textInputType: TextInputType.text,
                                maxLength: 10,
                                obscureText: authenticationController
                                    .isPasswordVisible.value,
                                onChange: (val) {},
                                onValidate: (val) {

                                  if (val.toString().isNotEmpty) {
                                    authenticationController
                                        .askMobileButtonStatus
                                        .value = ButtonStatus.Active;
                                  }
                                  return val.toString().isEmpty
                                      ? 'hint_password'.tr
                                      : null;
                                },
                                suffixIcon: IconButton(
                                  key:Key('password_visible_key'),
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onPressed: () {
                                    authenticationController
                                            .isPasswordVisible.value =
                                        !authenticationController
                                            .isPasswordVisible.value;
                                  },
                                  icon: Icon(
                                    authenticationController
                                            .isPasswordVisible.value
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: InkWell(
                                  onTap: () => authenticationController
                                      .onForgotPassClick(),
                                  child: Text(
                                    "forgot_password".tr,
                                    style: Ts.medium12(AppColors.primaryColor),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Obx(
                      () => ElevatedButtonBimaG(
                        key: Key('login_key'),
                        text: 'login'.tr,
                        onClick: () => authenticationController.onOtpSend(),
                        buttonStatus: authenticationController
                            .askMobileButtonStatus.value,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          //TopBarHelpPolicesButton(hideLogo: true,)
          Padding(
            padding: EdgeInsets.only(top: 40.h),
            child: TopbarAuthenticationView(),
          )
        ],
      ),
    );
  }
}

class LoginText extends StatelessWidget {
  const LoginText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 150.h),
        SvgPicture.asset(AssetPath.login_image, width: 215.w, height: 215.w),
        SizedBox(height: 10.h),
        Text(
          'welcome_to_bimag'.tr,
          style: Ts.semiBold24(Colors.black),
        ),
        SizedBox(height: 10.h),
        Text(
          "welcome_to_bimag_info".tr,
          style: Ts.regular15(AppColors.grey4),
        )
      ],
    );
  }
}
