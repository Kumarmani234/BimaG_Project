// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/modules/home_insurance_module/home_insurance_plan_selection/views/home_insurance_plan_selection_view.dart';
import 'package:bima_g/app/modules/two_wheeler_insurance/two_wheeler_plan_selection/views/two_wheeler_plan_selection_view.dart';
import 'package:bima_g/main.dart';
import 'package:bima_g/utility/asset_paths.dart';
import 'package:bima_g/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../utility/ts.dart';
import '../../../enums.dart';
import '../../four_wheeler_insurance/car_insurance_plan_selection/views/car_insurance_plan_selection_view.dart';
import '../../health_insurance_module/health_insurance_plan_selection/views/health_insurance_plan_selection_view.dart';

class QuotesItemView extends GetView {
  int indexOfPlan;

  QuotesItemView({required this.indexOfPlan, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        getQuoteViewByPolicyType(),
        SizedBox(
          height: 5.h,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.w)),
              color: Colors.white),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(8.w)),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => ComingSoon(),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'View 3 More Policies',
                        style: Ts.regular12(AppColors.primaryColor),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      SvgPicture.asset(
                        AssetPath.down_arrow,
                        width: 17.w,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget getQuoteViewByPolicyType() {
    if (policyQuoteListController.policyType == PolicyType.bikeInsurance) {
      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.h), color: Colors.white),
        margin: EdgeInsets.only(top: 8.h),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //upper
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 100.w,
                        height: 30.h,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.w)),
                            image: DecorationImage(
                                image: Image.network(
                                  policyQuoteListController
                                      .listQuotesModel[indexOfPlan].planImage,
                                  errorBuilder: (_, __, ___) => Image.network(
                                      'https://iili.io/HO2R81j.png'),
                                ).image,
                                fit: BoxFit.fitHeight)),
                      ),
                      Column(
                        children: [
                          Text(
                            'IDV',
                            style: Ts.regular12(AppColors.grey4),
                          ),
                          Text(
                            '₹${policyQuoteListController.listQuotesModel[indexOfPlan].planIDV}',
                            style: Ts.bold14(Colors.black),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Claims Settled',
                            style: Ts.regular12(AppColors.grey4),
                          ),
                          Text(
                            '${policyQuoteListController.listQuotesModel[indexOfPlan].claimSettled}%',
                            style: Ts.bold14(Colors.black),
                          ),
                        ],
                      )
                    ],
                  ),

                  SizedBox(
                    height: policyQuoteListController
                            .listQuotesModel[indexOfPlan]
                            .planDetailsList
                            .isEmpty
                        ? 0.0
                        : 15.h,
                  ),
                  //details points
                  Wrap(
                    alignment: WrapAlignment.start,
                    runSpacing: 10.h,
                    children: [
                      for (int i = 0;
                          i <
                              policyQuoteListController
                                  .listQuotesModel[indexOfPlan]
                                  .planDetailsList
                                  .length;
                          i++)
                        PolicyDetailPoints(
                            strText: policyQuoteListController
                                .listQuotesModel[indexOfPlan]
                                .planDetailsList[i])
                    ],
                  ),
                ],
              ),
            ),
            Container(
              //height: 50.h,
              margin: EdgeInsets.all(3.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.h),
                  color: AppColors.primaryColor.withOpacity(0.1)),
              child: Column(
                children: [
                  if (policyQuoteListController.policyType ==
                      PolicyType.healthInsurance)
                    SizedBox(
                      height: 8.w,
                    ),

                  //discount & annually price for health insurance
                  if (policyQuoteListController.policyType ==
                      PolicyType.healthInsurance)
                    Row(
                      children: [
                        SizedBox(width: 12.w),
                        Container(
                          height: 20.h,
                          width: 20.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.h),
                              color: AppColors.green),
                          child: Icon(
                            Icons.percent,
                            color: AppColors.white,
                            size: 17.h,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          '5% Discount at checkout ',
                          style: Ts.regular12(AppColors.green),
                        ),
                        Spacer(),
                        Text('₹17464/annually',
                            style: Ts.regular12(AppColors.black)),
                        SizedBox(width: 8.w),
                      ],
                    ),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //comparison
                      InkWell(
                        onTap: () => policyQuoteListController
                            .onPlanCompareClick(indexOfPlan),
                        child: Obx(
                          () => Padding(
                            padding: EdgeInsets.only(
                                left: 12.w, right: 4.w, top: 8.h, bottom: 8.h),
                            child: SvgPicture.asset(
                              AssetPath.compare,
                              color: policyQuoteListController
                                      .listQuotesModel[indexOfPlan]
                                      .isPlanSelectedForCompare
                                  ? AppColors.primaryColor
                                  : AppColors.black,
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.all(8.w),
                        child: InkWell(
                          onTap: () => policyQuoteListController
                              .onPlanSaveClick(indexOfPlan),
                          child: Obx(() => SvgPicture.asset(
                              policyQuoteListController
                                      .listQuotesModel[indexOfPlan].isPlanSaved
                                  ? AssetPath.like_selected
                                  : AssetPath.like)),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.all(8.w),
                        child: InkWell(
                          onTap: () {},
                          child: SvgPicture.asset(AssetPath.share),
                        ),
                      ),

                      Expanded(child: SizedBox()),
                      if (policyQuoteListController
                          .listQuotesModel[indexOfPlan].planOriginalPrice
                          .toString()
                          .isNotEmpty)
                        Text(
                            '₹${policyQuoteListController.listQuotesModel[indexOfPlan].planOriginalPrice}',
                            style: Ts.bold14(Colors.black).copyWith(
                                decoration: TextDecoration.lineThrough,
                                decorationColor: AppColors.red)),
                      SizedBox(
                        width: 8.w,
                      ),
                      ElevatedButton(
                        onPressed: () => policyQuoteListController
                            .onPolicyClick(policyQuoteListController
                                .listQuotesModel[indexOfPlan]),
                        child: Text(
                            '₹${policyQuoteListController.listQuotesModel[indexOfPlan].planDiscountedPrice}',
                            style: Ts.regular15(Colors.white)),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      );
    } else if (policyQuoteListController.policyType ==
        PolicyType.healthInsurance) {
      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.h), color: Colors.white),
        margin: EdgeInsets.only(top: 8.h),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //upper
                  Row(
                    children: [
                      Container(
                        width: 100.w,
                        height: 30.h,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.w)),
                            image: DecorationImage(
                                image: Image.network(
                                  'https://iili.io/HO2R81j.png',
                                  errorBuilder: (_, __, ___) => Image.network(
                                      'https://iili.io/HO2R81j.png'),
                                ).image,
                                fit: BoxFit.fitHeight)),
                      ),
                      SizedBox(width: 10.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'United India Insurance',
                            style: Ts.bold14(AppColors.black),
                          ),
                          Text(
                            'NCB Super Premium',
                            style: Ts.regular12(AppColors.grey5),
                          ),
                        ],
                      )
                    ],
                  ),

                  SizedBox(
                    height: 10.h,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Cover amount',
                            style: Ts.regular12(AppColors.grey4),
                          ),
                          Text(
                            '₹5 Lakh',
                            style: Ts.bold14(Colors.black),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Cashless hospitals',
                            style: Ts.regular12(AppColors.grey4),
                          ),
                          Text(
                            '155',
                            style: Ts.bold14(Colors.black),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Claims Settled',
                            style: Ts.regular12(AppColors.grey4),
                          ),
                          Text(
                            '99%',
                            style: Ts.bold14(Colors.black),
                          ),
                        ],
                      )
                    ],
                  ),

                  SizedBox(
                    height: policyQuoteListController
                            .listQuotesModel[indexOfPlan]
                            .planDetailsList
                            .isEmpty
                        ? 0.0
                        : 15.h,
                  ),
                  //details points
                  Wrap(
                    alignment: WrapAlignment.start,
                    runSpacing: 10.h,
                    children: [
                      for (int i = 0;
                          i <
                              policyQuoteListController
                                  .listQuotesModel[indexOfPlan]
                                  .planDetailsList
                                  .length;
                          i++)
                        PolicyDetailPoints(
                            strText: policyQuoteListController
                                .listQuotesModel[indexOfPlan]
                                .planDetailsList[i])
                    ],
                  ),
                ],
              ),
            ),
            Container(
              //height: 50.h,
              margin: EdgeInsets.all(3.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.h),
                  color: AppColors.primaryColor.withOpacity(0.1)),
              child: Column(
                children: [
                  if (policyQuoteListController.policyType ==
                      PolicyType.healthInsurance)
                    SizedBox(
                      height: 8.w,
                    ),

                  //discount & annually price for health insurance
                  if (policyQuoteListController.policyType ==
                      PolicyType.healthInsurance)
                    Row(
                      children: [
                        SizedBox(width: 12.w),
                        Container(
                          height: 20.h,
                          width: 20.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.h),
                              color: AppColors.green),
                          child: Icon(
                            Icons.percent,
                            color: AppColors.white,
                            size: 17.h,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          '5% Discount at checkout ',
                          style: Ts.regular12(AppColors.green),
                        ),
                        Spacer(),
                        Text('₹17464/annually',
                            style: Ts.regular12(AppColors.black)),
                        SizedBox(width: 8.w),
                      ],
                    ),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //comparison
                      InkWell(
                        onTap: () => policyQuoteListController
                            .onPlanCompareClick(indexOfPlan),
                        child: Obx(
                          () => Padding(
                            padding: EdgeInsets.only(
                                left: 12.w, right: 4.w, top: 8.h, bottom: 8.h),
                            child: SvgPicture.asset(
                              AssetPath.compare,
                              color: policyQuoteListController
                                      .listQuotesModel[indexOfPlan]
                                      .isPlanSelectedForCompare
                                  ? AppColors.primaryColor
                                  : AppColors.black,
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.all(8.w),
                        child: InkWell(
                          onTap: () => policyQuoteListController
                              .onPlanSaveClick(indexOfPlan),
                          child: Obx(() => SvgPicture.asset(
                              policyQuoteListController
                                      .listQuotesModel[indexOfPlan].isPlanSaved
                                  ? AssetPath.like_selected
                                  : AssetPath.like)),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.all(8.w),
                        child: InkWell(
                          onTap: () {},
                          child: SvgPicture.asset(AssetPath.share),
                        ),
                      ),

                      Expanded(child: SizedBox()),
                      if (policyQuoteListController
                          .listQuotesModel[indexOfPlan].planOriginalPrice
                          .toString()
                          .isNotEmpty)
                        Text(
                            '₹${policyQuoteListController.listQuotesModel[indexOfPlan].planOriginalPrice}',
                            style: Ts.bold14(Colors.black).copyWith(
                                decoration: TextDecoration.lineThrough,
                                decorationColor: AppColors.red)),
                      SizedBox(
                        width: 8.w,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (policyQuoteListController.policyType ==
                              PolicyType.bikeInsurance) {
                            Get.to(TwoWheelerPlanSelectionView());
                          } else if (policyQuoteListController.policyType ==
                              PolicyType.carInsurance) {
                            Get.to(CarInaurancePlanSelectionView());
                          } else if (policyQuoteListController.policyType ==
                              PolicyType.healthInsurance) {
                            Get.to(HealthInsurancePlanSelectionView());
                          } else {
                            Get.to(HomeInsurancePlanSelectionView());
                          }
                        },
                        child: Text(
                            '₹${policyQuoteListController.listQuotesModel[indexOfPlan].planDiscountedPrice}',
                            style: Ts.regular15(Colors.white)),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      );
    } else if (policyQuoteListController.policyType ==
        PolicyType.homeInsurance) {
      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.h), color: Colors.white),
        margin: EdgeInsets.only(top: 8.h),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //upper
                  Row(
                    children: [
                      Container(
                        width: 100.w,
                        height: 30.h,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.w)),
                            image: DecorationImage(
                                image: Image.network(
                                  'https://iili.io/HO2R81j.png',
                                  errorBuilder: (_, __, ___) => Image.network(
                                      'https://iili.io/HO2R81j.png'),
                                ).image,
                                fit: BoxFit.fitHeight)),
                      ),
                      SizedBox(width: 10.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'United India Insurance',
                            style: Ts.bold14(AppColors.black),
                          ),
                          Text(
                            'NCB Super Premium',
                            style: Ts.regular12(AppColors.grey5),
                          ),
                        ],
                      )
                    ],
                  ),

                  SizedBox(
                    height: 10.h,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Cover amount',
                            style: Ts.regular12(AppColors.grey4),
                          ),
                          Text(
                            '₹5 Lakh',
                            style: Ts.bold14(Colors.black),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Policy Term',
                            style: Ts.regular12(AppColors.grey4),
                          ),
                          Text(
                            '1 Year',
                            style: Ts.bold14(Colors.black),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Claims Settled',
                            style: Ts.regular12(AppColors.grey4),
                          ),
                          Text(
                            '99%',
                            style: Ts.bold14(Colors.black),
                          ),
                        ],
                      )
                    ],
                  ),

                  SizedBox(
                    height: policyQuoteListController
                            .listQuotesModel[indexOfPlan]
                            .planDetailsList
                            .isEmpty
                        ? 0.0
                        : 15.h,
                  ),
                  //details points
                  Wrap(
                    alignment: WrapAlignment.start,
                    runSpacing: 10.h,
                    children: [
                      for (int i = 0;
                          i <
                              policyQuoteListController
                                  .listQuotesModel[indexOfPlan]
                                  .planDetailsList
                                  .length;
                          i++)
                        PolicyDetailPoints(
                            strText: policyQuoteListController
                                .listQuotesModel[indexOfPlan]
                                .planDetailsList[i])
                    ],
                  ),
                ],
              ),
            ),
            Container(
              //height: 50.h,
              margin: EdgeInsets.all(3.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.h),
                  color: AppColors.primaryColor.withOpacity(0.1)),
              child: Column(
                children: [
                  if (policyQuoteListController.policyType ==
                      PolicyType.healthInsurance)
                    SizedBox(
                      height: 8.w,
                    ),

                  //discount & annually price for health insurance
                  if (policyQuoteListController.policyType ==
                      PolicyType.healthInsurance)
                    Row(
                      children: [
                        SizedBox(width: 12.w),
                        Container(
                          height: 20.h,
                          width: 20.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.h),
                              color: AppColors.green),
                          child: Icon(
                            Icons.percent,
                            color: AppColors.white,
                            size: 17.h,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          '5% Discount at checkout ',
                          style: Ts.regular12(AppColors.green),
                        ),
                        Spacer(),
                        Text('₹17464/annually',
                            style: Ts.regular12(AppColors.black)),
                        SizedBox(width: 8.w),
                      ],
                    ),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //comparison
                      InkWell(
                        onTap: () => policyQuoteListController
                            .onPlanCompareClick(indexOfPlan),
                        child: Obx(
                          () => Padding(
                            padding: EdgeInsets.only(
                                left: 12.w, right: 4.w, top: 8.h, bottom: 8.h),
                            child: SvgPicture.asset(
                              AssetPath.compare,
                              color: policyQuoteListController
                                      .listQuotesModel[indexOfPlan]
                                      .isPlanSelectedForCompare
                                  ? AppColors.primaryColor
                                  : AppColors.black,
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.all(8.w),
                        child: InkWell(
                          onTap: () => policyQuoteListController
                              .onPlanSaveClick(indexOfPlan),
                          child: Obx(() => SvgPicture.asset(
                              policyQuoteListController
                                      .listQuotesModel[indexOfPlan].isPlanSaved
                                  ? AssetPath.like_selected
                                  : AssetPath.like)),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.all(8.w),
                        child: InkWell(
                          onTap: () {},
                          child: SvgPicture.asset(AssetPath.share),
                        ),
                      ),

                      Expanded(child: SizedBox()),
                      if (policyQuoteListController
                          .listQuotesModel[indexOfPlan].planOriginalPrice
                          .toString()
                          .isNotEmpty)
                        Text(
                            '₹${policyQuoteListController.listQuotesModel[indexOfPlan].planOriginalPrice}',
                            style: Ts.bold14(Colors.black).copyWith(
                                decoration: TextDecoration.lineThrough,
                                decorationColor: AppColors.red)),
                      SizedBox(
                        width: 8.w,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (policyQuoteListController.policyType ==
                              PolicyType.bikeInsurance) {
                            Get.to(TwoWheelerPlanSelectionView());
                          } else if (policyQuoteListController.policyType ==
                              PolicyType.carInsurance) {
                            Get.to(CarInaurancePlanSelectionView());
                          } else if (policyQuoteListController.policyType ==
                              PolicyType.healthInsurance) {
                            Get.to(HealthInsurancePlanSelectionView());
                          } else {
                            Get.to(HomeInsurancePlanSelectionView());
                          }
                        },
                        child: Text(
                            '₹${policyQuoteListController.listQuotesModel[indexOfPlan].planDiscountedPrice}',
                            style: Ts.regular15(Colors.white)),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      );
    } else if (policyQuoteListController.policyType ==
        PolicyType.carInsurance) {
      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.h), color: Colors.white),
        margin: EdgeInsets.only(top: 8.h),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //upper
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 100.w,
                        height: 30.h,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.w)),
                            image: DecorationImage(
                                image: Image.network(
                                  policyQuoteListController
                                      .listQuotesModel[indexOfPlan].planImage,
                                  errorBuilder: (_, __, ___) => Image.network(
                                      'https://iili.io/HO2R81j.png'),
                                ).image,
                                fit: BoxFit.fitHeight)),
                      ),
                      Column(
                        children: [
                          Text(
                            'IDV',
                            style: Ts.regular12(AppColors.grey4),
                          ),
                          Text(
                            '₹${policyQuoteListController.listQuotesModel[indexOfPlan].planIDV}',
                            style: Ts.bold14(Colors.black),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Claims Settled',
                            style: Ts.regular12(AppColors.grey4),
                          ),
                          Text(
                            '${policyQuoteListController.listQuotesModel[indexOfPlan].claimSettled}%',
                            style: Ts.bold14(Colors.black),
                          ),
                        ],
                      )
                    ],
                  ),

                  SizedBox(
                    height: policyQuoteListController
                            .listQuotesModel[indexOfPlan]
                            .planDetailsList
                            .isEmpty
                        ? 0.0
                        : 15.h,
                  ),
                  //details points
                  Wrap(
                    alignment: WrapAlignment.start,
                    runSpacing: 10.h,
                    children: [
                      for (int i = 0;
                          i <
                              policyQuoteListController
                                  .listQuotesModel[indexOfPlan]
                                  .planDetailsList
                                  .length;
                          i++)
                        PolicyDetailPoints(
                            strText: policyQuoteListController
                                .listQuotesModel[indexOfPlan]
                                .planDetailsList[i])
                    ],
                  ),
                ],
              ),
            ),
            Container(
              //height: 50.h,
              margin: EdgeInsets.all(3.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.h),
                  color: AppColors.primaryColor.withOpacity(0.1)),
              child: Column(
                children: [
                  if (policyQuoteListController.policyType ==
                      PolicyType.healthInsurance)
                    SizedBox(
                      height: 8.w,
                    ),

                  //discount & annually price for health insurance
                  if (policyQuoteListController.policyType ==
                      PolicyType.healthInsurance)
                    Row(
                      children: [
                        SizedBox(width: 12.w),
                        Container(
                          height: 20.h,
                          width: 20.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.h),
                              color: AppColors.green),
                          child: Icon(
                            Icons.percent,
                            color: AppColors.white,
                            size: 17.h,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          '5% Discount at checkout ',
                          style: Ts.regular12(AppColors.green),
                        ),
                        Spacer(),
                        Text('₹17464/annually',
                            style: Ts.regular12(AppColors.black)),
                        SizedBox(width: 8.w),
                      ],
                    ),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //comparison
                      InkWell(
                        onTap: () => policyQuoteListController
                            .onPlanCompareClick(indexOfPlan),
                        child: Obx(
                          () => Padding(
                            padding: EdgeInsets.only(
                                left: 12.w, right: 4.w, top: 8.h, bottom: 8.h),
                            child: SvgPicture.asset(
                              AssetPath.compare,
                              color: policyQuoteListController
                                      .listQuotesModel[indexOfPlan]
                                      .isPlanSelectedForCompare
                                  ? AppColors.primaryColor
                                  : AppColors.black,
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.all(8.w),
                        child: InkWell(
                          onTap: () => policyQuoteListController
                              .onPlanSaveClick(indexOfPlan),
                          child: Obx(() => SvgPicture.asset(
                              policyQuoteListController
                                      .listQuotesModel[indexOfPlan].isPlanSaved
                                  ? AssetPath.like_selected
                                  : AssetPath.like)),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.all(8.w),
                        child: InkWell(
                          onTap: () {},
                          child: SvgPicture.asset(AssetPath.share),
                        ),
                      ),

                      Expanded(child: SizedBox()),
                      if (policyQuoteListController
                          .listQuotesModel[indexOfPlan].planOriginalPrice
                          .toString()
                          .isNotEmpty)
                        Text(
                            '₹${policyQuoteListController.listQuotesModel[indexOfPlan].planOriginalPrice}',
                            style: Ts.bold14(Colors.black).copyWith(
                                decoration: TextDecoration.lineThrough,
                                decorationColor: AppColors.red)),
                      SizedBox(
                        width: 8.w,
                      ),
                      ElevatedButton(
                        onPressed: () => policyQuoteListController
                            .onPolicyClick(policyQuoteListController
                                .listQuotesModel[indexOfPlan]),
                        child: Text(
                            '₹${policyQuoteListController.listQuotesModel[indexOfPlan].planDiscountedPrice}',
                            style: Ts.regular15(Colors.white)),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}

class PolicyDetailPoints extends StatelessWidget {
  String strText;
  PolicyDetailPoints({this.strText = '', Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.w),
          border: Border.all(color: AppColors.grey2, width: 1)),
      margin: EdgeInsets.only(right: 10.w),
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
      child: Text(
        strText,
        style: Ts.regular12(AppColors.grey4),
      ),
    );
  }
}
