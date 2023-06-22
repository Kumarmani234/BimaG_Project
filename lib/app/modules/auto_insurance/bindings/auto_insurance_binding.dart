import 'package:get/get.dart';

import '../controllers/auto_insurance_controller.dart';

class AutoInsuranceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AutoInsuranceController>(
      () => AutoInsuranceController(),
    );
  }
}
