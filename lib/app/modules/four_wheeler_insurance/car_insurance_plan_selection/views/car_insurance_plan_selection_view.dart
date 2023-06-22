// ignore_for_file: must_be_immutable

import 'package:bima_g/app/modules/four_wheeler_insurance/car_insurance_plan_selection/controllers/car_insurance_plan_selection_controller.dart';
import 'package:bima_g/app/modules/four_wheeler_insurance/car_insurance_plan_selection/views/car_insurance_proposal_form_view.dart';
import 'package:bima_g/app/modules/four_wheeler_insurance/car_insurance_plan_selection/views/plan_selection/car_insurance_extra_coverage_view.dart';
import 'package:bima_g/app/modules/four_wheeler_insurance/car_insurance_plan_selection/views/plan_selection/car_insurance_idv_slider_view.dart';
import 'package:bima_g/app/modules/four_wheeler_insurance/car_insurance_plan_selection/views/plan_selection/car_insurance_plan_view.dart';
import 'package:bima_g/app/modules/four_wheeler_insurance/car_insurance_plan_selection/views/plan_selection/car_insurance_policy_duration_view.dart';
import 'package:bima_g/utility/colors.dart';
import 'package:bima_g/utility/ts.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../insurance_components/insurance_backup_selection_view.dart';
import '../../../../module_controllers.dart';
import '../../../../widgets/summary_pay_now_button_view.dart';
import '../../../insurance_appbar/views/insurance_appbar_view.dart';

class CarInaurancePlanSelectionView
    extends GetView<CarInsurancePlanSelectionController> {
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
                      onPressed: () {},
                    ),
            ),
          ],
          isBottom: true,
          bottom: top_row(),
        ),
        preferredSize: Size.fromHeight(130.h),
      ),
      body: ListView(
        children: [
          CarInsurancePlanView(),
          CarInsurancePolicyDurationView(),
          CarInsuranceIdvSliderView(),
          CarInsuranceExtraCoverageView(),
          SizedBox(height: 16.h)
        ],
      ),
      bottomSheet: Obx(
        () => Visibility(
          visible: carInsurancePlanSelectionController.isShowBottomSheet.value,
          child: InsuranceBackupView(
            // isHaveDiscountCoupen: false,
            onSheetCloseIconTap: () {
              carInsurancePlanSelectionController.toggleShowBottomSheet();
              carInsurancePlanSelectionController.toggleBottomIcon();
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
          Get.to(CarInsuranceProposalFormView());
        },
        widget: Obx(
          () => Icon(
            carInsurancePlanSelectionController.isToggleIcon.value
                ? Icons.keyboard_arrow_up
                : Icons.keyboard_arrow_down,
            size: 28,
          ),
        ),
        isIconToggle: carInsurancePlanSelectionController.isToggleIcon.value,
        onPremimunIconTap: () {
          carInsurancePlanSelectionController.toggleShowBottomSheet();
          carInsurancePlanSelectionController.toggleBottomIcon();
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
