// ignore_for_file: deprecated_member_use

import 'package:bima_g/app/module_controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../utility/asset_paths.dart';
import '../../../../utility/colors.dart';
import '../../../../utility/ts.dart';
import '../controllers/topbar_authentication_controller.dart';

class TopbarAuthenticationView extends GetView<TopbarAuthenticationController> {
  final bool isShowLogo;

  TopbarAuthenticationView({this.isShowLogo = false});
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: isShowLogo
                ? SvgPicture.asset(
                    AssetPath.black_text_logo,
                    height: 25.h,
                  )
                : InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () => Get.back(),
                    child: SvgPicture.asset(
                      AssetPath.back_button,
                      width: 40.w,
                      height: 40.w,
                    ),
                  ),
            // child:hideLogo ? InkWell(onTap: ()=>Get.back(),child: SvgPicture.asset(AssetPath.back_button, width: 40.w, height: 40.w,)) :  SvgPicture.asset(AssetPath.black_text_logo, width: 120.w,height: 32.h,),
          ),
          Expanded(child: SizedBox()),
          InkWell(
            onTap: () => topbarAuthenticationController.onPolicyClick(),
            child: Row(
              children: [
                SvgPicture.asset(
                  AssetPath.policies,
                  width: 20.w,
                  color: AppColors.black,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text('policies'.tr, style: Ts.bold15(AppColors.primaryColor)),
              ],
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          InkWell(
            onTap: () => topbarAuthenticationController.onHelpClick(),
            child: Row(
              children: [
                SvgPicture.asset(
                  AssetPath.help,
                  width: 20.w,
                  color: AppColors.black,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text('help'.tr, style: Ts.bold15(AppColors.primaryColor)),
              ],
            ),
          ),
          SizedBox(
            width: 20.w,
          )
        ],
      ),
    );
  }
}
