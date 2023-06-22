import 'package:get/get.dart';

import '../controllers/agent_homepage_controller.dart';

class AgentHomepageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AgentHomepageController>(
      () => AgentHomepageController(),
    );
  }
}
