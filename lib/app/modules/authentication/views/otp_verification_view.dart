import 'package:bima_g/app/modules/authentication/controllers/authentication_controller.dart';
import 'package:bima_g/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../../../utility/asset_paths.dart';
import '../../../../utility/colors.dart';
import '../../../../utility/ts.dart';
import '../../../widgets/textfields.dart';
import '../../topbar_authentication/views/topbar_authentication_view.dart';

class OtpVerificationView extends GetView {
  final con = Get.put(AuthenticationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(AssetPath.background_image),
          Form(
            key: con.otpFormKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Padding(
              padding: EdgeInsets.all(20.h),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    VerificationText(),
                    SizedBox(height: 25.h),
                    Obx(() => Stack(
                          children: [
                            BorderTextField(
                              controller: con.otpCon.value,
                              titleText: 'enter_otp'.tr,
                              hintText: 'enter_otp'.tr,
                              textInputType: TextInputType.text,
                              maxLength: 6,
                              obscureText: true,
                              onValidate: (val) {
                                Future.delayed(
                                    Duration(milliseconds: 10),
                                    () => con.visibilityOfOtp.value =
                                        val.toString().isNotEmpty);
                                return val.toString().isEmpty
                                    ? 'enter_mobile_number'.tr
                                    : null;
                              },
                            ),
                            if (con.otpCounter > 0)
                              Padding(
                                padding:
                                    EdgeInsets.only(top: 48.h, right: 15.w),
                                child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: Text(
                                      con.otpCounter.toString() + ' sec',
                                      style: Ts.semiBold14(AppColors.grey4),
                                    )),
                              )
                          ],
                        )),
                    SizedBox(height: 10.h),
                    Obx(() => con.otpCounter.value == 0
                        ? Row(
                            children: [
                              Text("if_u_dont_rec_code".tr + " ",
                                  style: Ts.semiBold14(AppColors.grey4)),
                              InkWell(
                                  onTap: () => con.startCounter(),
                                  child: Text(
                                    "resend".tr,
                                    style: Ts.bold14(AppColors.primaryColor)
                                        .copyWith(
                                            decoration:
                                                TextDecoration.underline),
                                  ))
                            ],
                          )
                        : Container()),
                    SizedBox(height: 15.h),
                    Obx(() => Opacity(
                        opacity: con.visibilityOfOtp.value ? 1.0 : 0.2,
                        child: ElevatedButton(
                            onPressed: () => Get.offAllNamed(Routes.PROFILE),
                            child: Text(
                              'verify_otp'.tr,
                              style: Ts.regular15(Colors.white),
                            )))),
                  ],
                ),
              ),
            ),
          ),
          //TopBarHelpPolicesButton(hideLogo: true,)
          TopbarAuthenticationView()
        ],
      ),
    );
  }
}

class VerificationText extends StatelessWidget {
  VerificationText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 150.h),
        SvgPicture.asset(AssetPath.login_image, width: 215.w, height: 215.w),
        SizedBox(height: 10.h),
        Text(
          'verification'.tr,
          style: Ts.semiBold24(Colors.black),
        ),
        SizedBox(height: 10.h),
        Text(
          "enter_6_digit_code".tr +
              " " +
              "916354946940" +
              ". " +
              "enter_6_digit_code2".tr,
          style: Ts.regular15(AppColors.grey4),
        )
      ],
    );
  }
}
