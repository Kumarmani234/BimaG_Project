// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../module_controllers.dart';
import '../../../insurance_appbar/views/insurance_appbar_view.dart';
import 'tabs/components/health_insurance_bottom_bar_view.dart';
import 'health_insurance_existing_illness_view.dart';
import 'tabs/health_insurance_first_tab_view.dart';
import 'tabs/health_insurance_fourth_tab_view.dart';
import 'tabs/health_insurance_second_tab_view.dart';
import 'tabs/health_insurance_tabbar_view.dart';
import 'tabs/health_insurance_third_tab_view.dart';

class HealthInsuranceDetailsView extends GetView {
  GlobalKey<FormState> ageTabFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: InsuranceAppbarView(
          title: 'health_insurance'.tr,
        ),
        preferredSize: Size.fromHeight(55.h),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.white,
            child: HealthInsuranceTabbarView(),
          ),
          SizedBox(height: 16.h),
          Expanded(
            child: Obx(() {
              switch (healthInsuranceController.currentTabIndex.value) {
                case 0:
                  return HealthInsuranceFirstTabView();
                case 1:
                  return HealthInsuranceSecondTabView();
                case 2:
                  return HealthInsuranceThirdTabView();
                case 3:
                  return HealthInsuranceFourthTabView();
                default:
                  return HealthInsuranceExistingIllnessView(); // handle invalid index
              }
            }),
          ),
        ],
      ),
      bottomNavigationBar: HealthInsuranceBottomBarView(),
    );
  }
}
