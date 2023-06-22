import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/modules/agent_link_status/views/agent_link_status_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../utility/colors.dart';
import '../../../../utility/ts.dart';
import '../../../widgets/agent_item_widget.dart';

class LinkStatusView extends GetView {
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
                'link_status'.tr,
                style: Ts.bold13(AppColors.grey5),
              ),
              Material(
                color: Colors.transparent,
                child: Ink(
                  child: InkWell(
                    onTap: () => Get.to(AgentLinkStatusView()),
                    child: Text(
                      key: Key('link_status_key'),
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
                crossAxisCount: 3,
                childAspectRatio: 151 / 91,
                crossAxisSpacing: 8.w,
              ),
              itemCount: agentHomepageController.linkStatusGridList.length,
              itemBuilder: (context, index) {
                return Obx(
                  () => AgentItemWidget(
                    imgUrl: agentHomepageController
                        .linkStatusGridList[index].imgUrl,
                    title: agentHomepageController
                        .linkStatusGridList[index].title
                        .toString(),
                    subtitle: agentHomepageController
                        .linkStatusGridList[index].subtitle
                        .toString(),
                    status: agentHomepageController
                        .linkStatusGridList[index].status,
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
