// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../utility/asset_paths.dart';
import '../../../../utility/colors.dart';
import '../../../../utility/ts.dart';

class AddAddressMemberView extends GetView {
  @override
  AddAddressMemberView({
    required this.title,
    required this.userName,
    required this.heading,
    required this.description,
    required this.imageUrl,
    required this.onDelete,
    required this.onEdit,
  });

  final String title;
  final String userName;
  final String heading;
  final String description;
  final String imageUrl;
  final onDelete;
  final onEdit;
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.w),
        color: AppColors.white,
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: Ts.regular12(AppColors.grey4),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      userName,
                      style: Ts.bold14(AppColors.secondaryColor),
                    ),
                  ],
                ),
                Spacer(),
                Material(
                  color: Colors.transparent,
                  child: Ink(
                    child: InkWell(
                      onTap: onEdit,
                      child: SvgPicture.asset(
                        key:Key('address_edit_key'),
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
            Text(
              heading,
              style: Ts.regular12(AppColors.grey4),
            ),
            SizedBox(height: 4.h),
            Text(
              description,
              style: Ts.bold14(AppColors.secondaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
