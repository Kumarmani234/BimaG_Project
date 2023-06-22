import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../../utility/colors.dart';
import '../../../../../../../utility/ts.dart';

class DetailsTabGridView extends GetView {
  DetailsTabGridView({
    required this.isChecked,
    required this.title_text,
    required this.subtitle_text,
    this.onCheck,
  });

  final bool isChecked;
  final String title_text;
  final String subtitle_text;
  final onCheck;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.grey2),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 11.h),
        child: InkWell(
          onTap: onCheck,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: onCheck,
                child: Container(
                  height: 20.h,
                  width: 20.w,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.w),
                    border: Border.all(
                      color:
                          isChecked ? AppColors.primaryColor : AppColors.grey5,
                    ),
                    color:
                        isChecked ? AppColors.primaryColor : Colors.transparent,
                  ),
                  child: isChecked
                      ? Icon(
                          Icons.done,
                          color: Colors.white,
                          size: 16.h,
                        )
                      : null,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title_text,
                      style: Ts.bold13(AppColors.secondaryColor),
                    ),
                    SizedBox(height: 6.h),
                    Container(
                      child: Text(
                        subtitle_text,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Ts.regular12(AppColors.grey5),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
