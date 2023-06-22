import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../utility/colors.dart';

class LoadingBimaG extends StatelessWidget {
  const LoadingBimaG({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CupertinoActivityIndicator(
      color: AppColors.primaryColor,
      radius: 15,
    ));
  }
}

class FullScreenLoading extends StatelessWidget {
  FullScreenLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      color: AppColors.black.withOpacity(0.6),
      child: Center(
          child: CupertinoActivityIndicator(
        color: AppColors.white,
        radius: 25,
      )),
    );
  }
}
