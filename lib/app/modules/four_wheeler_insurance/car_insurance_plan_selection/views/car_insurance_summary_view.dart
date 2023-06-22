import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/modules/four_wheeler_insurance/car_insurance_plan_selection/views/summary/car_insurance_compulsory_driver_p_a_view.dart';
import 'package:bima_g/app/modules/four_wheeler_insurance/car_insurance_plan_selection/views/summary/car_insurance_summary_top_row_view.dart';
import 'package:bima_g/app/modules/payment/views/payment_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../insurance_components/insurance_backup_selection_view.dart';
import '../../../insurance_appbar/views/insurance_appbar_view.dart';
import '../../../../widgets/summary_pay_now_button_view.dart';
import '../../../two_wheeler_insurance/two_wheeler_plan_selection/views/summary/terms_n_condition_view.dart';

class CarInsuranceSummaryView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: InsuranceAppbarView(
          title: 'Summary',
          isBottom: true,
          bottom: CarInsuranceSummaryTopRowView(),
        ),
        preferredSize: Size.fromHeight(140.h),
      ),
      bottomNavigationBar: summary_pay_now_button(
          btn_text: 'Pay Now',
          price: '₹1,180',
          price_text: 'Total Amount',
          onPressed: () {
            paymentController.startTimer();

            Get.to(PaymentView())!
                .then((value) => paymentController.stopTimer());
          }),
      body: ListView(
        children: [
          CarInsuranceCompulsoryDriverPAView(),
          InsuranceBackupView(
            isHaveDiscountCoupen: false,
            isShowAsSheet: false,
            onSheetCloseIconTap: () {
              carInsurancePlanSelectionController.toggleShowBottomSheet();
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
