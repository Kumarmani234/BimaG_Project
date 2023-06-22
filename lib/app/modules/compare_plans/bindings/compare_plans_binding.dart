import 'package:get/get.dart';

import '../controllers/compare_plans_controller.dart';

class ComparePlansBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ComparePlansController>(
      () => ComparePlansController(),
    );
  }
}
