import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/modules/agent_lead_status/views/agent_lead_status_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../utility/colors.dart';
import '../../../../utility/ts.dart';
import '../../../widgets/agent_item_widget.dart';

class LeadsStatusView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 24.h, left: 15.w, right: 15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'leads_status'.tr,
                style: Ts.bold13(AppColors.grey5),
              ),
              Material(
                color: Colors.transparent,
                child: Ink(
                  child: InkWell(
                    onTap: () => Get.to(AgentLeadStatusView()),
                    child: Text(
                      key: Key('lead_status_key'),
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
            () => GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 6.w,
                mainAxisExtent: 76.h,
                mainAxisSpacing: 6.h,
              ),
              itemCount: agentHomepageController.leadStatusGridList.length,
              itemBuilder: (context, index) {
                return Obx(
                  () => AgentItemWidget(
                    imgUrl: agentHomepageController
                        .leadStatusGridList[index].imgUrl,
                    title: agentHomepageController
                        .leadStatusGridList[index].title
                        .toString(),
                    subtitle: agentHomepageController
                        .leadStatusGridList[index].subtitle
                        .toString(),
                    status: agentHomepageController
                        .leadStatusGridList[index].status,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
