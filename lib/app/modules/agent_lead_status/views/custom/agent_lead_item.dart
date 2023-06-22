// ignore_for_file: must_be_immutable

import 'package:bima_g/utility/asset_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../utility/colors.dart';
import '../../../../../utility/ts.dart';
import '../../../../module_controllers.dart';
import '../../model/lead_item.dart';

class AgentLeadItemWidget extends StatelessWidget {
  AgentLeadItemModel agentLeadItemModel;
  final onClick;
  final onMailTap;
  final onWhatsappTap;
  final onPhoneTap;

  AgentLeadItemWidget({
    Key? key,
    required this.agentLeadItemModel,
    this.onClick,
    this.onMailTap,
    this.onPhoneTap,
    this.onWhatsappTap,
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
                Container(
                  height: 30.h,
                  margin: EdgeInsets.all(2.5.h),
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: fetchColor().withOpacity(0.1),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(6.h),
                      topRight: Radius.circular(6.h),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    fetchHightlightText(),
                    style: Ts.bold13(fetchColor()),
                  ),
                ),

                //top area
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 22,
                        backgroundImage:
                            Image.network(dashboardController.profileUrl.value)
                                .image,
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
                                  agentLeadItemModel.username,
                                  style: Ts.bold14(AppColors.grey5),
                                ),
                                Text(
                                  agentLeadItemModel.date,
                                  style: Ts.regular12(AppColors.grey5),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  agentLeadItemModel.email,
                                  style: Ts.regular12(AppColors.grey4),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 4.h),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: onMailTap,
                                          child: SvgPicture.asset(
                                            AssetPath.mail,
                                          ),
                                        ),
                                        SizedBox(width: 6.w),
                                        InkWell(
                                          onTap: onWhatsappTap,
                                          splashColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          child: SvgPicture.asset(
                                              AssetPath.whatsapp),
                                        ),
                                        SizedBox(width: 6.w),
                                        InkWell(
                                          onTap: onPhoneTap,
                                          splashColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          child: SvgPicture.asset(
                                              AssetPath.phone_call),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
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
                    color: AppColors.primaryColor.withOpacity(0.1),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                  child: Row(
                    children: [
                      // policy
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'policy'.tr,
                              style: Ts.regular11(AppColors.grey4),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              // purchasedPolicyModel.productName,
                              agentLeadItemModel.policy.toString(),
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
                              agentLeadItemModel.location,
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

  Color fetchColor() {
    if (agentLeadItemModel.status == 0) {
      return AppColors.primaryColor; //total
    }

    if (agentLeadItemModel.status == 1) {
      return AppColors.green; //success or earned
    }

    if (agentLeadItemModel.status == 2) {
      return AppColors.warningColor; //pending
    }

    if (agentLeadItemModel.status == 3) {
      return AppColors.red; // failed
    }
    return AppColors.primaryColor;
  }

  String fetchHightlightText() {
    if (agentLeadItemModel.status == 1) {
      return 'Successful'; //success or earned
    }

    if (agentLeadItemModel.status == 2) {
      return 'Payment Pending'; //pending
    }

    if (agentLeadItemModel.status == 3) {
      return 'Payment Failed'; // failed
    }
    return '';
  }
}
