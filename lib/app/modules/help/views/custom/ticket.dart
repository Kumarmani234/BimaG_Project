// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../utility/colors.dart';
import '../../../../../utility/styles.dart';
import '../../../../../utility/ts.dart';
import '../../model/open_ticket_model.dart';

class Tickets extends StatelessWidget {
  OpenTicketModel openTicketModel;
  final onClick;
  final double? width;
  final bool isHaveTicketCount;
  final bool isViewInFullScreen;

  Tickets({
    Key? key,
    required this.openTicketModel,
    required this.onClick,
    this.width,
    this.isHaveTicketCount = false,
    this.isViewInFullScreen = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      width: width ?? MediaQuery.of(context).size.width - 30.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.w),
          color: Colors.white,
          boxShadow: [Styles.dropShadowZ100()]),
      child: Material(
        color: Colors.transparent,
        child: Ink(
          child: InkWell(
            onTap: onClick,
            child: Stack(
              children: [
                Padding(
                  padding: isViewInFullScreen
                      ? EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h)
                      : EdgeInsets.zero,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 10.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(openTicketModel.planCompanyName,
                                      style: Ts.regular11(AppColors.grey4)),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  Text(openTicketModel.planName,
                                      style: Ts.regular12(Colors.black)),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                ],
                              ),
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
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 8.h),
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
                                    openTicketModel.raised_date,
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
                                    openTicketModel.ticket_id,
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
                                      color: fetchStatusGridColor(),
                                      borderRadius:
                                          BorderRadiusDirectional.circular(4.w),
                                    ),
                                    child: Center(
                                      child: Text(
                                        openTicketModel.status,
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
                ),
                isHaveTicketCount
                    ? Positioned(
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
                      )
                    : SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color fetchStatusGridColor() {
    if (openTicketModel.status == 'In Work') {
      return AppColors.primaryColor;
    }

    if (openTicketModel.status == 'In Queue') {
      return AppColors.warningColor;
    }

    if (openTicketModel.status == 'Resolved') {
      return AppColors.green;
    }

    if (openTicketModel.status == 'Closed') {
      return AppColors.grey4;
    }

    return AppColors.primaryColor;
  }
}
