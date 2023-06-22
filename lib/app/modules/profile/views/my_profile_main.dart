import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/modules/member_document/views/tabs/document_tab_view.dart';
import 'package:bima_g/app/modules/profile/controllers/profile_controller.dart';
import 'package:bima_g/app/modules/profile/views/EditMyProfile/tabsForm/profile_info_view.dart';
import 'package:bima_g/app/modules/profile_address/views/profile_address_view.dart';
import 'package:bima_g/app/modules/profile_assets/views/profile_assets_view.dart';
import 'package:bima_g/app/modules/profile_family/views/profile_family_view.dart';
import 'package:bima_g/utility/colors.dart';
import 'package:bima_g/utility/ts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../homepage/views/top_app_bar_view.dart';
import 'EditMyProfile/tabs/policy_tab_view.dart';

class MyProfileMainView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: Obx(
          () => TopAppBarView(
              actionIcon: Icons.keyboard_arrow_right,
              title: profileController.userName.value,
              imgUrl: dashboardController.profileUrl.value,
              subtitle: profileController.mno.value,
              onPressed: () {
                profileController.getProfileDetails();
                Get.to(ProfileInfoView());
              }),
        ),
        preferredSize: Size.fromHeight(70.h),
      ),
      body: DefaultTabController(
        length: 5,
        child: Column(
          children: [
            SizedBox(height: 10.h),
            Container(
              height: 40.h,
              decoration: BoxDecoration(color: AppColors.white),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: TabBar(
                  isScrollable: true,
                  indicatorColor: AppColors.primaryColor,
                  dividerColor: AppColors.primaryColor,
                  labelStyle: Ts.regular13(AppColors.primaryColor),
                  unselectedLabelStyle: Ts.regular13(AppColors.grey4),
                  onTap: profileController.onTabChange,
                  tabs: [
                    Tab(
                      key: Key('policies_tab_key'),
                      child: Text('policies'.tr),
                    ),
                    Tab(
                      key: Key('family_tab_key'),
                      child: Text('family'.tr),
                    ),
                    Tab(
                      key: Key('assets_tab_key'),
                      icon: Text('assets'.tr),
                    ),
                    Tab(
                      key: Key('address_tab_key'),
                      icon: Text('address'.tr),
                    ),
                    Tab(
                      key: Key('document_tab_key'),
                      icon: Text('document'.tr),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  PolicyTabView(),
                  ProfileFamilyView(),
                  ProfileAssetsView(),
                  ProfileAddressView(),
                  DocumentTabView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
