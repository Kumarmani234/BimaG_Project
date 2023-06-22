import 'package:get/get.dart';

import '../controllers/profile_pic_update_controller.dart';

class ProfilePicUpdateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfilePicUpdateController>(
      () => ProfilePicUpdateController(),
    );
  }
}
