import 'package:bima_g/app/modules/policy_filter/views/filter_expand_button_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../module_controllers.dart';
import '../../../../widgets/buttons.dart';

class CoverOnExpiringPolicyView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FilterExpandButtonView(
          index: 4,
          child: Obx(() => Column(
                children: [
                  policyFilterController.selectedCoverOfExpiringPolicy.value ==
                          1
                      ? RoundSquareButtons.buttonEnableNavigationExpanded(
                          onPressed: () => policyFilterController
                              .selectedCoverOfExpiringPolicy.value = 1,
                          text: 'Standard/Comprehensive')
                      : RoundSquareButtons.buttonDisableNavigationExpanded(
                          onPressed: () => policyFilterController
                              .selectedCoverOfExpiringPolicy.value = 1,
                          text: 'Standard/Comprehensive'),
                  policyFilterController.selectedCoverOfExpiringPolicy.value ==
                          2
                      ? RoundSquareButtons.buttonEnableNavigationExpanded(
                          onPressed: () => policyFilterController
                              .selectedCoverOfExpiringPolicy.value = 2,
                          text: 'Third party/Liability only')
                      : RoundSquareButtons.buttonDisableNavigationExpanded(
                          onPressed: () => policyFilterController
                              .selectedCoverOfExpiringPolicy.value = 2,
                          text: 'Third party/Liability only'),
                  policyFilterController.selectedCoverOfExpiringPolicy.value ==
                          3
                      ? RoundSquareButtons.buttonEnableNavigationExpanded(
                          onPressed: () => policyFilterController
                              .selectedCoverOfExpiringPolicy.value = 3,
                          text: 'I don’t remember')
                      : RoundSquareButtons.buttonDisableNavigationExpanded(
                          onPressed: () => policyFilterController
                              .selectedCoverOfExpiringPolicy.value = 3,
                          text: 'I don’t remember'),
                ],
              )),
        ),
      ],
    );
  }
}
