import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/modules/compare_plans/views/compare_features_view.dart';
import 'package:bima_g/app/modules/compare_plans/views/compare_idv_view.dart';
import 'package:bima_g/app/modules/compare_plans/views/compare_price_view.dart';
import 'package:bima_g/app/modules/compare_plans/views/select_plan_sheet_view.dart';
import 'package:bima_g/app/modules/compare_plans/views/tabs_compare_plan_view.dart';
import 'package:bima_g/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../insurance_appbar/views/insurance_appbar_view.dart';
import '../controllers/compare_plans_controller.dart';
import 'compare_claim_settled_view.dart';

class ComparePlansView extends GetView<ComparePlansController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey1,
      appBar: PreferredSize(
        child: InsuranceAppbarView(
          title: 'Compare plans',
        ),
        preferredSize: Size.fromHeight(60.h),
      ),
      body: Column(
        children: [
          TabsComparePlanView(),
          Container(height: 1, color: AppColors.grey2),

          SelectPlanSheetView(
            forUpperSheet: true,
          ),

          //compare IDV
          Obx(() => GetCurrentTabView()),

          ComparePriceView()
        ],
      ),
    );
  }

  GetCurrentTabView() {
    if (comparePlansController.currentComparePlanTabIndex.value == 0) {
      return Expanded(
        child: Padding(
          padding: EdgeInsets.only(left: 15.h, right: 15.h, top: 15.h),
          child: ListView(
            shrinkWrap: true,
            children: [
              CompareIdvView(),
              CompareClaimSettledView(),
              CompareFeaturesView(),
            ],
          ),
        ),
      );
    }
    return Container();
  }
}
