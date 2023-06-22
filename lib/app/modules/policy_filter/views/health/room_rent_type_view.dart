import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../filter_expand_button_view.dart';

class RoomRentTypeView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FilterExpandButtonView(
          index: 1,
          child: Obx(() => Column(
                children: [
                  policyFilterController.selectedRoomRentType.value == 1
                      ? RoundSquareButtons.buttonEnableNavigationExpanded(
                          onPressed: () {}, text: 'No preference')
                      : RoundSquareButtons.buttonDisableNavigationExpanded(
                          onPressed: () => policyFilterController
                              .selectedRoomRentType.value = 1,
                          text: 'No preference'),
                  policyFilterController.selectedRoomRentType.value == 2
                      ? RoundSquareButtons.buttonEnableNavigationExpanded(
                          onPressed: () => policyFilterController
                              .selectedRoomRentType.value = 2,
                          text: 'No room rent limit')
                      : RoundSquareButtons.buttonDisableNavigationExpanded(
                          onPressed: () => policyFilterController
                              .selectedRoomRentType.value = 2,
                          text: 'No room rent limit'),
                  policyFilterController.selectedRoomRentType.value == 3
                      ? RoundSquareButtons.buttonEnableNavigationExpanded(
                          onPressed: () => policyFilterController
                              .selectedRoomRentType.value = 3,
                          text: 'Private room')
                      : RoundSquareButtons.buttonDisableNavigationExpanded(
                          onPressed: () => policyFilterController
                              .selectedRoomRentType.value = 3,
                          text: 'Private room'),
                  policyFilterController.selectedRoomRentType.value == 4
                      ? RoundSquareButtons.buttonEnableNavigationExpanded(
                          onPressed: () => policyFilterController
                              .selectedRoomRentType.value = 4,
                          text: 'Shared room')
                      : RoundSquareButtons.buttonDisableNavigationExpanded(
                          onPressed: () => policyFilterController
                              .selectedRoomRentType.value = 4,
                          text: 'Shared room'),
                ],
              )),
        ),
      ],
    );
  }
}
