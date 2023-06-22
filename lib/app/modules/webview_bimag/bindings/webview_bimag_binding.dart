import 'package:get/get.dart';

import '../controllers/webview_bimag_controller.dart';

class WebviewBimagBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WebviewBimagController>(
      () => WebviewBimagController(),
    );
  }
}
