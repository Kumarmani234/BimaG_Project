import 'package:bima_g/app/modules/homepage/controllers/homepage_controller.dart';
import 'package:bima_g/app/modules/insurance_appbar/views/insurance_appbar_view.dart';
import 'package:bima_g/app/modules/profile/views/EditMyProfile/tabs/policy_tab_view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../utility/colors.dart';
import '../../../../utility/ts.dart';
import '../../../module_controllers.dart';
import '../../policies/views/purchased_policy_item_view.dart';

class YourPoliciesView extends GetView {
  final homeController = Get.put(HomepageController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 25.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'your_policies'.tr,
                style: Ts.bold14(Colors.black),
              ),
              InkWell(
                onTap: ()=>Get.to(Scaffold(
                  appBar: PreferredSize(
                    child: InsuranceAppbarView(
                      title: 'your_policies'.tr,
                    ),
                    preferredSize: Size.fromHeight(55.h),
                  ),
                  body: PolicyTabView(),
                )),
                child: Text(
                  'view_all'.tr,
                  style: Ts.semiBold15(AppColors.primaryColor),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),

          //horizontal list for purchased policies

          Container(
            height: 167.h,
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
                      homeController.currentIndexOfYourPolicies.value = index;
                    }),
                items: policiesController.listRecentPolicies.map(
                  (policy) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Padding(
                          padding: EdgeInsets.only(right: 8.h),
                          child: PurchasesPoliciesItem(
                            purchasedPolicyModel: policy,
                            onClick: () {},
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
                    i < policiesController.listRecentPolicies.length;
                    i++)
                  Container(
                    width: homeController.currentIndexOfYourPolicies.value == i
                        ? 16.w
                        : 4.h,
                    height: 4.h,
                    margin: EdgeInsets.symmetric(horizontal: 2.w),
                    decoration: BoxDecoration(
                      color:
                          homeController.currentIndexOfYourPolicies.value == i
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
