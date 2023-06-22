// ignore_for_file: must_be_immutable

import 'package:bima_g/app/modules/policies/views/offline_policies_view.dart';
import 'package:bima_g/app/routes/app_pages.dart';
import 'package:bima_g/utility/colors.dart';
import 'package:bima_g/utility/ts.dart';
import 'package:bima_g/utility/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../topbar_authentication/views/topbar_authentication_view.dart';
import '../controllers/info_sliders_controller.dart';
import '../models/page_view_modal.dart';

class InfoSlidersView extends GetView<InfoSlidersController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 40.h),
          TopbarAuthenticationView(
            isShowLogo: true,
          ),
          SizedBox(height: 100.h),
          Expanded(
            child: PageView.builder(
              physics: BouncingScrollPhysics(),
              controller: controller.pageController.value,
              itemCount: PageViewList.length,
              onPageChanged: (index) {
                controller.onPageChanged(index);
                controller.currentIndexOfTopCarousel.value = index;
              },
              itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left: 24.0.w, right: 24.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        PageViewList[index].image_url,
                      ),
                      SizedBox(height: 15.h),
                      RichText(
                        text: TextSpan(
                          text: PageViewList[index].title + " ",
                          style: Ts.medium24(AppColors.secondaryColor),
                          children: <TextSpan>[
                            TextSpan(
                              text: PageViewList[index].spantext,
                              style: Ts.medium24(AppColors.primaryColor),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        PageViewList[index].subtitle,
                        style: Ts.regular15(AppColors.grey4),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24, bottom: 55),
            child: Row(
              children: [
                for (int i = controller.currentPage.value; i < 4; i++)
                  Obx(
                    () => Container(
                      width: controller.currentIndexOfTopCarousel.value == i
                          ? 18.w
                          : 6.h,
                      height: 6.h,
                      margin: EdgeInsets.symmetric(horizontal: 3.w),
                      decoration: BoxDecoration(
                        color: controller.currentIndexOfTopCarousel.value == i
                            ? AppColors.primaryColor
                            : AppColors.grey3,
                        borderRadius: BorderRadius.all(
                          Radius.circular(30.w),
                        ),
                      ),
                    ),
                  )
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Obx(
        () => Stack(
          alignment: Alignment.center,
          children: [
            CustomCircularProgess(
              color: AppColors.lightTheemColor,
            ),
            TweenAnimationBuilder<double>(
              duration: const Duration(milliseconds: 300),
              tween: Tween<double>(
                begin: controller.currentPage.value / PageViewList.length,
                end: (controller.currentPage.value + 1) / PageViewList.length,
              ),
              builder: (BuildContext context, double value, Widget? child) {
                return CustomCircularProgess(
                  progress: value,
                );
              },
            ),
            NextButton(
              pageViewController: controller,
              pageController: controller.pageController.value,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCircularProgess extends StatelessWidget {
  final Color? color;
  final double progress;
  const CustomCircularProgess({
    super.key,
    this.color,
    this.progress = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72.h,
      width: 72.h,
      child: CircularProgressIndicator(
        value: progress,
        color: color,
        strokeWidth: 1,
      ),
    );
  }
}

class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
    required this.pageViewController,
    required PageController pageController,
  }) : _pageController = pageController;

  final InfoSlidersController pageViewController;
  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      key: Key('info_sliders_key'),
      elevation: 0,
      onPressed: () async {
        int nextPage = pageViewController.currentPage.value + 1;
        if (nextPage < PageViewList.length) {
          _pageController.animateToPage(nextPage,
              duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
          pageViewController.onPageChanged(nextPage);
        } else {
          if (await Utils.isInternetAvailable()) {
            Get.toNamed(Routes.AUTHENTICATION);
          } else {
            Get.to(OfflinePoliciesView(fromNoInternetConnection: true));
          }
        }
      },
      backgroundColor: AppColors.primaryColor,
      child: Center(
          child: SvgPicture.asset(
        'assets/svgs/arrow_right.svg',
      )),
    );
  }
}

final List<PageViewModal> PageViewList = [
  PageViewModal(
    title: 'slider1_title'.tr + '\n' + 'hour'.tr,
    spantext: 'slider1_span_text'.tr,
    subtitle: 'slider1_subtitle'.tr + '\n' + 'days_a_week_to_answer_u'.tr,
    image_url: 'assets/svgs/slider1.svg',
  ),
  PageViewModal(
    title: 'slider2_title'.tr + '\n' + 'prices'.tr,
    spantext: 'slider2_span_text'.tr,
    subtitle: 'slider2_subtitle'.tr,
    image_url: 'assets/svgs/slider2.svg',
  ),
  PageViewModal(
    title: 'slider3_title'.tr + '\n' + 'hundred_per'.tr,
    spantext: 'slider3_span_text'.tr,
    subtitle: 'slider3_subtitle'.tr,
    image_url: 'assets/svgs/slider3.svg',
  ),
  PageViewModal(
    title: 'slider4_title'.tr + '\n' + 'claim_made'.tr,
    spantext: 'slider4_span_text'.tr,
    subtitle: 'slider4_subtitle'.tr + '\n' + 'make_it_easy_for_u_claim'.tr,
    image_url: 'assets/svgs/slider4.svg',
  ),
];
