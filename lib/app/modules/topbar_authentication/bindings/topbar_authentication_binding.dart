import 'package:get/get.dart';

import '../controllers/topbar_authentication_controller.dart';

class TopbarAuthenticationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TopbarAuthenticationController>(
      () => TopbarAuthenticationController(),
    );
  }
}
