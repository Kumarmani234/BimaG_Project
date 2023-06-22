import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/modules/health_insurance_module/health_insurance_plan_selection/views/plan_selection/health_insurance_extra_coverage.dart';
import 'package:bima_g/app/modules/health_insurance_module/health_insurance_plan_selection/views/plan_selection/health_insurance_idv_view.dart';
import 'package:bima_g/app/modules/health_insurance_module/health_insurance_plan_selection/views/plan_selection/health_insurance_policy_duration.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../utility/colors.dart';
import '../../../../../utility/ts.dart';
import '../../../insurance_appbar/views/insurance_appbar_view.dart';
import '../../../../widgets/summary_pay_now_button_view.dart';
import '../controllers/health_insurance_plan_selection_controller.dart';
import 'health_insurance_proposal_form_view.dart';
import '../../../../insurance_components/insurance_backup_selection_view.dart';
import 'plan_selection/health_insurance_plan_view.dart';

class HealthInsurancePlanSelectionView
    extends GetView<HealthInsurancePlanSelectionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey1,
      appBar: PreferredSize(
        child: InsuranceAppbarView(
          title: 'Select plan option',
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
          HealthInsurancePlanView(),
          HealthInsurancePolicyDuration(),
          HealthInsuranceIdvSliderView(),
          HealthInsuranceExtraCoverageView(),
        ],
      ),
      bottomSheet: Obx(
        () => Visibility(
          visible:
              healthInsurancePlanSelectionController.isShowBottomSheet.value,
          child: InsuranceBackupView(
            onSheetCloseIconTap: () {
              healthInsurancePlanSelectionController.toggleShowBottomSheet();
              healthInsurancePlanSelectionController.toggleBottomIcon();
            },
          ),
        ),
      ),
      bottomNavigationBar: summary_pay_now_button(
        btn_text: 'Continue',
        price: '₹1,180',
        isIcon: true,
        price_text: 'Net premium',
        onPressed: () {
          Get.to(HealthInsuranceProposalFormView());
        },
        widget: Obx(
          () => Icon(
            healthInsurancePlanSelectionController.isToggleIcon.value
                ? Icons.keyboard_arrow_up
                : Icons.keyboard_arrow_down,
            size: 28,
          ),
        ),
        onPremimunIconTap: () {
          healthInsurancePlanSelectionController.toggleShowBottomSheet();
          healthInsurancePlanSelectionController.toggleBottomIcon();
        },
      ),
    );
  }
}

class top_row extends StatelessWidget {
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
            Column(
              children: [
                SizedBox(
                  height: 19.75.h,
                  width: 197.w,
                  child: Text(
                    'United india insurance',
                    style: Ts.bold14(AppColors.secondaryColor),
                  ),
                ),
                SizedBox(
                  height: 19.75.h,
                  width: 197.w,
                  child: Text(
                    'NCB Super Premium',
                    style: Ts.regular12(AppColors.grey4),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
