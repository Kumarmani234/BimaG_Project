import 'package:get/get.dart';

import '../controllers/agent_add_insurer_controller.dart';

class AgentAddInsurerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AgentAddInsurerController>(
      () => AgentAddInsurerController(),
    );
  }
}
