import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/modules/agent_insurer/views/custom/insurer_bottom_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../utility/asset_paths.dart';
import '../../../../utility/colors.dart';
import '../../../../utility/ts.dart';
import '../../../widgets/bottomsheet.dart';
import '../../agent_homepage/views/custom/insurer_email_item.dart';
import '../../homepage/views/top_app_bar_view.dart';
import '../../policies/views/purchased_policy_item_view.dart';
import '../controllers/agent_insurer_controller.dart';

class AgentInsurerView extends GetView<AgentInsurerController> {
  const AgentInsurerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey1,
      appBar: PreferredSize(
        child: Obx(
          () => TopAppBarView(
            isAgentTopbar: true,
            actionIcon: Icons.notifications_none_outlined,
            title: 'Agent - Hardiksinh Chudasam..',
            subtitle: 'BimaG001',
            imgUrl: dashboardController.profileUrl.value,
          ),
        ),
        preferredSize: Size.fromHeight(70.h),
      ),
      body: Obx(
        () => ListView.separated(
          padding: EdgeInsets.only(right: 16.w, left: 16.w, top: 16.h),
          physics: BouncingScrollPhysics(),
          itemCount: agentInsurerController.insurerList.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return InsurerEmailItem(
              insurerItemModel: agentInsurerController.insurerList[index],
              onClick: () {
                HapticFeedback.mediumImpact();
                OnInsureClick();
              },
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: 10.h);
          },
        ),
      ),
      bottomNavigationBar: AgentInsurerBottomView(),
    );
  }
}

OnInsureClick() {
  CustomBottomSheet(
    isScrollControlled: true,
    title: 'insurer'.tr,
  ).showBottomSheet(
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 22,
                backgroundImage:
                    NetworkImage(dashboardController.profileUrl.value),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomRight,
                      child: SvgPicture.asset(
                        AssetPath.verified,
                        height: 22.h,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          agentHomepageController.insurerList[0].username,
                          style: Ts.bold14(AppColors.grey5),
                        ),
                        Text(
                          agentHomepageController.insurerList[0].date,
                          style: Ts.regular12(AppColors.grey5),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(agentHomepageController.insurerList[0].email,
                        style: Ts.regular12(AppColors.grey4)),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Obx(
            () => ListView.separated(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return PurchasesPoliciesItem(
                  highlight_text:
                      agentInsurerController.heightlight_text[index],
                  highlight_color: agentInsurerController
                      .heightlight_color[index]
                      .withOpacity(0.1),
                  highlight_text_color:
                      agentInsurerController.heightlight_color[index],
                  isHaveCoverStatusPreminum: true,
                  purchasedPolicyModel:
                      agentInsurerController.insurePolicyList[index],
                  onClick: () {},
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 8.h),
              itemCount: agentInsurerController.insurePolicyList.length,
            ),
          ),
          SizedBox(height: 24.h),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'edit_insurer'.tr,
                    style: Ts.regular15(AppColors.primaryColor),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Get.back();
                    onBuyNewPolicyClick();
                  },
                  child: Text(
                    key:Key('buy_new_policy_key'),
                    'buy_new_policy'.tr,
                    style: Ts.regular15(Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

onBuyNewPolicyClick() {
  CustomBottomSheet(
    isScrollControlled: true,
    title: 'select_insurance'.tr,
  ).showBottomSheet(
    GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      crossAxisSpacing: 10.w,
      mainAxisSpacing: 10.w,
      childAspectRatio: 1,
      physics: NeverScrollableScrollPhysics(),
      children: [
        for (int i = 0; i < homeController.listPolicesType.length; i++)
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(8.h),
              ),
            ),
            child: Material(
              color: Colors.transparent,
              child: Ink(
                child: InkWell(
                  onTap: () => homeController.navigatePolicy(i),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        key:Key('insurance_type_${i}_key'),
                          homeController.listPolicesType[i].imagePath),
                      Text(
                        homeController.listPolicesType[i].policyName.tr,
                        style: Ts.semiBold13(Colors.black),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
      ],
    ),
  );
}
