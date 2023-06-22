// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:bima_g/utility/colors.dart';
import 'package:bima_g/utility/styles.dart';
import 'package:bima_g/utility/ts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../widgets/checkboxes.dart';
import '../controllers/languages_controller.dart';

class LanguageBox extends StatelessWidget {
  LanguageViewModel? languageViewModel;
  final onClick;
  LanguageBox({this.onClick, this.languageViewModel, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88.h,
      margin: EdgeInsets.only(bottom: 20.h),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16)),
        border: languageViewModel!.isSelected
            ? Border.all(color: AppColors.primaryColor)
            : null,
        boxShadow: [
          Styles.shadow(),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: Ink(
          child: InkWell(
            onTap: onClick,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(15.w),
                  child: SvgPicture.asset(
                    languageViewModel!.assetImage,
                    color: languageViewModel!.isSelected
                        ? AppColors.primaryColor
                        : Colors.black,
                  ),
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      languageViewModel!.title,
                      style: Ts.semiBold17(Colors.black),
                    ),
                    Text(
                      languageViewModel!.subtitle,
                      style: Ts.regular14(AppColors.grey4),
                    )
                  ],
                )),
                Padding(
                  padding: EdgeInsets.all(15.w),
                  child: RoundCheckBox(
                      onChange: null, isChecked: languageViewModel!.isSelected),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
