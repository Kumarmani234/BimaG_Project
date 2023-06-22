import 'package:bima_g/app/modules/health_insurance_module/health_insurance_plan_selection/views/proposal_from/congratulations_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../module_controllers.dart';
import '../../../../widgets/summary_pay_now_button_view.dart';

class HealthSlectionBottomBarView extends GetView {
  HealthSlectionBottomBarView({required this.formKeys, this.onPremimunIconTap});

  final List<GlobalKey<FormState>> formKeys;
  final onPremimunIconTap;
  @override
  Widget build(BuildContext context) {
    return Obx(
          () => summary_pay_now_button(
        widget: Obx(
              () => Icon(
            healthInsurancePlanSelectionController.isToggleIcon.value
                ? Icons.keyboard_arrow_up
                : Icons.keyboard_arrow_down,
            size: 28,
          ),
        ),
        btn_text:
        healthInsurancePlanSelectionController.currentTabIndex.value == 3
            ? 'save_&_continue'.tr
            : 'continue'.tr,
        price: '₹1,180',
        isIcon: true,
        price_text: 'net_premium'.tr,
        onPressed: () {
          int currentTabIndex =
              healthInsurancePlanSelectionController.currentTabIndex.value;
          int totalTabs =
              healthInsurancePlanSelectionController.healthTabs.length;

          if (formKeys[currentTabIndex].currentState!.validate()) {
            if (currentTabIndex < totalTabs - 1) {
              healthInsurancePlanSelectionController.currentTabIndex.value++;
              for (int i = 0; i < totalTabs; i++) {
                healthInsurancePlanSelectionController.healthTabs[i].isActive =
                (i == currentTabIndex + 1);
              }
              healthInsurancePlanSelectionController.healthTabs.refresh();
            } else {
              Get.to(CongratulationsView());
            }
          }
        },
        onPremimunIconTap: onPremimunIconTap,
      ),
    );
  }
}
