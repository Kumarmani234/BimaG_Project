import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utility/colors.dart';
import '../../utility/ts.dart';

class CustomBottomSheet {
  String title;
  Function? onCloseCallback;
  bool? isScrollControlled;
  CustomBottomSheet(
      {required this.title, this.onCloseCallback, this.isScrollControlled});
  showBottomSheet(widget) {
    showModalBottomSheet(
      isScrollControlled: isScrollControlled ?? false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16.w),
          topLeft: Radius.circular(16.w),
        ),
      ),
      context: Get.context!,
      builder: (ctx) => Padding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(Get.context!).viewInsets.bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 4.h,
              width: 48.w,
              decoration: BoxDecoration(
                color: AppColors.grey2,
                borderRadius: BorderRadius.circular(20.w),
              ),
              margin: EdgeInsets.all(15.h),
            ),

            //title and close button
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: Ts.semiBold17(Colors.black),
                  ),
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: Icon(
                      Icons.cancel_outlined,
                      color: AppColors.grey5,
                    ),
                  ),
                ],
              ),
            ),

            widget,

            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
        //.then((value) => onCloseCallback!(true));
  }
}
