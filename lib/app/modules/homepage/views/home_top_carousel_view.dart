import 'package:bima_g/utility/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/homepage_controller.dart';

class HomeTopCarouselView extends GetView {
  final homeController = Get.put(HomepageController());
  @override
  Widget build(BuildContext context) {
    // return Image.network('https://iili.io/HNzkk8v.png');
    return Column(
      children: [
        SizedBox(height: 25.h),
        Stack(
          children: [
            Container(
              height: 60.h,
              margin: EdgeInsets.symmetric(horizontal: 60.w),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryColor.withOpacity(0.6),
                    spreadRadius: 1,
                    blurRadius: 70,
                    offset: Offset(0, 30.h), // changes position of shadow
                  ),
                ],
              ),
            ),
            Column(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                      //height: 110.h,
                      aspectRatio: 3.8.w,
                      viewportFraction: 1.0.w,
                      enableInfiniteScroll: false,
                      autoPlay: true,
                      scrollPhysics: BouncingScrollPhysics(),
                      onPageChanged: (index, reason) {
                        homeController.currentIndexOfTopCarousel.value = index;
                      }),
                  items: [1, 2, 3, 4, 5].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Image.network(
                          'https://iili.io/HNzkk8v.png',
                          fit: BoxFit.contain,
                        );
                      },
                    );
                  }).toList(),
                ),
                SizedBox(height: 15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < 5; i++)
                      Obx(() => Container(
                          width:
                              homeController.currentIndexOfTopCarousel.value ==
                                      i
                                  ? 18.w
                                  : 6.h,
                          height: 6.h,
                          margin: EdgeInsets.symmetric(horizontal: 3.w),
                          decoration: BoxDecoration(
                              color: homeController
                                          .currentIndexOfTopCarousel.value ==
                                      i
                                  ? AppColors.primaryColor
                                  : AppColors.grey3,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.w)))))
                  ],
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
