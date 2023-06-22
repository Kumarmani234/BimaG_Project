import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/modules/policies/views/profile_policies/profile_policies_tab.dart';
import 'package:bima_g/app/modules/profile/views/profile_basic_details_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../purchased_policy_item_view.dart';

class ProfilePoliciesMain extends StatelessWidget {
  const ProfilePoliciesMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ProfilePoliciesTabs(),
          Expanded(
            child: SmartRefresher(
              controller: policiesController.policyRefreshController,
              onRefresh: policiesController.onRefresh,
              child: ListView.builder(
                itemCount: policiesController.listInAllPolicies.length,
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.only(
                    left: 15.w, right: 15.w, bottom: 15.h, top: 10.h),
                itemBuilder: (ctx, index) => Padding(
                  padding: EdgeInsets.only(bottom: 15.h),
                  child: Obx(
                    () => PurchasesPoliciesItem(
                      isHaveCoverStatusPreminum: true,
                      purchasedPolicyModel:
                          policiesController.listInAllPolicies[index],
                      onClick: () => Get.to(ViewPlanDetails()),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
