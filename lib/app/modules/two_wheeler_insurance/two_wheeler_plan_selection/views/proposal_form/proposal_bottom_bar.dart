import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../module_controllers.dart';
import '../../../../../widgets/summary_pay_now_button_view.dart';
import '../summary_view.dart';

class BikeInsurancePropsalBottombar extends StatelessWidget {
  const BikeInsurancePropsalBottombar({
    super.key,
    this.onPremimunIconTap,
    required this.formKeys,
  });

  final List<GlobalKey<FormState>> formKeys;
  final onPremimunIconTap;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => summary_pay_now_button(
        btn_text: twoWheelerPlanSelectionController.currentTabIndex.value == 2
            ? 'save_&_continue'.tr
            : 'continue'.tr,
        price: '₹1,180',
        isIcon: true,
        price_text: 'net_premium'.tr,
        onPressed: () {
          int currentTabIndex =
              twoWheelerPlanSelectionController.currentTabIndex.value;
          int totalTabs =
              twoWheelerPlanSelectionController.tabsForProposal.length;

          if (formKeys[currentTabIndex].currentState!.validate()) {
            if (currentTabIndex < totalTabs - 1) {
              twoWheelerPlanSelectionController.currentTabIndex.value++;
              for (int i = 0; i < totalTabs; i++) {
                twoWheelerPlanSelectionController.tabsForProposal[i].isActive =
                    (i == currentTabIndex + 1);
              }
              twoWheelerPlanSelectionController.tabsForProposal.refresh();
            } else {
              Get.to(SummaryView());
            }
          }
        },
        onPremimunIconTap: onPremimunIconTap,
        widget: Obx(
          () => Icon(
            twoWheelerPlanSelectionController.isToggleIcon.value
                ? Icons.keyboard_arrow_up
                : Icons.keyboard_arrow_down,
            size: 28,
          ),
        ),
      ),
    );
  }
}
