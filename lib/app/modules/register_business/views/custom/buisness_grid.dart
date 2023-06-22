// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:bima_g/utility/colors.dart';
import 'package:bima_g/utility/styles.dart';
import 'package:bima_g/utility/ts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../widgets/checkboxes.dart';
import '../../model/reg_business_personal_info_modal.dart';

class BusinessGrid extends StatelessWidget {
  RegisterBusinessPerInfoModel? registerBusinessPerInfoModel;
  final onClick;
  BusinessGrid({this.onClick, this.registerBusinessPerInfoModel, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16)),
        border: registerBusinessPerInfoModel!.isSelected
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
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Row(
                children: [
                  SvgPicture.asset(
                    registerBusinessPerInfoModel!.assetImage,
                    color: registerBusinessPerInfoModel!.isSelected
                        ? AppColors.primaryColor
                        : Colors.black,
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          registerBusinessPerInfoModel!.title,
                          style: Ts.bold15(AppColors.secondaryColor),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          registerBusinessPerInfoModel!.subtitle,
                          style: Ts.regular12(AppColors.grey4),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 16.w),
                  RoundCheckBox(
                    onChange: null,
                    isChecked: registerBusinessPerInfoModel!.isSelected,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
