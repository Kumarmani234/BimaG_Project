// ignore_for_file: must_be_immutable

import 'package:bima_g/app/modules/help/model/ticket_policy_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../utility/colors.dart';
import '../../../../../utility/ts.dart';

class TicketsPoliciesItem extends StatelessWidget {
  TicketsPolicyModel ticketsPolicyModel;
  final onClick;

  TicketsPoliciesItem({
    Key? key,
    required this.ticketsPolicyModel,
    required this.onClick,
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
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    //top area

                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 16.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.network(
                            ticketsPolicyModel.companyImage,
                            width: 100.w,
                            height: 30.h,
                          ),
                          Text(ticketsPolicyModel.planCompanyName,
                              style: Ts.bold14(Colors.black)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Concern'.tr,
                                    style: Ts.regular11(AppColors.grey4)),
                                SizedBox(
                                  height: 3.h,
                                ),
                                Text(ticketsPolicyModel.planName,
                                    style: Ts.regular12(Colors.black)),
                                SizedBox(
                                  height: 10.h,
                                ),
                              ],
                            ),
                          ),
                          Icon(
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
                      child: Row(
                        children: [
                          //product
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'raised'.tr,
                                  style: Ts.regular11(AppColors.grey4),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                  ticketsPolicyModel.raised_date,
                                  style: Ts.medium12(Colors.black),
                                ),
                              ],
                            ),
                          ),

                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  'ticket_id'.tr,
                                  style: Ts.regular11(AppColors.grey4),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                  ticketsPolicyModel.ticket_id,
                                  style: Ts.medium12(Colors.black),
                                ),
                              ],
                            ),
                          ),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'status'.tr,
                                  style: Ts.regular11(AppColors.grey4),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Container(
                                  height: 20.h,
                                  width: 58.w,
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius:
                                        BorderRadiusDirectional.circular(4.w),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'In Work',
                                      style: Ts.bold12(AppColors.white),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  right: 2.w,
                  top: 2.h,
                  child: Container(
                    height: 16.h,
                    width: 16.h,
                    decoration: BoxDecoration(
                      color: AppColors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '1',
                        style: Ts.bold12(AppColors.white),
                      ),
                    ),
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
