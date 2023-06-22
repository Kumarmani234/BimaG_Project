import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/modules/agent_dashboard/views/agent_bottom_navigationbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utility/colors.dart';
import '../controllers/agent_dashboard_controller.dart';

class AgentDashboardView extends GetView<AgentDashboardController> {
  const AgentDashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey1,
      bottomNavigationBar: AgentBottomNavigationBarView(),
      body: Obx(
        () => agentDashboardController
            .dashboardPages[agentDashboardController.selectedIndex.value],
      ),
    );
  }
}
