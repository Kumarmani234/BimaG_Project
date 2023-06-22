import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/modules/compare_plans/views/select_plan_sheet_view.dart';
import 'package:bima_g/app/modules/policy_quote_list/views/quotes_item_view.dart';
import 'package:bima_g/app/widgets/bimag_loading.dart';
import 'package:bima_g/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../enums.dart';
import '../../insurance_appbar/views/insurance_appbar_view.dart';
import '../../two_wheeler_insurance/two_wheeler_details/views/filters_view.dart';
import '../controllers/policy_quote_list_controller.dart';

class PolicyQuoteListView extends GetView<PolicyQuoteListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey1,
      appBar: PreferredSize(
        child: InsuranceAppbarView(
          title: 'view_quotes'.tr,
        ),
        preferredSize: Size.fromHeight(55.h),
      ),
      body: SmartRefresher(
        controller: policyQuoteListController.policyQuoteRefreshController,
        onRefresh: policyQuoteListController.onRefresh,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(15.h),
                child: Column(
                  children: [
                    FiltersView(),
                    SizedBox(
                      height: 10.h,
                    ),
                    Expanded(
                      child: Obx(
                        () => carInsuranceController
                                    .viewQuotesButtonStatus.value ==
                                ButtonStatus.Loading
                            ? LoadingBimaG()
                            : ListView.builder(
                                physics: BouncingScrollPhysics(),
                                itemCount: policyQuoteListController
                                    .listQuotesModel.length,
                                itemBuilder: (ctx, index) {
                                  return QuotesItemView(indexOfPlan: index);
                                },
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SelectPlanSheetView()
          ],
        ),
      ),
    );
  }
}
