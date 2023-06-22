import 'package:get/get.dart';

import '../controllers/policy_filter_controller.dart';

class PolicyFilterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PolicyFilterController>(
      () => PolicyFilterController(),
    );
  }
}
