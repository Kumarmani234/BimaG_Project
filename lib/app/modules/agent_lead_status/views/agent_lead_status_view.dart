import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/modules/agent_lead_status/views/custom/agent_lead_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../utility/asset_paths.dart';
import '../../../../utility/colors.dart';
import '../../../../utility/styles.dart';
import '../../../widgets/agent_item_widget.dart';
import '../../insurance_appbar/views/insurance_appbar_view.dart';
import '../controllers/agent_lead_status_controller.dart';

class AgentLeadStatusView extends GetView<AgentLeadStatusController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey1,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(135.h),
        child: InsuranceAppbarView(
          title: 'leads'.tr,
          isBottom: true,
          bottom: LeadsAppbarBottom(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 15.w),
        child: Column(
          children: [
            SizedBox(height: 10.h),
            Expanded(
              child: Obx(
                () => ListView.separated(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return AgentLeadItemWidget(
                      agentLeadItemModel:
                          agentLeadStatusController.leadItemsList[index],
                      onClick: () {},
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(height: 8.h),
                  itemCount: agentLeadStatusController.leadItemsList.length,
                ),
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}

class LeadsAppbarBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76.h,
      width: Get.width,
      decoration: BoxDecoration(
          color: AppColors.white, boxShadow: [Styles.dropShadowZ100()]),
      child: Row(
        children: [
          AgentItemWidget(
            width: Get.width / 3 - 20,
            imgUrl: AssetPath.total,
            title: '102',
            subtitle: 'Total',
          ),
          AgentItemWidget(
            width: Get.width / 2.65,
            imgUrl: AssetPath.successful,
            title: '98',
            subtitle: 'Successful',
            status: 1,
          ),
          Expanded(
            child: AgentItemWidget(
              imgUrl: AssetPath.pending,
              title: '2',
              subtitle: 'Pending',
              status: 2,
            ),
          ),
        ],
      ),
    );
  }
}
