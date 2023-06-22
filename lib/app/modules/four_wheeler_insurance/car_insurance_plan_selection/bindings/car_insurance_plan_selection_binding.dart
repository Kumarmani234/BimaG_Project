import 'package:get/get.dart';

import '../controllers/car_insurance_plan_selection_controller.dart';

class CarInsurancePlanSelectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CarInsurancePlanSelectionController>(
      () => CarInsurancePlanSelectionController(),
    );
  }
}
