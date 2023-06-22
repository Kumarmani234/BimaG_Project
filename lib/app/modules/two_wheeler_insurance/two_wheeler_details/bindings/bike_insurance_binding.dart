import 'package:get/get.dart';

import '../controllers/bike_insurance_controller.dart';

class BikeInsuranceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BikeInsuranceController>(
      () => BikeInsuranceController(),
    );
  }
}
