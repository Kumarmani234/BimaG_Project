// ignore_for_file: must_be_immutable

import 'package:bima_g/utility/colors.dart';
import 'package:bima_g/utility/ts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/insurance_appbar_controller.dart';

class InsuranceAppbarView extends GetView<InsuranceAppbarController> {
  String title, subTitle;
  List<Widget>? actions;
  bool isBottom;
  final bottom;
  double elevation;
  InsuranceAppbarView(
      {required this.title,
      this.actions,
      Key? key,
      this.isBottom = false,
      this.subTitle = '',
      this.bottom,
      this.elevation = 10.0})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: elevation,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              style: Ts.medium17(AppColors.secondaryColor),
            ),
            if (subTitle.isNotEmpty)
              Text(
                subTitle,
                style: Ts.medium13(AppColors.grey5),
              )
          ],
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 18,
            color: AppColors.secondaryColor,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        actions: actions ?? [],
        bottom: isBottom
            ? PreferredSize(
                preferredSize: Size.fromHeight(80.h),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 0,
                        blurRadius: 2,
                        offset: Offset(0, -2), // negative value in y-axis
                      ),
                    ],
                  ),
                  child: bottom,
                ),
              )
            : null,
      ),
    );
  }
}
