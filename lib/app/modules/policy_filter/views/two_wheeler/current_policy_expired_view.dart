import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../filter_expand_button_view.dart';

class CurrentPolicyExpiredView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FilterExpandButtonView(
            index: 3,
            child: Obx(() => Column(
              children: [
                policyFilterController.selectedCurrentPolicyExpiredOption.value == 1 ? RoundSquareButtons.buttonEnableNavigationExpanded(onPressed: ()=>policyFilterController.selectedCurrentPolicyExpiredOption.value = 1, text: 'Not Expired') : RoundSquareButtons.buttonDisableNavigationExpanded(onPressed: ()=>policyFilterController.selectedCurrentPolicyExpiredOption.value = 1, text: 'Not Expired'),
                policyFilterController.selectedCurrentPolicyExpiredOption.value == 2 ? RoundSquareButtons.buttonEnableNavigationExpanded(onPressed: ()=>policyFilterController.selectedCurrentPolicyExpiredOption.value = 2, text: 'Expired within 90 Days') : RoundSquareButtons.buttonDisableNavigationExpanded(onPressed: ()=>policyFilterController.selectedCurrentPolicyExpiredOption.value = 2, text: 'Expired within 90 Days'),
                policyFilterController.selectedCurrentPolicyExpiredOption.value == 3 ? RoundSquareButtons.buttonEnableNavigationExpanded(onPressed: ()=>policyFilterController.selectedCurrentPolicyExpiredOption.value = 3, text: 'Expired more than 90 Days ago') : RoundSquareButtons.buttonDisableNavigationExpanded(onPressed: ()=>policyFilterController.selectedCurrentPolicyExpiredOption.value = 3, text: 'Expired more than 90 Days ago'),
                policyFilterController.selectedCurrentPolicyExpiredOption.value == 4 ? RoundSquareButtons.buttonEnableNavigationExpanded(onPressed: ()=>policyFilterController.selectedCurrentPolicyExpiredOption.value = 4, text: 'I don’t remember') : RoundSquareButtons.buttonDisableNavigationExpanded(onPressed: ()=>policyFilterController.selectedCurrentPolicyExpiredOption.value = 4, text: 'I don’t remember'),
              ],
            )),
        ),
      ],
    );
  }
}

