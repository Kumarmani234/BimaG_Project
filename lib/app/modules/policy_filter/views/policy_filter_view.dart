import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../utility/colors.dart';
import '../../../../utility/ts.dart';
import '../../insurance_appbar/views/insurance_appbar_view.dart';
import '../controllers/policy_filter_controller.dart';

class PolicyFilterView extends GetView<PolicyFilterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey1,
      appBar: PreferredSize(
        child: InsuranceAppbarView(
          title: 'filter'.tr,
          actions: [
            TextButton(
              onPressed: () {
                policyFilterController = Get.put(
                  PolicyFilterController(),
                );
                Get.back(result: 'reset'.tr);
              },
              child: Text(
                'reset'.tr,
                style: Ts.bold15(AppColors.primaryColor),
              ),
            ),
          ],
        ),
        preferredSize: Size.fromHeight(55.h),
      ),
      body: Obx(
        () => Stack(
          children: [
            SizedBox(
              height: Get.height,
              child: Padding(
                padding: EdgeInsets.all(15.h),
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.filterList.length,
                  padding: EdgeInsets.only(bottom: 80.h),
                  itemBuilder: (ctx, index) =>
                      controller.fetchFilterList(index),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: BottomButton(
                  text: 'apply'.tr,
                  onClick: () {
                    policyQuoteListController.reqGetQuoteDetails.filter!
                            .noClaimBonus!.currentApplicableNcb =
                        policyFilterController.currentApplicableNcb.value;
                    policyQuoteListController.reqGetQuoteDetails.filter!
                            .noClaimBonus!.previousYearNcb =
                        policyFilterController.prevYearNcb.value;
                    policyQuoteListController.reqGetQuoteDetails.filter!
                            .noClaimBonus!.lastPolicyClaim =
                        policyFilterController.claimsInLastPolicy.value;
                    policyQuoteListController
                            .reqGetQuoteDetails.filter!.currentPolicyExpired =
                        policyFilterController
                            .selectedCurrentPolicyExpiredOption.value;
                    policyQuoteListController
                            .reqGetQuoteDetails.filter!.policyCover =
                        policyFilterController
                            .selectedCurrentPolicyExpiredOption.value;
                    policyQuoteListController.fetchQuoteList();
                    Get.back();
                  }),
            )
          ],
        ),
      ),
    );
  }
}
