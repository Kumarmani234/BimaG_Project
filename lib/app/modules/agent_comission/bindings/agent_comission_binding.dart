import 'package:get/get.dart';

import '../controllers/agent_comission_controller.dart';

class AgentComissionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AgentComissionController>(
      () => AgentComissionController(),
    );
  }
}
