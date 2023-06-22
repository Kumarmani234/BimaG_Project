// ignore_for_file: deprecated_member_use

import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/modules/agent_dashboard/controllers/agent_dashboard_controller.dart';
import 'package:bima_g/utility/asset_paths.dart';
import 'package:bima_g/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../utility/ts.dart';

class AgentBottomNavigationBarView extends GetView<AgentDashboardController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 4.h),
              child: SvgPicture.asset(
                key:Key('home_tab_key'),
                AssetPath.nav_home,
                color: agentDashboardController.selectedIndex.value == 0
                    ? AppColors.primaryColor
                    : AppColors.grey5,
              ),
            ),
            label: 'home_tab'.tr,
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 4.h),
              child: SvgPicture.asset(
                AssetPath.insurer,
                color: agentDashboardController.selectedIndex.value == 1
                    ? AppColors.primaryColor
                    : AppColors.grey5,
              ),
            ),
            label: 'insurer'.tr,
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 4.h),
              child: SvgPicture.asset(
                AssetPath.nav_profile,
                color: agentDashboardController.selectedIndex.value == 2
                    ? AppColors.primaryColor
                    : AppColors.grey5,
              ),
            ),
            label: 'my_profile'.tr,
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 4.h),
              child: SvgPicture.asset(
                AssetPath.help_home,
                color: agentDashboardController.selectedIndex.value == 3
                    ? AppColors.primaryColor
                    : AppColors.grey5,
              ),
            ),
            label: 'help'.tr,
          ),
        ],
        currentIndex: agentDashboardController.selectedIndex.value,
        selectedItemColor: AppColors.primaryColor,
        iconSize: 24.w,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: Ts.semiBold13(AppColors.primaryColor),
        unselectedLabelStyle: Ts.semiBold13(AppColors.grey5),
        onTap: (ind) {
          HapticFeedback.mediumImpact();
          agentDashboardController.selectedIndex.value = ind;
        },
        elevation: 20,
      ),
    );
  }
}
