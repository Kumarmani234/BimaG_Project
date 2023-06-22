import 'package:get/get.dart';

import '../controllers/sort_by_controller.dart';

class SortByBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SortByController>(
      () => SortByController(),
    );
  }
}
