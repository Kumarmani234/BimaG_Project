// ignore_for_file: deprecated_member_use

import 'package:bima_g/app/modules/help/model/open_ticket_model.dart';
import 'package:bima_g/app/modules/help/views/custom/ticket.dart';
import 'package:bima_g/utility/asset_paths.dart';
import 'package:bima_g/utility/colors.dart';
import 'package:bima_g/utility/styles.dart';
import 'package:bima_g/utility/ts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../module_controllers.dart';
import '../../insurance_appbar/views/insurance_appbar_view.dart';

class GetHelpChatView extends GetView {
  GetHelpChatView({this.title, this.subtitle});

  final String? title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey1,
      appBar: PreferredSize(
        child: InsuranceAppbarView(
          title: 'get_help'.tr,
        ),
        preferredSize: Size.fromHeight(60.h),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Tickets(
            isViewInFullScreen: true,
            width: MediaQuery.of(context).size.width,
            isHaveTicketCount: false,
            openTicketModel: OpenTicketModel(
              status: helpController.listOfOpenTickets[0].status.toString(),
              planCompanyName: helpController
                  .listOfOpenTickets[0].planCompanyName
                  .toString(),
              planName: helpController.listOfOpenTickets[0].planName.toString(),
              raised_date:
                  helpController.listOfOpenTickets[0].raised_date.toString(),
              ticket_id:
                  helpController.listOfOpenTickets[0].ticket_id.toString(),
            ),
            onClick: () {},
          ),
          SizedBox(height: 16.h),
          Center(
            child: Text(
              'Yesterday',
              style: Ts.regular12(AppColors.grey4),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 250.w,
                height: 68.h,
                decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadiusDirectional.circular(8.w)),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
                  child: Column(
                    children: [
                      Text(
                        'Nice doctors...Nice staff..It is located on the main road Named Sirsi Road so easily',
                        style: Ts.regular12(AppColors.grey5),
                      ),
                      Spacer(),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          // '${TimeOfDay.now().hour}',
                          '${TimeOfDay.now().hour}:${TimeOfDay.now().minute} ${TimeOfDay.now().period.toString().split('.')[1]}',
                          style: Ts.regular10(AppColors.grey4),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 250.w,
                height: 68.h,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadiusDirectional.circular(8.w)),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
                  child: Column(
                    children: [
                      Text(
                        'Nice doctors...Nice staff..It is located on the main road Named Sirsi Road so easily',
                        style: Ts.regular12(AppColors.grey5),
                      ),
                      Spacer(),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          // '${TimeOfDay.now().hour}',
                          '${TimeOfDay.now().hour}:${TimeOfDay.now().minute} ${TimeOfDay.now().period.toString().split('.')[1]}',
                          style: Ts.regular10(AppColors.grey4),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 250.w,
                height: 68.h,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadiusDirectional.circular(8.w)),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
                  child: Column(
                    children: [
                      Text(
                        'Nice doctors...Nice staff..It is located on the main road Named Sirsi Road so easily',
                        style: Ts.regular12(AppColors.grey5),
                      ),
                      Spacer(),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          // '${TimeOfDay.now().hour}',
                          '${TimeOfDay.now().hour}:${TimeOfDay.now().minute} ${TimeOfDay.now().period.toString().split('.')[1]}',
                          style: Ts.regular10(AppColors.grey4),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: WriteMsgsArea(),
    );
  }
}

class WriteMsgsArea extends StatelessWidget {
  const WriteMsgsArea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 130.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [Styles.dropShadowZ100()],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'message'.tr + "...",
              style: Ts.regular15(AppColors.grey3),
            ),
            SizedBox(height: 40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Material(
                  color: Colors.transparent,
                  child: Ink(
                    child: InkWell(
                      onTap: () {},
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      child: Container(
                        decoration: BoxDecoration(),
                        clipBehavior: Clip.hardEdge,
                        child: SvgPicture.asset(AssetPath.attachment),
                      ),
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: Ink(
                    child: InkWell(
                      onTap: () {},
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      child: Text(
                        'Send',
                        style: Ts.bold15(AppColors.primaryColor),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
