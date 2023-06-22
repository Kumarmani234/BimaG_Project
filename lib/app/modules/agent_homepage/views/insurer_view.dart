import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/modules/agent_insurer/views/agent_insurer_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../utility/colors.dart';
import '../../../../utility/ts.dart';
import 'custom/insurer_email_item.dart';

class InsurerView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h, left: 15.w, right: 15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'insurer'.tr,
                style: Ts.bold13(AppColors.grey5),
              ),
              Material(
                color: Colors.transparent,
                child: Ink(
                  child: InkWell(
                    onTap: () =>
                        agentDashboardController.selectedIndex.value = 1,
                    child: Text(
                      key:Key('insurer_key'),
                      'view_all'.tr,
                      style: Ts.regular15(AppColors.primaryColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Obx(
            () => ListView.separated(
              physics: BouncingScrollPhysics(),
              itemCount: agentHomepageController.insurerList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return InsurerEmailItem(
                  key: Key('insurer_${index}_key'),
                  insurerItemModel: agentHomepageController.insurerList[index],
                  onClick: () {
                    HapticFeedback.mediumImpact();
                    OnInsureClick();
                  },
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 10.w);
              },
            ),
          ),
        ],
      ),
    );
  }
}
