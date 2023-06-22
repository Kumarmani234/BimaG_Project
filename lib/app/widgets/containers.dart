
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utility/colors.dart';

roundContainer(child,{double verticalPadding = 6}){
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.w),
        color: AppColors.white
    ),
    padding: EdgeInsets.all(10.w),
    margin: EdgeInsets.symmetric(horizontal:15.w,vertical: verticalPadding.h),
    child: child,
  );
}