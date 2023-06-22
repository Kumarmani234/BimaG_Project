import 'package:bima_g/app/modules/agent_comission/views/Withdrawal/withdrawel_congratulations_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../utility/colors.dart';
import '../../../../../utility/styles.dart';
import '../../../../../utility/ts.dart';
import '../../../../insurance_components/start_and_end_text_in_row_view.dart';
import '../../../../module_controllers.dart';
import '../../../../widgets/summary_pay_now_button_view.dart';

class withdrawalBottomView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return summary_pay_now_button(
      onPressed: () => Get.to(WithdrawelCongratulationsView()),
      price_text: 'net_withdrawal'.tr,
      isIcon: true,
      widget: Obx(
        () => Icon(
          key:Key('drop_key'),
          agentComissionController.isToggleIcon.value
              ? Icons.keyboard_arrow_up
              : Icons.keyboard_arrow_down,
          size: 28,
        ),
      ),
      isIconToggle: agentComissionController.isToggleIcon.value,
      onPremimunIconTap: () {
        agentComissionController.toggleShowBottomSheet();
        agentComissionController.toggleBottomIcon();
      },
      price: '₹6,560',
      btn_text: 'continue'.tr,
    );
  }
}

class WithdrawelBackupView extends GetView {
  WithdrawelBackupView({
    this.onSheetCloseIconTap,
  });

  final onSheetCloseIconTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.0.w),
          topRight: Radius.circular(24.0.w),
          bottomLeft: Radius.circular(8.0.w),
          bottomRight: Radius.circular(8.0.w),
        ),
        boxShadow: [Styles.upperShadow()],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'withdrawal_breakup'.tr,
                  style: Ts.medium17(AppColors.secondaryColor),
                ),
                Spacer(),
                IconButton(
                  onPressed: onSheetCloseIconTap,
                  icon: Icon(
                    Icons.cancel_outlined,
                    color: AppColors.secondaryColor,
                  ),
                )
              ],
            ),
            Obx(
              () => ListView.separated(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount:
                    agentComissionController.withdrawelBreakupList.length,
                itemBuilder: (ctx, index) => StartToEndTextInRowView(
                  key_text: agentComissionController
                      .withdrawelBreakupList[index].keyText
                      .toString(),
                  value_text: agentComissionController
                      .withdrawelBreakupList[index].valueText
                      .toString(),
                ),
                separatorBuilder: (BuildContext context, int index) =>
                    Container(
                  height: 1.5.h,
                  width: 313.w,
                  color: AppColors.grey1,
                  margin: EdgeInsets.symmetric(vertical: 8.h),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
