import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../utility/colors.dart';
import '../../utility/ts.dart';
import '../widgets/tooltip.dart';

class InsurancePlanSelectionView extends GetView {
  InsurancePlanSelectionView({
    required this.title_text,
    required this.isSelected,
    required this.subtitle_text,
    required this.price_text,
    this.onClick,
  });

  final String title_text;
  final String subtitle_text;
  final RxBool isSelected;
  final String price_text;
  final onClick;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.w),
          color: Colors.white,
          border: Border.all(
            color: isSelected.value ? AppColors.primaryColor : AppColors.grey2,
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: Ink(
            child: InkWell(
              onTap: onClick,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title_text,
                          style: Ts.bold15(AppColors.grey5),
                        ),
                        Spacer(),
                        Obx(
                          () => ToolTip(
                            message:
                                'Covers damages to your vehicle only and not third-party',
                            child: Container(
                              height: 19.5.h,
                              width: 19.5.w,
                              child: Icon(
                                Icons.info,
                                color: isSelected.value
                                    ? AppColors.primaryColor
                                    : AppColors.secondaryColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      subtitle_text,
                      style: Ts.regular12(AppColors.grey4),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 8.h),
                          child: Text(
                            price_text,
                            style: Ts.medium20(isSelected.value
                                ? AppColors.primaryColor
                                : AppColors.secondaryColor),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(top: 10.h),
                          child: Container(
                            height: 20.h,
                            width: 20.h,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isSelected.value
                                  ? AppColors.primaryColor
                                  : Colors.transparent,
                              border: Border.all(
                                color: isSelected.value
                                    ? AppColors.primaryColor
                                    : AppColors.grey4,
                              ),
                            ),
                            child: isSelected.value
                                ? InkWell(
                                    onTap: onClick,
                                    child: Icon(
                                      Icons.done,
                                      color: Colors.white,
                                      size: 15.h,
                                    ),
                                  )
                                : null,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
