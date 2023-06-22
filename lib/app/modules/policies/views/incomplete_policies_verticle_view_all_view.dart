import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/modules/insurance_appbar/views/insurance_appbar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'incomplete_policy_item_view.dart';

class IncompletePoliciesVerticalViewAllView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: InsuranceAppbarView(
          title: 'incomplete_policies'.tr,
        ),
        preferredSize: Size.fromHeight(55.h),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(12.w),
        itemCount: policiesController.listInCompletedPolicies.length,
        itemBuilder: (ctx, ind) => Padding(
            child: IncompletePolicyItemView(
              incompletePolicyModel:
                  policiesController.listInCompletedPolicies[ind],
            ),
            padding: EdgeInsets.only(bottom: 12.h)),
      ),
    );
  }
}
