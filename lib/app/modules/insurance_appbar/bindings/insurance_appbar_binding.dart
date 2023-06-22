import 'package:get/get.dart';

import '../controllers/insurance_appbar_controller.dart';

class InsuranceAppbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InsuranceAppbarController>(
      () => InsuranceAppbarController(),
    );
  }
}
