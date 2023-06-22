import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../filter_expand_button_view.dart';

class PolicyBenefitsView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FilterExpandButtonView(
          index: 2,
          child: Obx(() => Column(
            children: [
              policyFilterController.selectedPolicyBenefits.value == 1 ? RoundSquareButtons.buttonEnableNavigationExpanded(onPressed: ()=>policyFilterController.selectedPolicyBenefits.value = 1, text: 'Pre-hospitalisation covered') : RoundSquareButtons.buttonDisableNavigationExpanded(onPressed: ()=>policyFilterController.selectedPolicyBenefits.value = 1, text: 'Pre-hospitalisation covered'),
              policyFilterController.selectedPolicyBenefits.value == 2 ? RoundSquareButtons.buttonEnableNavigationExpanded(onPressed: ()=>policyFilterController.selectedPolicyBenefits.value = 2, text: 'Day care treatments') : RoundSquareButtons.buttonDisableNavigationExpanded(onPressed: ()=>policyFilterController.selectedPolicyBenefits.value = 2, text: 'Day care treatments'),
              policyFilterController.selectedPolicyBenefits.value == 3 ? RoundSquareButtons.buttonEnableNavigationExpanded(onPressed: ()=>policyFilterController.selectedPolicyBenefits.value = 3, text: 'Restoration benefits') : RoundSquareButtons.buttonDisableNavigationExpanded(onPressed: ()=>policyFilterController.selectedPolicyBenefits.value = 3, text: 'Restoration benefits'),
              policyFilterController.selectedPolicyBenefits.value == 4 ? RoundSquareButtons.buttonEnableNavigationExpanded(onPressed: ()=>policyFilterController.selectedPolicyBenefits.value = 4, text: 'Doctor consultation and pharmacy') : RoundSquareButtons.buttonDisableNavigationExpanded(onPressed: ()=>policyFilterController.selectedPolicyBenefits.value = 4, text: 'Doctor consultation and pharmacy'),
              policyFilterController.selectedPolicyBenefits.value == 5 ? RoundSquareButtons.buttonEnableNavigationExpanded(onPressed: ()=>policyFilterController.selectedPolicyBenefits.value = 5, text: 'Post hospitalisation covered') : RoundSquareButtons.buttonDisableNavigationExpanded(onPressed: ()=>policyFilterController.selectedPolicyBenefits.value = 5, text: 'Post hospitalisation covered'),
              policyFilterController.selectedPolicyBenefits.value == 6 ? RoundSquareButtons.buttonEnableNavigationExpanded(onPressed: ()=>policyFilterController.selectedPolicyBenefits.value = 6, text: 'No claimed Bonusd') : RoundSquareButtons.buttonDisableNavigationExpanded(onPressed: ()=>policyFilterController.selectedPolicyBenefits.value = 6, text: 'No claimed Bonus'),
              policyFilterController.selectedPolicyBenefits.value == 7 ? RoundSquareButtons.buttonEnableNavigationExpanded(onPressed: ()=>policyFilterController.selectedPolicyBenefits.value = 7, text: 'Free health checkup') : RoundSquareButtons.buttonDisableNavigationExpanded(onPressed: ()=>policyFilterController.selectedPolicyBenefits.value = 7, text: 'Free health checkup'),
            ],
          )),
        ),
      ],
    );
  }
}

