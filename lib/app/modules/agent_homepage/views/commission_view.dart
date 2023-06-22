import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/modules/agent_comission/views/agent_comission_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../utility/colors.dart';
import '../../../../utility/ts.dart';
import '../../../widgets/agent_item_widget.dart';

class CommissionView extends GetView {
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
                'commission'.tr,
                style: Ts.bold13(AppColors.grey5),
              ),
              Material(
                color: Colors.transparent,
                child: Ink(
                  child: InkWell(
                    onTap: () => Get.to(AgentComissionView()),
                    child: Text(
                      key: Key('commission_key'),
                      'view_all'.tr,
                      style: Ts.regular15(AppColors.primaryColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Container(
            height: 76.h,
            child: Obx(
              () => ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: agentHomepageController.commisionGridList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return AgentItemWidget(
                    imgUrl:
                        agentHomepageController.commisionGridList[index].imgUrl,
                    title: agentHomepageController
                        .commisionGridList[index].title
                        .toString(),
                    subtitle: agentHomepageController
                        .commisionGridList[index].subtitle
                        .toString(),
                    status:
                        agentHomepageController.commisionGridList[index].status,
                    onTap: () => Get.to(AgentComissionView()),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(width: 10.w);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
