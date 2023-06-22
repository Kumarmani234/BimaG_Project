import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../module_controllers.dart';
import '../../../../../widgets/summary_pay_now_button_view.dart';
import '../car_insurance_summary_view.dart';

class CarInsurancePropsalBottombar extends StatelessWidget {
  const CarInsurancePropsalBottombar({
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
        btn_text: carInsurancePlanSelectionController.currentTabIndex.value == 2
            ? 'save_&_continue'.tr
            : 'continue'.tr,
        price: '₹1,180',
        isIcon: true,
        price_text: 'net_premium'.tr,
        onPressed: () {
          int currentTabIndex =
              carInsurancePlanSelectionController.currentTabIndex.value;
          int totalTabs =
              carInsurancePlanSelectionController.tabsForProposal.length;

          if (formKeys[currentTabIndex].currentState!.validate()) {
            if (currentTabIndex < totalTabs - 1) {
              carInsurancePlanSelectionController.currentTabIndex.value++;
              for (int i = 0; i < totalTabs; i++) {
                carInsurancePlanSelectionController
                    .tabsForProposal[i].isActive = (i == currentTabIndex + 1);
              }
              carInsurancePlanSelectionController.tabsForProposal.refresh();
            } else {
              Get.to(CarInsuranceSummaryView());
            }
          }
        },
        onPremimunIconTap: onPremimunIconTap,
        widget: Obx(
          () => Icon(
            carInsurancePlanSelectionController.isToggleIcon.value
                ? Icons.keyboard_arrow_up
                : Icons.keyboard_arrow_down,
            size: 28,
          ),
        ),
      ),
    );
  }
}
