// ignore_for_file: deprecated_member_use

import 'package:bima_g/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:bima_g/utility/asset_paths.dart';
import 'package:bima_g/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../../../../utility/ts.dart';

class BottomNavigationBarView extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4.h),
                child: SvgPicture.asset(
                    key:Key('home_tab_key'),
                    AssetPath.nav_home,
                    color: controller.selectedIndex.value == 0
                        ? AppColors.primaryColor
                        : AppColors.grey5),
              ),
              label: 'home_tab'.tr,
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4.h),
                child: SvgPicture.asset(
                  key:Key('nearby_key'),
                    AssetPath.nav_nearby,
                    color: controller.selectedIndex.value == 1
                        ? AppColors.primaryColor
                        : AppColors.grey5),
              ),
              label: 'near_by'.tr,
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4.h),
                child: SvgPicture.asset(
                  key:Key('my_profile_key'),
                    AssetPath.nav_profile,
                    color: controller.selectedIndex.value == 2
                        ? AppColors.primaryColor
                        : AppColors.grey5),
              ),
              label: 'my_profile'.tr,
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4.h),
                child: SvgPicture.asset(
                  key:Key('help_tab_key'),
                    AssetPath.help_home,
                    color: controller.selectedIndex.value == 3
                        ? AppColors.primaryColor
                        : AppColors.grey5),
              ),
              label: 'help'.tr,
            ),
          ],
          currentIndex: controller.selectedIndex.value,
          selectedItemColor: AppColors.primaryColor,
          iconSize: 24.w,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: Ts.semiBold13(AppColors.primaryColor),
          unselectedLabelStyle: Ts.semiBold13(AppColors.grey5),
          onTap: (ind) {
            HapticFeedback.mediumImpact();
            controller.selectedIndex.value = ind;
          },
          elevation: 20,
        ));
  }
}
