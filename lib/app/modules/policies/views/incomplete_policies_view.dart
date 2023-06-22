import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/modules/policies/views/incomplete_policies_verticle_view_all_view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../utility/colors.dart';
import '../../../../utility/ts.dart';
import 'incomplete_policy_item_view.dart';

class IncompletePoliciesView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15.h, left: 15.w, right: 15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 25.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'incomplete_policies'.tr,
                style: Ts.bold14(Colors.black),
              ),
              InkWell(
                  onTap: () {
                    HapticFeedback.mediumImpact();
                    Get.to(IncompletePoliciesVerticalViewAllView());
                  },
                  child: Text('view_all'.tr,
                      style: Ts.semiBold15(AppColors.primaryColor))),
            ],
          ),

          SizedBox(height: 20.h),

          //horizontal list for incomplete policies
          Container(
            height: 115.h,
            width: MediaQuery.of(context).size.width,
            child: Obx(
              () => CarouselSlider(
                options: CarouselOptions(
                  pageSnapping: true,
                  enableInfiniteScroll: false,
                  padEnds: false,
                  viewportFraction: 1.0,
                  scrollPhysics: BouncingScrollPhysics(),
                  onPageChanged: (index, reason) {
                    homepageController.currentIndexOfIncompletePolicies.value =
                        index;
                  },
                ),
                items: policiesController.listInCompletedPolicies.map(
                  (policy) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Padding(
                          padding: EdgeInsets.only(right: 8.h),
                          child: IncompletePolicyItemView(
                            incompletePolicyModel: policy,
                          ),
                        );
                      },
                    );
                  },
                ).toList(),
              ),
            ),
          ),

          SizedBox(height: 10.h),

          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                for (int i = 0;
                    i < policiesController.listInCompletedPolicies.length;
                    i++)
                  Container(
                    width: homepageController
                                .currentIndexOfIncompletePolicies.value ==
                            i
                        ? 16.w
                        : 4.h,
                    height: 4.h,
                    margin: EdgeInsets.symmetric(horizontal: 2.w),
                    decoration: BoxDecoration(
                      color: homepageController
                                  .currentIndexOfIncompletePolicies.value ==
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
        ],
      ),
    );
  }
}
