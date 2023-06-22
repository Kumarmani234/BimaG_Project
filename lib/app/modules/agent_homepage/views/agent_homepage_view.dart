import 'package:bima_g/app/modules/agent_homepage/views/insurer_view.dart';
import 'package:bima_g/app/modules/agent_homepage/views/lead_status_view.dart';
import 'package:bima_g/app/modules/agent_homepage/views/commission_view.dart';
import 'package:bima_g/app/modules/agent_homepage/views/link_status_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../utility/colors.dart';
import '../../../module_controllers.dart';
import '../../homepage/views/top_app_bar_view.dart';
import '../../menu_drawer/views/menu_drawer_view.dart';
import '../controllers/agent_homepage_controller.dart';

class AgentHomepageView extends GetView<AgentHomepageController> {
  const AgentHomepageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: agentHomepageController.agentScaffoldKey,
      backgroundColor: AppColors.grey1,
      drawer: MenuDrawerView(),
      appBar: PreferredSize(
        child: Obx(
          () => TopAppBarView(
            isAgentTopbar: true,
            actionIcon: Icons.notifications_none_outlined,
            title: 'Agent - Hardiksinh Chudasam..',
            subtitle: 'BimaG001',
            imgUrl: dashboardController.profileUrl.value,
            OnTap: () => agentHomepageController.agentScaffoldKey.currentState!
                .openDrawer(),
          ),
        ),
        preferredSize: Size.fromHeight(70.h),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          CommissionView(),
          LeadsStatusView(),
          LinkStatusView(),
          InsurerView(),
        ],
      ),
    );
  }
}
