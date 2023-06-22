// ignore_for_file: must_be_immutable

import 'package:bima_g/app/module_controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../utility/colors.dart';
import '../../insurance_appbar/views/insurance_appbar_view.dart';
import 'formTabs/add_new_insurer_bottombar.dart';
import 'formTabs/insurer_documnet_tab.dart';
import 'formTabs/add_new_insurer_tabview.dart';
import 'formTabs/insurer_personal_info_tabview.dart';

class AgentAddInsurerView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey1,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: InsuranceAppbarView(
          title: 'add_new_insurer'.tr,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.w),
              ),
              child: AddInsurerFormTabbarView(),
            ),
          ),
          Obx(
            () {
              switch (agentAddInsurerController.currentTabIndex.value) {
                case 0:
                  return Expanded(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Form(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        key: agentAddInsurerController.personalInfoFormKey,
                        child: InsurerPersonalInfoForm(),
                      ),
                    ),
                  );
                case 1:
                  return Expanded(
                    child: InsurerDocumnetTab(),
                    // DocumentTabView()
                  );
                default:
                  return Container(); // handle invalid index
              }
            },
          ),
        ],
      ),
      bottomNavigationBar: AddInsurerBottombarView(
        PersonalDetailTabView: agentAddInsurerController.personalInfoFormKey,
        documentFormKey: agentAddInsurerController.documentFormKey,
      ),
    );
  }
}
