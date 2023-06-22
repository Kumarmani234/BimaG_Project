// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:bima_g/utility/asset_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../utility/colors.dart';
import '../../../../../utility/ts.dart';
import '../../model/link_item_model.dart';

class AgentLinkItemWidget extends StatelessWidget {
  AgentLinkItemModel agentLinkItemModel;
  final onClick;
  final onCopyIconTap;
  final onShareIconTap;

  AgentLinkItemWidget({
    Key? key,
    required this.agentLinkItemModel,
    this.onClick,
    this.onShareIconTap,
    this.onCopyIconTap,
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
                  padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              agentLinkItemModel.date_time,
                              style: Ts.regular11(AppColors.grey4),
                            ),
                            Row(
                              children: [
                                Text(
                                  agentLinkItemModel.link,
                                  style: Ts.regular12(AppColors.secondaryColor),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        height: 30.h,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColors.grey1,
                                        ),
                                        child: Material(
                                          color: Colors.transparent,
                                          child: Ink(
                                            child: InkWell(
                                              onTap: onShareIconTap,
                                              child: Center(
                                                child: Padding(
                                                  padding: EdgeInsets.all(5.0),
                                                  child: SvgPicture.asset(
                                                    AssetPath.share_net,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 5.w),
                                      Container(
                                        height: 30.h,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColors.grey1,
                                        ),
                                        child: Material(
                                          color: Colors.transparent,
                                          child: Ink(
                                            child: InkWell(
                                              onTap: onCopyIconTap,
                                              child: Center(
                                                child: Padding(
                                                  padding: EdgeInsets.all(5.0),
                                                  child: SvgPicture.asset(
                                                    AssetPath.copy,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.h),
                //bottom area
                Container(
                  margin: EdgeInsets.all(2.5.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.w),
                    color: AppColors.primaryColor.withOpacity(0.1),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              AssetPath.coins,
                              color: AppColors.primaryColor,
                            ),
                            SizedBox(width: 10.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '₹' + agentLinkItemModel.earn.toString(),
                                  style: Ts.medium17(AppColors.primaryColor),
                                ),
                                SizedBox(height: 3.h),
                                Text(
                                  'Earn',
                                  style: Ts.regular15(AppColors.grey4),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              AssetPath.eye,
                              color: AppColors.green,
                            ),
                            SizedBox(width: 10.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  agentLinkItemModel.views.toString(),
                                  style: Ts.medium17(AppColors.green),
                                ),
                                SizedBox(height: 3.h),
                                Text(
                                  'Views',
                                  style: Ts.regular15(AppColors.grey4),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              AssetPath.arrow_click,
                              color: AppColors.warningColor,
                            ),
                            SizedBox(width: 10.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  agentLinkItemModel.clicks.toString(),
                                  style: Ts.medium17(AppColors.warningColor),
                                ),
                                SizedBox(height: 3.h),
                                Text(
                                  'Clicks',
                                  style: Ts.regular15(AppColors.grey4),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
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
