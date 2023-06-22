// ignore_for_file: must_be_immutable

import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/modules/home_insurance_module/home_insurance/views/tabs/coverage_tab_view.dart';
import 'package:bima_g/app/modules/home_insurance_module/home_insurance/views/home_insurance_bottombar_view.dart';
import 'package:bima_g/app/modules/home_insurance_module/home_insurance/views/tabs/details_tab_view.dart';
import 'package:bima_g/app/modules/home_insurance_module/home_insurance/views/tabs/property_type_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../insurance_appbar/views/insurance_appbar_view.dart';
import 'tabs/home_insurance_detail_tabbar_view.dart';

class HomeInsuranceDetailsView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: InsuranceAppbarView(
          title: 'property_insurance'.tr,
        ),
        preferredSize: Size.fromHeight(55.h),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.white,
            child: HomeInsuranceDetailTabbarView(
              tabFormKey: homeInsuranceController.detailsTabFormKey,
            ),
          ),
          SizedBox(height: 16.h),
          Obx(
            () {
              switch (homeInsuranceController.currentTabIndex.value) {
                case 0:
                  return DetailsTabView();
                case 1:
                  return PropertyTypeTabView();
                case 2:
                  return CoverageTabView();
                default:
                  return Container(); // handle invalid index
              }
            },
          ),
        ],
      ),
      bottomNavigationBar: HomeInsuranceBottombarView(
        detailsFormKey: homeInsuranceController.detailsTabFormKey,
        coverageFormKey: homeInsuranceController.coverageTabFormKey,
      ),
    );
  }
}
