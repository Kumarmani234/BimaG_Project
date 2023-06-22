import 'package:get/get.dart';

import '../controllers/car_insurance_controller.dart';

class CarInsuranceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CarInsuranceController>(
      () => CarInsuranceController(),
    );
  }
}
