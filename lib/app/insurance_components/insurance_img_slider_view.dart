import 'package:bima_g/utility/asset_paths.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../utility/colors.dart';

class InsuranceImgSliderView extends GetView {
  final RxInt currentIndexOfTopCarousel;
  final List<String> imagePath;

  InsuranceImgSliderView({
    required this.currentIndexOfTopCarousel,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1.0,
            enableInfiniteScroll: false,
            scrollPhysics: BouncingScrollPhysics(),
            onPageChanged: (index, reason) {
              currentIndexOfTopCarousel.value = index;
            },
          ),
          items: imagePath.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Image.network(i, errorBuilder: (_,__,___)=>SvgPicture.asset(AssetPath.bike_insurance),);
              },
            );
          }).toList(),
        ),
        SizedBox(height: 15.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < 5; i++)
              Obx(
                () => Container(
                  width: currentIndexOfTopCarousel.value == i ? 18.w : 6.h,
                  height: 6.h,
                  margin: EdgeInsets.symmetric(horizontal: 3.w),
                  decoration: BoxDecoration(
                    color: currentIndexOfTopCarousel.value == i
                        ? AppColors.primaryColor
                        : AppColors.grey3,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30.w),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
