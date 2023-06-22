import 'package:get/get.dart';

import '../controllers/near_by_controller.dart';

class NearByBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NearByController>(
      () => NearByController(),
    );
  }
}
