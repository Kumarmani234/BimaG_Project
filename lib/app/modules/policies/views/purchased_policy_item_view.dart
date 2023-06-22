// ignore_for_file: must_be_immutable

import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../utility/ts.dart';
import '../model/purchased_policy_model.dart';

class PurchasedPolicies extends GetView {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => policiesController.currentTabIndex.value == 0
          ? ListView.builder(
              padding: EdgeInsets.only(bottom: 130.h),
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: policiesController.listRecentPolicies.length,
              itemBuilder: (ctx, ind) => Padding(
                padding: EdgeInsets.only(top: 8.h),
                child: PurchasesPoliciesItem(
                  purchasedPolicyModel:
                      policiesController.listRecentPolicies[ind],
                  onClick: () {},
                ),
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.only(bottom: 130.h),
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: policiesController.listInActivePolicies.length,
              itemBuilder: (ctx, ind) => Padding(
                padding: EdgeInsets.only(top: 8.h),
                child: PurchasesPoliciesItem(
                  purchasedPolicyModel:
                      policiesController.listInActivePolicies[ind],
                  onClick: () {},
                ),
              ),
            ),
    );
  }
}

class PurchasesPoliciesItem extends StatelessWidget {
  PurchasedPolicyModel purchasedPolicyModel;
  final onClick;
  final bool isHaveCoverStatusPreminum;
  final Color? highlight_color;
  final Color? highlight_text_color;
  final String? highlight_text;

  PurchasesPoliciesItem(
      {Key? key,
      required this.purchasedPolicyModel,
      required this.onClick,
      this.isHaveCoverStatusPreminum = false,
      this.highlight_color,
      this.highlight_text_color,
      this.highlight_text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      width: MediaQuery.of(context).size.width - 30.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.w),
        color: Colors.white,
      ),
      child: Material(
        color: Colors.transparent,
        child: Ink(
          child: InkWell(
            onTap: onClick,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //policyExpired
                if (purchasedPolicyModel.expired)
                  Container(
                    height: 30.h,
                    margin: EdgeInsets.all(3.h),
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: highlight_color ?? AppColors.grey1,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(6.h),
                        topRight: Radius.circular(6.h),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      highlight_text ?? 'policy_expired'.tr,
                      style: Ts.bold13(
                          highlight_text_color ?? AppColors.warningColor),
                    ),
                  ),

                //top area
                Padding(
                  padding: EdgeInsets.all(15.w),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('plan'.tr,
                                style: Ts.regular11(AppColors.grey4)),
                            SizedBox(
                              height: 3.h,
                            ),
                            Text(purchasedPolicyModel.planName,
                                style: Ts.regular12(Colors.black)),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.network(
                                  purchasedPolicyModel.companyImage,
                                  width: 100.w,
                                  height: 30.h,
                                ),
                                Text(purchasedPolicyModel.planCompanyName,
                                    style: Ts.bold14(Colors.black)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        key:Key('arrow_right_key'),
                        Icons.keyboard_arrow_right_outlined,
                        color: AppColors.primaryColor,
                      ),
                    ],
                  ),
                ),

                //second area
                Container(
                  height: 55.h,
                  margin: EdgeInsets.all(3.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.w),
                      color: AppColors.primaryColor.withOpacity(0.1)),
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
                  child: isHaveCoverStatusPreminum
                      ? Row(
                          children: [
                            //product
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'cover'.tr,
                                    style: Ts.regular11(AppColors.grey4),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    purchasedPolicyModel.productName,
                                    style: Ts.medium12(Colors.black),
                                  ),
                                ],
                              ),
                            ),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'status'.tr,
                                    style: Ts.regular11(AppColors.grey4),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    purchasedPolicyModel.sumInjured,
                                    style: Ts.medium12(Colors.black),
                                  ),
                                ],
                              ),
                            ),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'premium'.tr,
                                    style: Ts.regular11(AppColors.grey4),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    purchasedPolicyModel.date,
                                    style: Ts.medium12(Colors.black),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      : Row(
                          children: [
                            //product
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'product'.tr,
                                    style: Ts.regular11(AppColors.grey4),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    purchasedPolicyModel.productName,
                                    style: Ts.medium12(Colors.black),
                                  ),
                                ],
                              ),
                            ),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'sum_insured'.tr,
                                    style: Ts.regular11(AppColors.grey4),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    purchasedPolicyModel.sumInjured,
                                    style: Ts.medium12(Colors.black),
                                  ),
                                ],
                              ),
                            ),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'valid_till'.tr,
                                    style: Ts.regular11(AppColors.grey4),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    purchasedPolicyModel.date,
                                    style: Ts.medium12(Colors.black),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
