import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/widgets/buttons.dart';
import 'package:bima_g/utility/colors.dart';
import 'package:bima_g/utility/ts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

class VerifyingNumberLoadingView extends GetView {
  const VerifyingNumberLoadingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Center(
          child: Container(
            height: Get.height,
            width: Get.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                CircularProgressIndicator(
                  color: Colors.white
                ),
                SizedBox(height: 15.h,),
                Text('Please wait we are verifying your number', style: Ts.medium14(Colors.white),),
                Spacer(),
                InkWell(
                  child: ElevatedButtonBimaG(
                    onClick: (){
                      HapticFeedback.mediumImpact();
                      authenticationController.apiTimer!.cancel();
                      Get.back();
                    }, text: 'Cancel',
                  ),
                ),
                SizedBox(height: 30.h)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
