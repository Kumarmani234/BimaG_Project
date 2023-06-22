import 'package:get/get.dart';

import '../controllers/home_insurance_controller.dart';

class HomeInsuranceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeInsuranceController>(
      () => HomeInsuranceController(),
    );
  }
}
