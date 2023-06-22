import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utility/colors.dart';
import '../controllers/dashboard_controller.dart';
import 'bottom_navigation_bar_view.dart';

class DashboardView extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey1,
      bottomNavigationBar: BottomNavigationBarView(),
      body:
          Obx(() => controller.dashboardPages[controller.selectedIndex.value]),
    );
  }
}
