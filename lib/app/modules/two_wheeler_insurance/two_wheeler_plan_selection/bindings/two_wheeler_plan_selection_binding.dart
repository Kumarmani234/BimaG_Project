import 'package:get/get.dart';

import '../controllers/two_wheeler_plan_selection_controller.dart';

class TwoWheelerPlanSelectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TwoWheelerPlanSelectionController>(
      () => TwoWheelerPlanSelectionController(),
    );
  }
}
