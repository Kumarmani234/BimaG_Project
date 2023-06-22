// ignore_for_file: must_be_immutable

import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/utility/colors.dart';
import 'package:bima_g/utility/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../utility/ts.dart';
import '../model/tab_model.dart';

class PoliciesTabsView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8.h)),
          boxShadow: [Styles.dropShadowZ100()]),
      child: Obx(
        () => Row(
          children: [
            for (int i = 0; i < policiesController.listTabs.length; i++)
              Expanded(
                child: TabButton(
                  policyTabModel: policiesController.listTabs[i],
                  onClick: () {
                    HapticFeedback.mediumImpact();
                    policiesController.currentTabIndex.value = i;
                    for (int i = 0;
                        i < policiesController.listTabs.length;
                        i++) {
                      policiesController.listTabs[i].isSelected = false;
                    }
                    policiesController.listTabs[i].isSelected = true;
                    policiesController.listTabs.refresh();
                  },
                ),
              )
          ],
        ),
      ),
    );
  }
}

class TabButton extends StatelessWidget {
  TabButton({
    Key? key,
    this.policyTabModel,
    this.onClick,
  }) : super(key: key);

  PolicyTabModel? policyTabModel;
  final onClick;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: InkWell(
        onTap: onClick,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Center(
              child: Text(
                policyTabModel!.tabName,
                textAlign: TextAlign.center,
                style: Ts.medium15(policyTabModel!.isSelected
                    ? AppColors.primaryColor
                    : AppColors.grey4),
              ),
            )),
            Container(
              height: 2.h,
              color: policyTabModel!.isSelected
                  ? AppColors.primaryColor
                  : AppColors.grey4,
            )
          ],
        ),
      ),
    );
  }
}
