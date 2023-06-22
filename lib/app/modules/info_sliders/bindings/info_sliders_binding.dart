import 'package:get/get.dart';

import '../controllers/info_sliders_controller.dart';

class InfoSlidersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InfoSlidersController>(
      () => InfoSlidersController(),
    );
  }
}
