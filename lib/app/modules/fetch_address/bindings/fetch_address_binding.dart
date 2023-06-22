import 'package:get/get.dart';

import '../controllers/fetch_address_controller.dart';

class FetchAddressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FetchAddressController>(
      () => FetchAddressController(),
    );
  }
}
