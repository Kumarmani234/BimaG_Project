// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../utility/colors.dart';
import '../../../../../../utility/ts.dart';

// status 1 = unSelectedTab
// status 2 = selectedTab
// status 3 = itemSelectedForTab

class CustomButton extends StatelessWidget {
  final String text;
  int status;
  final onTabClick;
  CustomButton({
    Key? key,
    required this.text,
    required this.status,
    required this.onTabClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 104.w,
      height: 20.h,
      margin: EdgeInsets.only(right: 8.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Material(
        color: Colors.transparent,
        child: Ink(
          child: InkWell(
            onTap: onTabClick,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.white,
                  // width: 84.w,
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(top: 8.h),
                          child: Text(
                            text,
                            overflow: TextOverflow.ellipsis,
                            style: Ts.bold13(fetchColor()),
                          ),
                        ),
                      ),
                      if (status == 3)
                        Padding(
                          padding: EdgeInsets.only(top: 8.h),
                          child: Icon(
                            Icons.check_circle_outline,
                            size: 18,
                            color: fetchColor(),
                          ),
                        )
                    ],
                  ),
                ),
                Spacer(),
                Container(
                  height: 2.h,
                  width: 100.w,
                  clipBehavior: Clip.none,
                  decoration: BoxDecoration(
                    color: fetchColor(),
                    borderRadius: BorderRadius.circular(30),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color fetchColor() {
    if (status == 1) {
      return AppColors.grey3;
    }

    if (status == 2) {
      return AppColors.secondaryColor;
    }

    if (status == 3) {
      return AppColors.green;
    }
    return AppColors.primaryColor;
  }
}
