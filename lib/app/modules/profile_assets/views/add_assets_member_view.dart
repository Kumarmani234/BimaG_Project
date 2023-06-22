// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../utility/asset_paths.dart';
import '../../../../utility/colors.dart';
import '../../../../utility/styles.dart';
import '../../../../utility/ts.dart';

class AddAssetsMemberView extends GetView {
  AddAssetsMemberView({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.key1,
    required this.key2,
    required this.key3,
    required this.val1,
    required this.val2,
    required this.val3,
    required this.onDelete,
    required this.onEdit,
  });

  final String title;
  final String subtitle;
  final String imageUrl;
  final String key1;
  final String key2;
  final String key3;
  final String val1;
  final String val2;
  final String val3;

  final onDelete;
  final onEdit;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.w),
        color: AppColors.white,
        boxShadow: [Styles.shadow()],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  child: SvgPicture.asset(imageUrl),
                  backgroundColor: AppColors.primaryColor.withOpacity(0.15),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Ts.regular12(AppColors.grey4),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        subtitle,
                        style: Ts.bold14(AppColors.secondaryColor),
                      ),
                    ],
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: Ink(
                    child: InkWell(
                      onTap: onEdit,
                      child: SvgPicture.asset(
                        AssetPath.edit_pencil,
                        color: AppColors.secondaryColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                Material(
                  color: Colors.transparent,
                  child: Ink(
                    child: InkWell(
                      onTap: onDelete,
                      child: SvgPicture.asset(
                        AssetPath.trash,
                        color: AppColors.red,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        key1,
                        style: Ts.regular12(AppColors.grey4),
                      ),
                      SizedBox(height: 3.h),
                      Text(
                        val1,
                        style: Ts.bold13(AppColors.secondaryColor),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        key2,
                        style: Ts.regular12(AppColors.grey4),
                      ),
                      SizedBox(height: 3.h),
                      Text(
                        val2,
                        style: Ts.bold13(AppColors.secondaryColor),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        key3,
                        style: Ts.regular12(AppColors.grey4),
                      ),
                      SizedBox(height: 3.h),
                      Text(
                        val3,
                        style: Ts.bold13(AppColors.secondaryColor),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
