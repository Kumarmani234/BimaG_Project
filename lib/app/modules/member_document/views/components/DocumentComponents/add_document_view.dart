// ignore_for_file: deprecated_member_use, must_be_immutable

import 'dart:io';
import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/utility/asset_paths.dart';
import 'package:bima_g/utility/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../../../utility/colors.dart';
import '../../../../../../utility/ts.dart';

class AddDocumentView extends GetView {
  AddDocumentView(
      {required this.imageUrl,
      required this.documentType,
      required this.documentNo,
      required this.onEdit,
      required this.onDelete});

  final String imageUrl;
  final String documentType;
  final String documentNo;
  final onEdit;
  final onDelete;

  String filepath = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.w),
        color: AppColors.white,
        boxShadow: [
          Styles.shadow(),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: Ink(
          child: InkWell(
            onTap: () =>
                memberDocumentController.onPolicyDocumentTap(documentType),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
              child: Row(
                children: [
                  Container(
                    height: 35.h,
                    width: 35.h,
                    child: SvgPicture.asset(
                      AssetPath.profile_document2,
                    ),
                  ),
                 /* CircleAvatar(
                    radius: 20.w,
                    backgroundImage: SvgPicture.asset(
                      AssetPath.lang_panjabi,
                    ),
                  ),*/
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          documentType,
                          style: Ts.regular12(AppColors.grey4),
                        ),
                        SizedBox(height: 2.w),
                        Text(
                          documentNo,
                          style: Ts.bold13(AppColors.secondaryColor),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Material(
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
                  ),
                  SizedBox(width: 10.w),
                  Center(
                    child: Material(
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
