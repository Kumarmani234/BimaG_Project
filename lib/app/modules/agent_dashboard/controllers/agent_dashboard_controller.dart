import 'package:bima_g/app/modules/agent_homepage/views/agent_homepage_view.dart';
import 'package:bima_g/app/modules/agent_insurer/views/agent_insurer_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../help/views/help_home_view.dart';
import '../../profile/views/my_profile_main.dart';

class AgentDashboardController extends GetxController {
  Rx<int> selectedIndex = 0.obs;

  List<Widget> dashboardPages = <Widget>[
    AgentHomepageView(),
    AgentInsurerView(),
    MyProfileMainView(),
    HelpView()
  ];

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
