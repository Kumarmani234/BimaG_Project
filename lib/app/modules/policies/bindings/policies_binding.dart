import 'package:get/get.dart';

import '../controllers/policies_controller.dart';

class OfflinePoliciesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PoliciesController>(
      () => PoliciesController(),
    );
  }
}
