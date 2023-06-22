import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/modules/help/views/component_views/help_intro_search_view.dart';
import 'package:bima_g/app/modules/help/views/component_views/policies_view.dart';
import 'package:bima_g/app/modules/help/views/component_views/tickets_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../controllers/help_controller.dart';

class HelpView extends GetView<HelpController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SmartRefresher(
        controller: helpController.helpHomeRefreshController,
        onRefresh: helpController.onHelpHomeRefresh,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 56.h),
              HelpIntroSearchview(),
              PoliciesView(),
              TicketsPolicyView(),
            ],
          ),
        ),
      ),
    );
  }
}
