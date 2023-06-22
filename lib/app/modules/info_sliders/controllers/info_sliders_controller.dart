import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfoSlidersController extends GetxController {
  RxInt currentPage = 0.obs;
  Rx<int> currentIndexOfTopCarousel = 0.obs;
  Rx<PageController> pageController = PageController().obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void onPageChanged(int page) {
    currentPage.value = page;
  }

  void onClick() {
    currentPage.value = currentPage.value + 1;
    currentIndexOfTopCarousel.value = currentIndexOfTopCarousel.value + 1;

    print('current page : ${currentPage.value}');
  }
}
