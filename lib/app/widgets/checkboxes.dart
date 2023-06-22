// ignore_for_file: must_be_immutable

import 'package:bima_g/utility/asset_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../utility/colors.dart';
import '../../utility/ts.dart';

class RoundCheckBox extends StatelessWidget {
  final onChange;
  bool isChecked;
  RoundCheckBox({required this.onChange, required this.isChecked, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onChange,
        child: SvgPicture.asset(isChecked
            ? AssetPath.enabled_checkbox
            : AssetPath.disable_checkbox));
  }
}

class SquareCheckbox extends StatelessWidget {
  final onChange;
  bool isChecked;
  SquareCheckbox({this.onChange, required this.isChecked, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onChange,
      child: SvgPicture.asset(isChecked
          ? AssetPath.square_checkbox
          : AssetPath.disabled_square_checkbox),
    );
  }
}

class CheckboxWithTextIconView extends StatelessWidget {
  CheckboxWithTextIconView({
    required this.isSelected,
    this.onClick,
    this.imageUrl = '',
    required this.title_text,
    this.subtitle_text,
  });

  final RxBool isSelected;
  final onClick;
  final String imageUrl;

  final String title_text;
  final String? subtitle_text; // Changed to nullable String
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          border: Border.all(
            color:
                isSelected.value ? AppColors.primaryColor : Colors.transparent,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
          child: InkWell(
            onTap: onClick,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(imageUrl),
                SizedBox(width: 8.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title_text,
                      style: Ts.bold14(AppColors.grey5),
                    ),
                    if (subtitle_text != null && subtitle_text!.isNotEmpty)
                      Text(
                        subtitle_text!,
                        style: Ts.regular12(AppColors.grey5),
                      ),
                  ],
                ),
                Spacer(),
                Container(
                  height: 23.h,
                  width: 23.h,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected.value
                        ? AppColors.primaryColor
                        : Colors.transparent,
                    border: Border.all(
                        color: isSelected.value
                            ? AppColors.primaryColor
                            : AppColors.grey4),
                  ),
                  child: InkWell(
                    onTap: onClick,
                    child: isSelected.value
                        ? Icon(
                            Icons.done,
                            color: Colors.white,
                            size: 18.h,
                          )
                        : null,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CheckBoxWithImageIconBordered extends StatelessWidget {
  bool isSelected;
  final onClick;
  String title;
  Widget? prefixIcon;
  CheckBoxWithImageIconBordered(
      {required this.isSelected,
      required this.onClick,
      required this.title,
      this.prefixIcon,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.only(bottom: 15.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.h),
        border: Border.all(
            color: isSelected ? AppColors.primaryColor : AppColors.grey1),
      ),
      child: Material(
        color: Colors.transparent,
        child: Ink(
          child: InkWell(
            onTap: onClick,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
              child: Row(
                children: [
                  if (prefixIcon != null)
                    Padding(
                      padding: EdgeInsets.only(right: 12.w),
                      child: prefixIcon!,
                    ),
                  Text(title, style: Ts.bold14(AppColors.grey5)),
                  Spacer(),
                  RoundCheckBox(onChange: null, isChecked: isSelected)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
