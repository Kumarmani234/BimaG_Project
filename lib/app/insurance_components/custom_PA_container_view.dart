import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../utility/colors.dart';
import '../../utility/ts.dart';

class PADriverGridView extends GetView {
  PADriverGridView({
    required this.isSelected,
    required this.price_text,
    required this.title,
    this.onChecked,
  });

  final String title;
  final String price_text;
  final bool isSelected;
  final onChecked;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68.h,
      width: 93.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isSelected ? AppColors.primaryColor : AppColors.grey3,
        ),
      ),
      child: InkWell(
        onTap: onChecked,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Ts.bold14(AppColors.grey4),
              ),
              Spacer(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    price_text,
                    style: Ts.bold14(isSelected
                        ? AppColors.primaryColor
                        : AppColors.secondaryColor),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: onChecked,
                    child: Container(
                      height: 20.h,
                      width: 20.h,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isSelected
                              ? AppColors.primaryColor
                              : AppColors.grey5,
                        ),
                        color: isSelected
                            ? AppColors.primaryColor
                            : Colors.transparent,
                      ),
                      child: isSelected
                          ? Icon(
                              Icons.done,
                              color: Colors.white,
                              size: 16.sp,
                            )
                          : null,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
