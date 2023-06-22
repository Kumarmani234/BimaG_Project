// ignore_for_file: deprecated_member_use

import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/utility/asset_paths.dart';
import 'package:bima_g/utility/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../../../../utility/colors.dart';
import '../../../../../../../utility/ts.dart';

class AddFamilyMemberView extends GetView {
  AddFamilyMemberView({
    required this.timeText,
    required this.memberName,
    required this.memberRelation,
    required this.onTap,
  });

  final String timeText;
  final String memberName;
  final String memberRelation;
  final onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 2.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.w),
        color: AppColors.white,
        boxShadow: [Styles.shadow()],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
        child: Row(
          children: [
            Container(
              height: 40.h,
              width: 40.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.w),
                color: AppColors.primaryColor.withOpacity(0.2),
              ),
              child: Center(
                child: Text(
                  timeText,
                  style: Ts.regular12(AppColors.primaryColor),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    memberName,
                    style: Ts.bold13(AppColors.secondaryColor),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    memberRelation,
                    style: Ts.regular12(AppColors.grey4),
                  ),
                ],
              ),
            ),
            Center(
              child: Material(
                color: Colors.transparent,
                child: Ink(
                  child: InkWell(
                    onTap: onTap,
                    child: SvgPicture.asset(
                      key:Key('family_member_edit_key'),
                      AssetPath.edit_pencil,
                      color: AppColors.secondaryColor,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Center(
              child: Material(
                color: Colors.transparent,
                child: Ink(
                  child: InkWell(
                    onTap: () => profileFamilyController.deleteFamilyMember(),
                    child: SvgPicture.asset(
                      AssetPath.trash,
                      color: AppColors.red,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
