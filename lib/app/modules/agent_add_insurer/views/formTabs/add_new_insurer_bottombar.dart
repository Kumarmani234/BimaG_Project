import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../utility/colors.dart';
import '../../../../../utility/styles.dart';
import '../../../../../utility/ts.dart';
import '../../../../module_controllers.dart';
import '../../../../widgets/buttons.dart';

class AddInsurerBottombarView extends GetView {
  AddInsurerBottombarView({
    required this.PersonalDetailTabView,
    required this.documentFormKey,
  });
  final GlobalKey<FormState> PersonalDetailTabView;
  final GlobalKey<FormState> documentFormKey;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (agentAddInsurerController.currentTabIndex.value == 0) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              Styles.upperShadow(),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.only(
                top: 16.h, right: 15.w, left: 16.w, bottom: 16.h),
            child: Container(
              key: Key('add_documents_key'),
              height: 40.h,
              width: 168.w,
              child: RoundSquareButtons.buttonEnabled(
                onPressed: () {
                  if (PersonalDetailTabView.currentState!.validate()) {
                    agentAddInsurerController.currentTabIndex.value++;
                    for (int i = 0;
                        i < agentAddInsurerController.TabList.length;
                        i++) {
                      agentAddInsurerController.TabList[i].isActive =
                          i == agentAddInsurerController.currentTabIndex.value;
                    }
                    agentAddInsurerController.TabList.refresh();
                  }
                },
                text: 'add_documents'.tr,
              ),
            ),
          ),
        );
      } else {
        return Container(
          height: 80.h,
          width: 375.w,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              Styles.upperShadow(),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 50.5.w, top: 26.h),
                child: Material(
                  color: Colors.transparent,
                  child: Ink(
                    child: InkWell(
                      onTap: () => Get.back(),
                      // agentDashboardController.selectedIndex.value = 1,
                      // for (int i = 0;
                      //     i < agentAddInsurerController.TabList.length;
                      //     i++) {
                      //   agentAddInsurerController.TabList[i].isActive = i ==
                      //       agentAddInsurerController.currentTabIndex.value;
                      // }
                      // agentAddInsurerController.TabList.refresh();

                      child: Text(
                        'skip_n_save'.tr,
                        style: Ts.regular15(AppColors.secondaryColor),
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(top: 16.h, right: 15.w),
                child: Container(
                  height: 40.h,
                  width: 168.w,
                  child: RoundSquareButtons.buttonEnabled(
                    onPressed: () {
                      agentAddInsurerController.currentTabIndex.value++;
                      for (int i = 0;
                          i < agentAddInsurerController.TabList.length;
                          i++) {
                        agentAddInsurerController.TabList[i].isActive = i ==
                            agentAddInsurerController.currentTabIndex.value;
                      }
                      agentAddInsurerController.TabList.refresh();
                    },
                    text: 'save'.tr,
                  ),
                ),
              )
            ],
          ),
        );
      }
    });
  }
}
