// ignore_for_file: deprecated_member_use

import 'package:bima_g/app/modules/agent_dashboard/views/agent_dashboard_view.dart';
import 'package:bima_g/app/modules/languages/views/languages_view.dart';
import 'package:bima_g/app/modules/register_business/views/register_business_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../utility/asset_paths.dart';
import '../../../../utility/colors.dart';
import '../../../../utility/ts.dart';
import '../../../module_controllers.dart';
import '../../homepage/views/top_app_bar_view.dart';
import '../controllers/menu_drawer_controller.dart';

class MenuDrawerView extends GetView<MenuDrawerController> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () => TopAppBarView(
              elevation: 0,
              actionIcon: Icons.keyboard_arrow_right,
              title: profileController.userName.value,
              imgUrl: dashboardController.profileUrl.value,
              subtitle: profileController.mno.value,
              onPressed: () {
                profileController.getProfileDetails();
                Get.back();
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                Divider(),
                ListTile(
                  key:Key('agent_tap_key'),
                  contentPadding: EdgeInsets.zero,
                  onTap: () => Get.to(AgentDashboardView()),
                  minLeadingWidth: 24.w,
                  leading: Padding(
                    padding: EdgeInsets.only(top: 9.h),
                    child: SvgPicture.asset(AssetPath.briefcase),
                  ),
                  title: Text(
                    'Agent - Hardiksinh Chudasama',
                    style: Ts.bold13(AppColors.grey5),
                  ),
                  subtitle: Text.rich(
                    TextSpan(
                      text: '4.4',
                      style: Ts.bold13(AppColors.green),
                      children: [
                        TextSpan(
                          text: ' BimaG001',
                          style: Ts.regular12(AppColors.grey4),
                        )
                      ],
                    ),
                  ),
                  trailing:
                      Icon(Icons.keyboard_arrow_right, color: AppColors.grey2),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  onTap: () => Get.to(RegisterBusinessView()),
                  minLeadingWidth: 24.w,
                  leading: Padding(
                    padding: EdgeInsets.only(top: 9.h),
                    child: SvgPicture.asset(AssetPath.reg_business),
                  ),
                  title: Text(
                    key:Key('register_business_key'),
                    'register_business'.tr,
                    style: Ts.bold13(AppColors.grey5),
                  ),
                  subtitle: Text(
                    'reach_your_customers_with_ease'.tr,
                    style: Ts.regular12(AppColors.grey4),
                  ),
                  trailing:
                      Icon(Icons.keyboard_arrow_right, color: AppColors.grey2),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  minLeadingWidth: 24.w,
                  leading: SvgPicture.asset(AssetPath.kyc),
                  title: Text(
                    'kyc'.tr,
                    style: Ts.bold13(AppColors.grey5),
                  ),
                  trailing:
                      Icon(Icons.keyboard_arrow_right, color: AppColors.grey2),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  minLeadingWidth: 24.w,
                  leading: SvgPicture.asset(
                    AssetPath.edit_pencil,
                    color: AppColors.secondaryColor,
                  ),
                  title: Text(
                    'feedback'.tr,
                    style: Ts.bold13(AppColors.grey5),
                  ),
                  trailing:
                      Icon(Icons.keyboard_arrow_right, color: AppColors.grey2),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  minLeadingWidth: 24.w,
                  leading: SvgPicture.asset(AssetPath.share_net),
                  title: Text(
                    'share_this_app'.tr,
                    style: Ts.bold13(AppColors.grey5),
                  ),
                  trailing:
                      Icon(Icons.keyboard_arrow_right, color: AppColors.grey2),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  minLeadingWidth: 24.w,
                  leading: SvgPicture.asset(AssetPath.file_text),
                  title: Text(
                    'about_us'.tr,
                    style: Ts.bold13(AppColors.grey5),
                  ),
                  trailing:
                      Icon(Icons.keyboard_arrow_right, color: AppColors.grey2),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  minLeadingWidth: 24.w,
                  leading: SvgPicture.asset(AssetPath.file_text),
                  title: Text(
                    'privacy_policy'.tr,
                    style: Ts.bold13(AppColors.grey5),
                  ),
                  trailing:
                      Icon(Icons.keyboard_arrow_right, color: AppColors.grey2),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  minLeadingWidth: 24.w,
                  leading: Padding(
                    padding: EdgeInsets.only(top: 9.h),
                    child: SvgPicture.asset(AssetPath.file_text),
                  ),
                  title: Text(
                    'terms_n_condition'.tr,
                    style: Ts.bold13(AppColors.grey5),
                  ),
                  trailing:
                      Icon(Icons.keyboard_arrow_right, color: AppColors.grey2),
                ),
                ListTile(
                  onTap: () => Get.to(LanguagesView(
                    isFromMenu: true,
                  )),
                  contentPadding: EdgeInsets.zero,
                  minLeadingWidth: 24.w,
                  leading: Padding(
                    padding: EdgeInsets.only(top: 9.h),
                    child: SvgPicture.asset(AssetPath.lang_trans),
                  ),
                  title: Text(
                    'change_language'.tr,
                    style: Ts.bold13(AppColors.grey5),
                  ),
                  trailing:
                      Icon(Icons.keyboard_arrow_right, color: AppColors.grey2),
                ),
              ],
            ),
          ),
          Spacer(),
          Center(
            child: SvgPicture.asset(
              AssetPath.black_text_logo,
              height: 25.h,
              color: AppColors.grey4,
            ),
          ),
          SizedBox(height: 6.h),
          Center(
            child: Text(
              'Version 1.0.0',
              style: Ts.regular12(AppColors.grey3),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
