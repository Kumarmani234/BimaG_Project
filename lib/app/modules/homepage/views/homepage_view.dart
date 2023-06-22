// ignore_for_file: deprecated_member_use

import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/modules/homepage/views/home_top_carousel_view.dart';
import 'package:bima_g/app/modules/homepage/views/new_insurance_list_view.dart';
import 'package:bima_g/app/modules/homepage/views/top_app_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../menu_drawer/views/menu_drawer_view.dart';
import '../../policies/views/incomplete_policies_view.dart';
import '../../policies/views/your_policies_view.dart';
import '../controllers/homepage_controller.dart';

class HomepageView extends GetView<HomepageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homeController.scaffoldKey,
      drawer: MenuDrawerView(),
      appBar: PreferredSize(
        child: Obx(
          () => TopAppBarView(
            actionIcon: Icons.notifications_none_outlined,
            title: homepageController.appBarTitle.tr,
            subtitle: profileController.userName.value,
            imgUrl: dashboardController.profileUrl.value,
            OnTap: () => homeController.scaffoldKey.currentState!.openDrawer(),
          ),
        ),
        preferredSize: Size.fromHeight(70.h),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          HomeTopCarouselView(),
          IncompletePoliciesView(),
          YourPoliciesView(),
          NewInsuranceListView(),
        ],
      ),
    );
  }
}
