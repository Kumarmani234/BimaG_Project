import 'package:get/get.dart';

import '../controllers/agent_link_status_controller.dart';

class AgentLinkStatusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AgentLinkStatusController>(
      () => AgentLinkStatusController(),
    );
  }
}
