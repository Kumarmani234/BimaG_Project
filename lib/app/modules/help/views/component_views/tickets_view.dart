import 'package:bima_g/app/modules/help/views/help_chat_view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../utility/colors.dart';
import '../../../../../utility/ts.dart';
import '../../../../module_controllers.dart';
import '../custom/ticket_policies_item_view.dart';

class TicketsPolicyView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 25.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'recent_tickets'.tr,
                style: Ts.bold13(AppColors.grey5),
              ),
              Text(
                'view_all'.tr,
                style: Ts.regular15(AppColors.primaryColor),
              ),
            ],
          ),
        ),
        SizedBox(height: 12.h),
        Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: Container(
            height: 167.h,
            width: MediaQuery.of(context).size.width,
            color: Colors.transparent,
            child: Obx(
              () => CarouselSlider(
                options: CarouselOptions(
                    pageSnapping: true,
                    enableInfiniteScroll: false,
                    padEnds: false,
                    viewportFraction: 1.0,
                    scrollPhysics: BouncingScrollPhysics(),
                    onPageChanged: (index, reason) {
                      helpController.currentIndexOfTicketsPolicies.value =
                          index;
                    }),
                items: helpController.listOfTickets.map(
                  (policy) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Padding(
                          padding: EdgeInsets.only(right: 16.w),
                          child: TicketsPoliciesItem(
                            ticketsPolicyModel: policy,
                            onClick: () => Get.to(GetHelpChatView()),
                          ),
                        );
                      },
                    );
                  },
                ).toList(),
              ),
            ),
          ),
        ),
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                for (int i = 0; i < helpController.listOfPolicies.length; i++)
                  Container(
                    width:
                        helpController.currentIndexOfTicketsPolicies.value == i
                            ? 16.w
                            : 4.h,
                    height: 4.h,
                    margin: EdgeInsets.symmetric(horizontal: 2.w),
                    decoration: BoxDecoration(
                      color:
                          helpController.currentIndexOfTicketsPolicies.value ==
                                  i
                              ? AppColors.primaryColor
                              : AppColors.grey3,
                      borderRadius: BorderRadius.all(
                        Radius.circular(30.w),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
