// ignore_for_file: must_be_immutable

import 'package:bima_g/app/modules/agent_homepage/model/insurer_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../utility/asset_paths.dart';
import '../../../../../utility/colors.dart';
import '../../../../../utility/ts.dart';
import '../../../../module_controllers.dart';

class InsurerEmailItem extends StatelessWidget {
  InsurerItemModel insurerItemModel;
  final onClick;

  InsurerEmailItem({
    Key? key,
    required this.insurerItemModel,
    this.onClick,
  }) : super(key: key);

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
                //top area
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                  child: Row(
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
                                  insurerItemModel.username,
                                  style: Ts.bold14(AppColors.grey5),
                                ),
                                Text(
                                  insurerItemModel.date,
                                  style: Ts.regular12(AppColors.grey5),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Text(insurerItemModel.email,
                                style: Ts.regular12(AppColors.grey4)),
                            SizedBox(
                              height: 10.h,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                //bottom area
                Container(
                  margin: EdgeInsets.all(2.5.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.w),
                      color: AppColors.primaryColor.withOpacity(0.1)),
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
                  child: Row(
                    children: [
                      //total policy
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'total_policy'.tr,
                              style: Ts.regular11(AppColors.grey4),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              // purchasedPolicyModel.productName,
                              insurerItemModel.total.toString(),
                              style: Ts.medium12(Colors.black),
                            ),
                          ],
                        ),
                      ),
                      //pending policy
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'pending_policy'.tr,
                              style: Ts.regular11(AppColors.grey4),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              insurerItemModel.pending.toString(),
                              style: Ts.medium12(Colors.black),
                            ),
                          ],
                        ),
                      ),
                      //location
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'location'.tr,
                              style: Ts.regular11(AppColors.grey4),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              insurerItemModel.location,
                              style: Ts.medium12(Colors.black),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
