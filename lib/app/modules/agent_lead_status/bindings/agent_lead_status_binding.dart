import 'package:get/get.dart';

import '../controllers/agent_lead_status_controller.dart';

class AgentLeadStatusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AgentLeadStatusController>(
      () => AgentLeadStatusController(),
    );
  }
}
