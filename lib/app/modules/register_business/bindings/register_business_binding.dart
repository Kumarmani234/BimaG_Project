import 'package:get/get.dart';

import '../controllers/register_business_controller.dart';

class RegisterBusinessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterBusinessController>(
      () => RegisterBusinessController(),
    );
  }
}
