// ignore_for_file: must_be_immutable

import 'package:bima_g/app/modules/compare_plans/views/compare_plans_view.dart';
import 'package:bima_g/utility/colors.dart';
import 'package:bima_g/utility/ts.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../insurance_components/insurance_backup_selection_view.dart';
import '../../../../module_controllers.dart';
import '../../../insurance_appbar/views/insurance_appbar_view.dart';
import '../controllers/two_wheeler_plan_selection_controller.dart';
import '../../../../widgets/summary_pay_now_button_view.dart';
import 'plan_selection/extra_coverage_view.dart';
import 'plan_selection/idv_slider_view.dart';
import 'plan_selection/insurance_plan_view.dart';
import 'plan_selection/policy_duration_view.dart';
import 'proposal_form_view.dart';

class TwoWheelerPlanSelectionView
    extends GetView<TwoWheelerPlanSelectionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey1,
      appBar: PreferredSize(
        child: InsuranceAppbarView(
          title: 'select_plan_option'.tr,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 8.w),
              child: kReleaseMode
                  ? SizedBox()
                  : TextButton(
                      child: Text(
                        'compare'.tr,
                        style: Ts.bold15(AppColors.primaryColor),
                      ),
                      onPressed: () => Get.to(ComparePlansView()),
                    ),
            ),
          ],
          isBottom: true,
          bottom: top_row(),
        ),
        preferredSize: Size.fromHeight(130.h),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          InsurancePlanView(),
          PolicyDurationView(),
          IdvSliderView(),
          ExtraCoverageView(),
          SizedBox(height: 16.h)
        ],
      ),
      bottomSheet: Obx(
        () => Visibility(
          visible: twoWheelerPlanSelectionController.isShowBottomSheet.value,
          child: InsuranceBackupView(
            onSheetCloseIconTap: () {
              twoWheelerPlanSelectionController.toggleShowBottomSheet();
              twoWheelerPlanSelectionController.toggleBottomIcon();
            },
          ),
        ),
      ),
      bottomNavigationBar: summary_pay_now_button(
        btn_text: 'continue'.tr,
        price: '₹1,180',
        isIcon: true,
        price_text: 'net_premium'.tr,
        onPressed: () {
          Get.to(BikeInsuranceProposalFormView());
        },
        widget: Obx(
          () => Icon(
            twoWheelerPlanSelectionController.isToggleIcon.value
                ? Icons.keyboard_arrow_up
                : Icons.keyboard_arrow_down,
            size: 28,
          ),
        ),
        isIconToggle: twoWheelerPlanSelectionController.isToggleIcon.value,
        onPremimunIconTap: () {
          twoWheelerPlanSelectionController.toggleShowBottomSheet();
          twoWheelerPlanSelectionController.toggleBottomIcon();
        },
      ),
    );
  }
}

class top_row extends StatelessWidget {
  const top_row({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72.h,
      width: 375.w,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: Container(
                height: 40.h,
                width: 131.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  image: DecorationImage(
                    image: AssetImage('assets/pngs/select_plan.png'),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 15.w,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.13.h),
              child: SizedBox(
                height: 19.75.h,
                width: 197.w,
                child: Text(
                  'United india insurance',
                  style: Ts.bold14(AppColors.secondaryColor),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
