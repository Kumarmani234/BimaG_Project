import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../utility/colors.dart';
import '../../../../../utility/ts.dart';
import '../../../../module_controllers.dart';
import '../../../health_insurance_module/health_insurance_plan_selection/views/health_insurance_plan_selection_view.dart';
import '../../../../insurance_components/insurance_backup_selection_view.dart';
import 'plan_selection/insurance_idv_slider_selection_view.dart';
import '../../../insurance_appbar/views/insurance_appbar_view.dart';
import '../../../../widgets/summary_pay_now_button_view.dart';
import '../controllers/home_insurance_plan_selection_controller.dart';
import 'plan_selection/home_insurance_plan_view.dart';
import 'plan_selection/insurance_extra_coverage_selection_view.dart';
import 'plan_selection/insurance_policy_duration_selection_view.dart';
import 'home_insurance_proposal_form_view.dart';

class HomeInsurancePlanSelectionView
    extends GetView<HomeInsurancePlanSelectionController> {
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
        preferredSize: Size.fromHeight(140.h),
      ),
      body: ListView(
        children: [
          HomeInsurancePlaView(),
          HomeInsurancePolicyDuration(),
          HomeInsuranceIdvSliderView(),
          HomeInsuranceExtraCoverageView(),
          SizedBox(height: 16.h)
        ],
      ),
      bottomSheet: Obx(
        () => Visibility(
          visible: homeInsurancePlanSelectionController.isShowBottomSheet.value,
          child: InsuranceBackupView(
            onSheetCloseIconTap: () {
              homeInsurancePlanSelectionController.toggleShowBottomSheet();
              homeInsurancePlanSelectionController.toggleBottomIcon();
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
          Get.to(HomeInsuranceProposalFormView());
        },
        widget: Obx(
          () => Icon(
            homeInsurancePlanSelectionController.isToggleIcon.value
                ? Icons.keyboard_arrow_up
                : Icons.keyboard_arrow_down,
            size: 28,
          ),
        ),
        onPremimunIconTap: () {
          // print('############## clicked #############');
          homeInsurancePlanSelectionController.toggleShowBottomSheet();
          homeInsurancePlanSelectionController.toggleBottomIcon();
        },
      ),
    );
  }
}
