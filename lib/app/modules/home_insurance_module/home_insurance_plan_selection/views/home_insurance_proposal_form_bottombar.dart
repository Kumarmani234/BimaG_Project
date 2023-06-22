import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../module_controllers.dart';
import '../../../../widgets/summary_pay_now_button_view.dart';

class home_insurance_proposal_bottombar extends StatelessWidget {
  const home_insurance_proposal_bottombar({
    super.key,
    required this.formKeys,
    this.onPremimunIconTap,
  });

  final List<GlobalKey<FormState>> formKeys;
  final onPremimunIconTap;

  @override
  Widget build(BuildContext context) {
    // Create a list of form keys

    return summary_pay_now_button(
      btn_text: 'continue'.tr,
      price: '₹1,180',
      isIcon: true,
      price_text: 'net_premium'.tr,
      onPressed: () {
        int currentTabIndex =
            homeInsurancePlanSelectionController.currentTabIndex.value;
        int totalTabs =
            homeInsurancePlanSelectionController.HomeProposalTabList.length;

        // Validate the current form using the corresponding form key
        if (formKeys[currentTabIndex].currentState!.validate()) {
          if (currentTabIndex < totalTabs - 1) {
            homeInsurancePlanSelectionController.currentTabIndex.value++;
            for (int i = 0; i < totalTabs; i++) {
              homeInsurancePlanSelectionController
                  .HomeProposalTabList[i].isActive = (i == currentTabIndex + 1);
            }
            homeInsurancePlanSelectionController.HomeProposalTabList.refresh();
          }
        }
      },
      onPremimunIconTap: onPremimunIconTap,
      widget: Obx(
        () => Icon(
          homeInsurancePlanSelectionController.isToggleIcon.value
              ? Icons.keyboard_arrow_up
              : Icons.keyboard_arrow_down,
          size: 28,
        ),
      ),
    );
  }
}
