import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/widgets/buttons.dart';
import 'package:bima_g/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CommissionCategoriesTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42.h,
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8.w),
      ),
      child: Obx(
        () => Row(
          children: [
            Expanded(
              child: OutlineButton(
                key: Key('all_key'),
                onClicked: () => agentComissionController
                    .currentCommissionTabIndex.value = 0,
                title: 'all'.tr,
                isSelected:
                    agentComissionController.currentCommissionTabIndex.value ==
                        0,
              ),
            ),
            Expanded(
              child: OutlineButton(
                key: Key('earned_key'),
                onClicked: () => agentComissionController
                    .currentCommissionTabIndex.value = 1,
                title: 'earned'.tr,
                isSelected:
                    agentComissionController.currentCommissionTabIndex.value ==
                        1,
              ),
            ),
            Expanded(
              child: OutlineButton(
                key: Key('pending_key'),
                onClicked: () => agentComissionController
                    .currentCommissionTabIndex.value = 2,
                title: 'pending'.tr,
                isSelected:
                    agentComissionController.currentCommissionTabIndex.value ==
                        2,
              ),
            ),
            Expanded(
              child: OutlineButton(
                key: Key('withdrawal_key'),
                onClicked: () => agentComissionController
                    .currentCommissionTabIndex.value = 3,
                title: 'withdrawal'.tr,
                isSelected:
                    agentComissionController.currentCommissionTabIndex.value ==
                        3,
              ),
            )
          ],
        ),
      ),
    );
  }
}
