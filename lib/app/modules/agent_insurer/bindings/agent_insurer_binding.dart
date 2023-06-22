import 'package:get/get.dart';

import '../controllers/agent_insurer_controller.dart';

class AgentInsurerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AgentInsurerController>(
      () => AgentInsurerController(),
    );
  }
}
