// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/modules/agent_comission/views/Withdrawal/enter_amount_view.dart';
import 'package:bima_g/app/modules/agent_comission/views/Withdrawal/withdrawel_bottom_view.dart';
import 'package:bima_g/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../insurance_appbar/views/insurance_appbar_view.dart';
import '../agent_comission_view.dart';
import 'bank_selection_view.dart';

class WithdrawalFormView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey1,
      appBar: PreferredSize(
        child: InsuranceAppbarView(
          // title: 'withdrawal'.tr,
          title: 'withdrawal'.tr,
          actions: [CommisionActionBtn()],
        ),
        preferredSize: Size.fromHeight(60.h),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              EnterAmountView(),
              SizedBox(height: 16.h),
              SelectBankView()
            ],
          ),
        ),
      ),
      bottomSheet: Obx(
        () => Visibility(
          visible: agentComissionController.isShowBottomSheet.value,
          child: WithdrawelBackupView(
            onSheetCloseIconTap: () {
              agentComissionController.toggleShowBottomSheet();
              agentComissionController.toggleBottomIcon();
            },
          ),
        ),
      ),
      bottomNavigationBar: withdrawalBottomView(),
    );
  }
}
