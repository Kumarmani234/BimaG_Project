import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/modules/agent_comission/views/Withdrawal/withdrawal_form_view.dart';
import 'package:bima_g/app/modules/agent_comission/views/withdrawel_detail/withdrawel_details_view.dart';
import 'package:bima_g/app/widgets/agent_item_widget.dart';
import 'package:bima_g/app/widgets/buttons.dart';
import 'package:bima_g/utility/asset_paths.dart';
import 'package:bima_g/utility/colors.dart';
import 'package:bima_g/utility/styles.dart';
import 'package:bima_g/utility/ts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../widgets/commission_detail_widget.dart';
import '../../insurance_appbar/views/insurance_appbar_view.dart';
import '../controllers/agent_comission_controller.dart';
import 'custom/commisssion_tabs.dart';

class AgentComissionView extends GetView<AgentComissionController> {
  const AgentComissionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey1,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(135.h),
        child: InsuranceAppbarView(
          title: 'commission'.tr,
          elevation: 0,
          actions: [CommisionActionBtn()],
          isBottom: true,
          bottom: CommissionAppbarBottom(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 14.w, right: 14.w),
        child: Column(
          children: [
            SizedBox(height: 10.h),
            CommissionCategoriesTabs(),
            SizedBox(height: 16.h),
            Expanded(
              child: Obx(
                () => ListView.separated(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return CommissionDetailWidget(
                      title: agentComissionController
                          .commissionDetailList[index].title,
                      subtitle: agentComissionController
                          .commissionDetailList[index].subtitle,
                      suffixText: agentComissionController
                          .commissionDetailList[index].suffixText,
                      imgpath: agentComissionController
                          .commissionDetailList[index].imgPath,
                      status: agentComissionController
                          .commissionDetailList[index].status,
                      onTap: () => Get.to(WithdrawalDetailsView()),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(height: 8.h),
                  itemCount:
                      agentComissionController.commissionDetailList.length,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomButton(
        key: Key('withdraw_key'),
        text: 'request_withdrawal'.tr,
        onClick: () => Get.to(WithdrawalFormView()),
      ),
    );
  }
}

class CommissionAppbarBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76.h,
      width: Get.width,
      decoration: BoxDecoration(
          color: AppColors.white, boxShadow: [Styles.dropShadowZ100()]),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AgentItemWidget(
              imgUrl: AssetPath.rs_hand,
              title: '₹10247',
              subtitle: 'Total Earned',
              status: 1,
            ),
            AgentItemWidget(
              imgUrl: AssetPath.watch,
              title: '₹4852',
              subtitle: 'Pending',
              status: 2,
            ),
          ],
        ),
      ),
    );
  }
}

class CommisionActionBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.w, top: 8.h, bottom: 8.h),
      child: Container(
        height: 20.h,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.w),
          border: Border.all(color: AppColors.grey1),
        ),
        child: Material(
          color: Colors.transparent,
          child: Ink(
            child: InkWell(
              onTap: () => Get.back(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('₹', style: Ts.bold15(AppColors.secondaryColor)),
                    Text('8528', style: Ts.bold15(AppColors.secondaryColor)),
                    SizedBox(width: 8.w),
                    SvgPicture.asset(AssetPath.commission_wallet)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
