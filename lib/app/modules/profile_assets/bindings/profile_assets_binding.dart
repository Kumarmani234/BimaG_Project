import 'package:get/get.dart';

import '../controllers/profile_assets_controller.dart';

class ProfileAssetsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileAssetsController>(
      () => ProfileAssetsController(),
    );
  }
}
