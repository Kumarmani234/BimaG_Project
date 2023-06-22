import 'package:bima_g/app/enums.dart';
import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/modules/help/model/open_ticket_model.dart';
import 'package:bima_g/app/modules/help/views/component_views/get_help_top_area_view.dart';
import 'package:bima_g/app/modules/help/views/custom/ticket.dart';
import 'package:bima_g/app/modules/help/views/help_chat_view.dart';
import 'package:bima_g/app/modules/help/views/help_options_view.dart';
import 'package:bima_g/utility/colors.dart';
import 'package:bima_g/utility/ts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../widgets/buttons.dart';
import '../../insurance_appbar/views/insurance_appbar_view.dart';

class GetPolicyHelpView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: InsuranceAppbarView(
          title: 'get_help'.tr,
        ),
        preferredSize: Size.fromHeight(60.h),
      ),
      body: SmartRefresher(
        controller: helpController.getHelpRefreshController,
        onRefresh: helpController.onGetHelpRefresh,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GetHelpTopAreaview(),
            SizedBox(height: 24.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'You have ${helpController.listOfOpenTickets.length} open tickets',
                    style: Ts.bold13(AppColors.grey5),
                  ),
                  SizedBox(height: 16.h),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: helpController.listOfOpenTickets.length,
                    itemBuilder: (context, index) {
                      return Tickets(
                        key: Key('open_tickets_key'),
                        isHaveTicketCount: helpController
                            .listOfOpenTickets[index].isHaveTicketCount,
                        openTicketModel: OpenTicketModel(
                          status: helpController.listOfOpenTickets[index].status
                              .toString(),
                          planCompanyName: helpController
                              .listOfOpenTickets[index].planCompanyName
                              .toString(),
                          planName: helpController
                              .listOfOpenTickets[index].planName
                              .toString(),
                          raised_date: helpController
                              .listOfOpenTickets[index].raised_date
                              .toString(),
                          ticket_id: helpController
                              .listOfOpenTickets[index].ticket_id
                              .toString(),
                        ),
                        onClick: () => Get.to(GetHelpChatView()),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(height: 9.h),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomButton(
        key: Key('concern_key'),
        text: 'have_any_other_concern'.tr,
        buttonStatus: ButtonStatus.Active,
        onClick: () => Get.to(HelpOptionsView()),
      ),
    );
  }
}
