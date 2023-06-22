import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../insurance_components/insurance_backup_selection_view.dart';
import '../../../insurance_appbar/views/insurance_appbar_view.dart';
import '../../../../widgets/summary_pay_now_button_view.dart';
import 'summary/compulsory_driver_p_a_view.dart';
import 'summary/summary_top_row_view.dart';
import 'summary/terms_n_condition_view.dart';

class SummaryView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey1,
      appBar: PreferredSize(
        child: InsuranceAppbarView(
          title: 'summary'.tr,
          subTitle: 'summary_subtitle'.tr,
          isBottom: true,
          bottom: SummaryTopRowView(),
        ),
        preferredSize: Size.fromHeight(140.h),
      ),
      bottomNavigationBar: summary_pay_now_button(
          btn_text: 'pay_now'.tr,
          price: '₹1,180',
          price_text: 'Total Amount',
          onPressed: () => twoWheelerPlanSelectionController.payNow()),
      body: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          CompulsoryDriverPAView(),
          InsuranceBackupView(
            isHaveDiscountCoupen: false,
            isShowAsSheet: false,
            onSheetCloseIconTap: () {
              twoWheelerPlanSelectionController.toggleShowBottomSheet();
            },
          ),
          SizedBox(height: 8.h),
          TermsNConditionView(),
          SizedBox(height: 50.h),
        ],
      ),
    );
  }
}
