// ignore_for_file: must_be_immutable

import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/modules/compare_plans/views/insurance_sheet_for_compare_view.dart';
import 'package:bima_g/app/routes/app_pages.dart';
import 'package:bima_g/app/widgets/buttons.dart';
import 'package:bima_g/utility/colors.dart';
import 'package:bima_g/utility/ts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../utility/styles.dart';

class SelectPlanSheetView extends GetView {
  bool forUpperSheet;
  SelectPlanSheetView({this.forUpperSheet = false, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => comparePlansController.listSelectedQuotes.isNotEmpty
          ? Container(
              height: forUpperSheet ? 130.h : 190.h,
              padding: EdgeInsets.symmetric(vertical: 15.h),
              decoration: BoxDecoration(color: AppColors.white, boxShadow: [
                forUpperSheet ? Styles.bottomShadow() : Styles.upperShadow()
              ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //list of selected plans
                  Container(
                    height: 90.h,
                    margin: EdgeInsets.only(bottom: 8.h),
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      itemBuilder: (ctx, index) =>
                          SelectedPlanItem(index: index),
                    ),
                  ),

                  if (!forUpperSheet)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child:
                          comparePlansController.listSelectedQuotes.length == 1
                              ? RoundSquareButtons.buttonDisabled(
                                  onPressed: () {}, text: 'Compare Now')
                              : RoundSquareButtons.buttonEnabled(
                                  onPressed: () =>
                                      Get.toNamed(Routes.COMPARE_PLANS),
                                  text: 'Compare Now'),
                    )
                ],
              ),
            )
          : Container(),
    );
  }
}

class SelectedPlanItem extends StatelessWidget {
  int index;
  SelectedPlanItem({required this.index, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170.w,
      margin: EdgeInsets.only(right: 15.w),
      child: Stack(
        children: [
          Container(
            width: 170.w,
            margin: EdgeInsets.only(top: 8.h, right: 8.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.h),
                border: Border.all(color: AppColors.grey1)),
            padding: EdgeInsets.all(10.h),
            child: comparePlansController.listSelectedQuotes.length > index
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Image.network(comparePlansController
                              .listSelectedQuotes[index].planImage)),
                      SizedBox(
                        height: 6.h,
                      ),
                      Text(
                        '₹${comparePlansController.listSelectedQuotes[index].planDiscountedPrice}',
                        style: Ts.semiBold15(AppColors.black),
                      )
                    ],
                  )
                : InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          enableDrag: true,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.h)),
                          context: context,
                          builder: (ctx) => InsuranceSheetForCompareView());
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Select Insurance',
                          style: Ts.bold20(AppColors.grey3),
                        ),
                      ],
                    ),
                  ),
          ),
          if (comparePlansController.listSelectedQuotes.length > index)
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () => comparePlansController.removeSelectedPlan(index),
                child: Icon(
                  Icons.cancel,
                  color: AppColors.black,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
