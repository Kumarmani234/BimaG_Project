import 'package:get/get.dart';

import '../controllers/home_insurance_plan_selection_controller.dart';

class HomeInsurancePlanSelectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeInsurancePlanSelectionController>(
      () => HomeInsurancePlanSelectionController(),
    );
  }
}
