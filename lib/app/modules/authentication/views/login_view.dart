import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/modules/authentication/views/ask_mobile_view.dart';
import 'package:bima_g/app/widgets/checkboxes.dart';
import 'package:bima_g/utility/asset_paths.dart';
import 'package:bima_g/utility/colors.dart';
import 'package:bima_g/utility/ts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../topbar_authentication/views/topbar_authentication_view.dart';
import '../controllers/authentication_controller.dart';

class LoginView extends GetView<AuthenticationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            AssetPath.background_image,
            width: Get.width,
          ),

          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(top: 15.h, left: 15.w, right: 15.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  LoginText(),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 25.h),
                      Text(
                        "login_fast_option".tr,
                        style: Ts.regular12(AppColors.grey4),
                      ),
                      SizedBox(height: 10.h),
                      Obx(() => Opacity(
                            opacity:
                                authenticationController.acceptedTerms.value
                                    ? 1.0
                                    : 0.2,
                            child: ElevatedButton(
                              key: Key('verify_num_n_login_key'),
                                onPressed: () =>
                                    authenticationController.onLoginClick(),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 50.w, vertical: 15.h),
                                  child: Text(
                                    "verify_num_n_login".tr,
                                    style: Ts.bold15(Colors.white),
                                  ),
                                )),
                          )),
                      /*Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 2,
                              color: AppColors.grey2,
                              width: 80.w,
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.w),
                              child: Text(
                                'or'.toUpperCase().tr,
                                style: Ts.semiBold12(AppColors.grey5),
                              ),
                            ),
                            Container(
                              height: 2,
                              color: AppColors.grey2,
                              width: 80.w,
                            )
                          ],
                        ),
                      ),*/
                    ],
                  ),

                  /*//social button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () => authenticationController.trueCallerSignIn(),
                        child: SvgPicture.asset(
                          AssetPath.truecaller,
                          width: 100.w,
                        ),
                      ),
                      InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () => authenticationController.facebookSignIn(),
                        child: SvgPicture.asset(
                          AssetPath.facebook,
                          width: 100.w,
                        ),
                      ),
                      InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () => authenticationController.googleSignIn(),
                        child: SvgPicture.asset(
                          AssetPath.google,
                          width: 100.w,
                        ),
                      ),
                    ],
                  ),*/

                  //Obx(() => Text(authenticationController.contactText.value)),

                  //terms & condition
                  SizedBox(height: 15.h),
                  Row(
                    children: [
                      Obx(
                        () => SquareCheckbox(
                            key: Key('check_box_key'),
                            onChange: () => authenticationController
                                    .acceptedTerms.value =
                                !authenticationController.acceptedTerms.value,
                            isChecked:
                                authenticationController.acceptedTerms.value),
                      ),
                      Text(
                        '  ' + 'i_agree_to_ur'.tr + ' ',
                        style: Ts.semiBold13(AppColors.grey5),
                      ),
                      InkWell(
                        onTap: () => authenticationController
                            .navigateToTermsConditions(),
                        child: Text(
                          'terms_n_condition'.tr,
                          style: Ts.bold13(AppColors.primaryColor)
                              .copyWith(decoration: TextDecoration.underline),
                        ),
                      ),
                      Text(' & '),
                      InkWell(
                        onTap: () =>
                            authenticationController.navigateToPrivacyPolicy(),
                        child: Text('privacy_policy'.tr,
                            style: Ts.bold13(AppColors.primaryColor).copyWith(
                                decoration: TextDecoration.underline)),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),

          //TopBarHelpPolicesButton()
          Padding(
            padding: EdgeInsets.only(top: 40.h),
            child: TopbarAuthenticationView(
              isShowLogo: true,
            ),
          )
        ],
      ),
    );
  }
}
