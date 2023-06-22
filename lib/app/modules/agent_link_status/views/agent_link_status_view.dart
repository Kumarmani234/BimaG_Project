// ignore_for_file: must_be_immutable

import 'package:bima_g/app/form_validation_expressions.dart';
import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/modules/agent_link_status/views/custom/link_item_widget.dart';
import 'package:bima_g/app/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../utility/asset_paths.dart';
import '../../../../utility/colors.dart';
import '../../../../utility/styles.dart';
import '../../../widgets/agent_item_widget.dart';
import '../../../widgets/bottomsheet.dart';
import '../../../widgets/textfields.dart';
import '../../insurance_appbar/views/insurance_appbar_view.dart';
import '../controllers/agent_link_status_controller.dart';

class AgentLinkStatusView extends GetView<AgentLinkStatusController> {
  FormFieldValidExpression formFieldValidExpression =
      FormFieldValidExpression();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey1,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(135.h),
        child: InsuranceAppbarView(
          title: 'links'.tr,
          isBottom: true,
          bottom: LinksAppbarBottom(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 15.w),
        child: Column(
          children: [
            SizedBox(height: 24.h),
            Expanded(
              child: Obx(
                () => ListView.separated(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return AgentLinkItemWidget(
                      agentLinkItemModel:
                          agentLinkStatusController.linkItemList[index],
                      onClick: () {},
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(height: 8.h),
                  itemCount: agentLinkStatusController.linkItemList.length,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomButton(
        key: Key('create_link_key'),
        text: 'create_link'.tr,
        onClick: () =>
            CustomBottomSheet(title: 'create_link'.tr).showBottomSheet(
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                BorderTextField(
                  key: Key('link_title_key'),
                  hintText: 'link_title'.tr,
                  titleText: 'link_title'.tr + "*",
                  controller:
                      agentLinkStatusController.linkTitleController.value,
                  onValidate: (val) {
                    if (val.toString().isEmpty) {
                      return 'please_enter_link_title'.tr;
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 16.h),
                BorderTextField(
                  key: Key('link_name_key'),
                  hintText: 'link_name'.tr,
                  titleText: 'link_name'.tr + "*",
                  controller:
                      agentLinkStatusController.linkNameController.value,
                  onValidate: (val) {
                    if (val.toString().isEmpty) {
                      return 'please_enter_link_name'.tr;
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 24.h),
                SizedBox(
                  width: Get.width,
                  child: RoundSquareButtons.buttonEnabled(
                      onPressed: () {}, text: 'create_n_share'.tr),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LinksAppbarBottom extends StatelessWidget {
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
            width: Get.width / 3,
            imgUrl: AssetPath.link,
            title: '102',
            subtitle: 'Total',
          ),
          AgentItemWidget(
            width: Get.width / 3,
            imgUrl: AssetPath.eye,
            title: '504',
            subtitle: 'Views',
            status: 1,
          ),
          AgentItemWidget(
            width: Get.width / 3,
            imgUrl: AssetPath.arrow_click,
            title: '313',
            subtitle: 'Clicks',
            status: 2,
          ),
        ],
      ),
    );
  }
}
