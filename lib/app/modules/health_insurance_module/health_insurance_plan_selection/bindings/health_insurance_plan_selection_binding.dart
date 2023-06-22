import 'package:get/get.dart';

import '../controllers/health_insurance_plan_selection_controller.dart';

class HealthInsurancePlanSelectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HealthInsurancePlanSelectionController>(
      () => HealthInsurancePlanSelectionController(),
    );
  }
}
